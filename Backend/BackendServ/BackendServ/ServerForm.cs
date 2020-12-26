using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Forms;

namespace BackendServ
{
    public partial class ServerForm : Form
    {
        private const int SERVER_PORT = 3090;

        private const string CATNET_USER_AGENT = "CatNet/1.0 (Hello; There; Meow)";

        private string TitleFormat { get; set; } = string.Empty;

        private void UpdateEmpNum(int num) => Text = string.Format(TitleFormat, num);

        public ServerForm()
        {
            InitializeComponent();
        }

        private void ListenWorker_DoWork(object sender, DoWorkEventArgs e)
        {
            // setup http listener.
            if (!HttpListener.IsSupported)
            {
                e.Result = "HttpListener is not supported on your OS.";
                return;
            }

            HttpListener http = new HttpListener();
            try
            {
                http.Prefixes.Add($"http://localhost:{SERVER_PORT}/");
                http.Start();
            }
            catch (Exception exc)
            {
                e.Result = exc.Message;
                return;
            }

            // make a pseudo random generator.
            Random rnd = new Random();
            rnd.Next();

            BackgroundWorker self = sender as BackgroundWorker;
            int counter = 1;

            List<IPAddress> blocked = new List<IPAddress>();
            List<string> allIPs = new List<string>();
            List<int> gennedIDs = new List<int>();

            while (true)
            {
                // obtain responses and stuff.
                HttpListenerContext context = http.GetContext();
                HttpListenerRequest request = context.Request;
                HttpListenerResponse response = context.Response;
                Stream output = response.OutputStream;
                Stream input = request.InputStream;

                response.ContentType = "application/x-www-form-urlencoded";
                response.ContentEncoding = Encoding.UTF8;
                response.StatusCode = (int)HttpStatusCode.OK;

                // if blocked ip is trying again...
                bool cont = false;
                foreach (var endpoint in blocked)
                {
                    if (endpoint.Equals(request.RemoteEndPoint.Address))
                    {
                        // update the RNG so it gets stronger.
                        rnd.Next();

                        Console.WriteLine("Blocked IP trying again huh... " + endpoint.ToString());
                        output.WriteString("status=success&reason=ok");
                        output.Close();
                        cont = true;
                        break;
                    }
                }
                if (cont) continue;

                switch (request.Url.AbsolutePath)
                {
                    case "/register":
                        {
                            // get values.
                            var nvc = HttpUtility.ParseQueryString(input.ReadToEnd());
                            string employeename = nvc["username"];
                            string ipport = nvc["ipport"];
                            string iponly = ipport.Substring(0, ipport.IndexOf(':'));

                            bool stop = false;
                            foreach (string ip in allIPs)
                            {
                                if (iponly == ip)
                                {
                                    // oh.
                                    output.WriteString("status=denied&id=0");
                                    output.Close();
                                    stop = true;
                                    Console.WriteLine("Access denied for " + ipport);
                                    break;
                                }
                            }
                            if (stop) continue;

                            Console.WriteLine("Adding " + iponly);
                            allIPs.Add(iponly);

                            // generate a totally unique random emp id.
                            int id = 0;
                            int bob = 100;
                            do
                            {
                                Console.WriteLine("Generating employee id...");
                                id = bob + rnd.Next(bob, int.MaxValue / bob);
                            }
                            while (gennedIDs.IndexOf(id) != -1);

                            gennedIDs.Add(id);

                            // construct info struct
                            EmployeeInfo info = new EmployeeInfo(counter, id, employeename, ipport);

                            // return response
                            output.WriteString("status=success&id=" + id.ToString());

                            // send it to the ProgressChanged method.
                            self.ReportProgress(0, info);
                            counter++;
                            
                            break;
                        }

                    case "/updatetime":
                        {
                            // update the RNG so it gets stronger.
                            rnd.Next();

                            // lol.
                            Console.WriteLine("Updating time...");

                            // parse client.
                            string query = input.ReadToEnd();
                            var nvc = HttpUtility.ParseQueryString(query);
                            if (nvc["time"] == "ABUSE") // abuse detection worked.
                            {
                                blocked.Add(request.RemoteEndPoint.Address);
                                Console.WriteLine("ABUSE DETECTED! " + request.RemoteEndPoint.ToString());
                            }
                            else
                            {
                                int _newtime = -1, _empid = -1;
                                if (!int.TryParse(nvc["time"], out _newtime))
                                {
                                    output.WriteString("status=failure&reason=InvalidTime");
                                    output.Close();
                                    continue;
                                }
                                else if (!int.TryParse(nvc["employeeid"], out _empid))
                                {
                                    output.WriteString("status=failure&reason=InvalidEmployeeId");
                                    output.Close();
                                    continue;
                                }

                                output.WriteString("status=success&reason=ok");

                                // construct update struct.
                                UpdateInfo uinfo = new UpdateInfo(_newtime, _empid);

                                // report to UI
                                self.ReportProgress(1, uinfo);
                            }

                            // we're done.
                            output.WriteString("status=success&reason=ok");
                            break;
                        }

                    case "/leaderboard":
                        {
                            Leaderboard lbret = (Leaderboard)MainListView.Invoke((Func<Leaderboard>)delegate
                            {
                                Leaderboard lb = new Leaderboard
                                {
                                    employees = new Employee[MainListView.Items.Count]
                                };

                                int i = 0;
                                foreach (ListViewItem lvi in MainListView.Items)
                                {
                                    if (lvi.SubItems[2].Text == "-1") continue;

                                    lb.employees[i] = new Employee
                                    {
                                        id = lvi.Text,
                                        best_time = lvi.SubItems[2].Text
                                    };
                                    i++;
                                }

                                return lb;
                            });

                            string lbstring = JsonConvert.SerializeObject(lbret);
                            byte[] lbrawstring = Encoding.UTF8.GetBytes(lbstring);

                            response.ContentType = "application/json";
                            response.ContentLength64 = lbrawstring.LongLength;
                            output.WriteString(lbstring);
                            break;
                        }

                    default:
                        {
                            Console.WriteLine("Unsupported method, ignoring...");
                            break;
                        }
                }

                output.Close();
            }
        }

        private void NotifyNewEmp(string id, string name, string ip)
        {
            string text = $"Employee ID: {id}{Environment.NewLine}Name: {name}{Environment.NewLine}IP Address/Port: {ip}";
            string title = "New Employee!";
            ClientNotifyIcon.BalloonTipText = text;
            ClientNotifyIcon.BalloonTipTitle = title;
            ClientNotifyIcon.ShowBalloonTip(10000);
        }

        private void ServerForm_Shown(object sender, EventArgs e)
        {
            TitleFormat = Text;
            UpdateEmpNum(0);
            ListenWorker.RunWorkerAsync();
            Console.WriteLine("Worker started...");
        }


        private void ListenWorker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {

            if (e.ProgressPercentage == 0)
            {
                EmployeeInfo info = (EmployeeInfo)e.UserState;

                int id = info.id;
                string name = info.name;
                foreach (ListViewItem v in MainListView.Items)
                {
                    if (v.SubItems[1].Text == name)
                    {
                        Console.WriteLine("Found duplicate employee name, changing a little bit...");
                        name += "_" + id.ToString();
                    }
                }

                var item = new ListViewItem(id.ToString());
                item.SubItems.Add(name);
                item.SubItems.Add("-1");
                item.SubItems.Add(info.pc);

                MainListView.BeginUpdate();
                MainListView.Items.Add(item);
                MainListView.EndUpdate();

                Console.WriteLine($"Added {info.counter} employee...");
                UpdateEmpNum(info.counter);
                NotifyNewEmp(id.ToString(), name, info.pc);
            }
            else if (e.ProgressPercentage == 1)
            {
                UpdateInfo info = (UpdateInfo)e.UserState;

                MainListView.BeginUpdate();
                foreach (ListViewItem items in MainListView.Items)
                {
                    if (items.Text == info.id.ToString())
                    {
                        int t = int.Parse(items.SubItems[2].Text);
                        if (t == -1 || info.newtime < t)
                        {
                            Console.WriteLine($"Updating best time for employee {items.Text} was {t}...");
                            items.SubItems[2].Text = info.newtime.ToString();
                        }
                        else
                        {
                            Console.WriteLine($"New time is worse than the current time for {items.Text} it's {info.newtime} / {t}");
                        }
                        break;
                    }
                }
                MainListView.EndUpdate();
            }
        }

        private void ListenWorker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            MessageBox.Show("Fatal Error: " + (string)e.Result, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error, MessageBoxDefaultButton.Button1);
            Application.Exit();
        }

        private void ServerForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            int fred = new Random().Next();
            string fname = AppDomain.CurrentDomain.BaseDirectory + $"playerdata{fred}.txt";
            string file = "[" + Environment.NewLine;
            int i = 0;
            foreach (ListViewItem lvi in MainListView.Items)
            {
                string q = (i < MainListView.Items.Count - 1) ? "," : string.Empty;
                string data = $"    {{ \"id\": \"{lvi.SubItems[0].Text}\", \"playername\": \"{lvi.SubItems[1].Text}\", \"besttime\": \"{lvi.SubItems[2].Text}\", \"host\": \"{lvi.SubItems[3].Text}\" }}{q}{Environment.NewLine}";
                file += data;
                i++;
            }
            file += "]" + Environment.NewLine;

            File.WriteAllText(fname, file);
        }
    }

    public struct UpdateInfo
    {
        public int newtime;
        public int id;

        public UpdateInfo(int _newtime, int _id)
        {
            newtime = _newtime;
            id = _id;
        }
    }

    public struct EmployeeInfo
    {
        public int counter;
        public int id;
        public string name;
        public string pc;

        public EmployeeInfo(int _counter, int _id, string _name, string _pc)
        {
            counter = _counter;
            id = _id;
            name = _name;
            pc = _pc;
        }
    }

    public class Employee
    {
        public string id { get; set; }
        public string best_time { get; set; }
    }

    public class Leaderboard
    {
        public Employee[] employees { get; set; }
    }

    public static class StreamUtils
    {
        public static string ReadToEnd(this Stream stream)
        {
            MemoryStream ms = new MemoryStream();

            while (true)
            {
                int b = stream.ReadByte();
                if (b == -1) break;
                ms.WriteByte((byte)b);
            }

            string ret = Encoding.UTF8.GetString(ms.ToArray());
            ms.Dispose();
            return ret;
        }

        public static long WriteString(this Stream stream, string _str)
        {
            byte[] raw = Encoding.UTF8.GetBytes(_str);
            stream.Write(raw, 0, raw.Length);
            return raw.LongLength;
        }
    }
}
