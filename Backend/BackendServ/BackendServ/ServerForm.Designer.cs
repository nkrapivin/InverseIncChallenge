namespace BackendServ
{
    partial class ServerForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ServerForm));
            this.MainListView = new System.Windows.Forms.ListView();
            this.CmnEmployeeID = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.CmnChosenName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.CmnBestTime = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.CmnHost = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.ListenWorker = new System.ComponentModel.BackgroundWorker();
            this.ClientNotifyIcon = new System.Windows.Forms.NotifyIcon(this.components);
            this.SuspendLayout();
            // 
            // MainListView
            // 
            this.MainListView.BackgroundImageTiled = true;
            this.MainListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.CmnEmployeeID,
            this.CmnChosenName,
            this.CmnBestTime,
            this.CmnHost});
            this.MainListView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.MainListView.HideSelection = false;
            this.MainListView.Location = new System.Drawing.Point(0, 0);
            this.MainListView.Name = "MainListView";
            this.MainListView.Size = new System.Drawing.Size(1099, 504);
            this.MainListView.Sorting = System.Windows.Forms.SortOrder.Ascending;
            this.MainListView.TabIndex = 0;
            this.MainListView.UseCompatibleStateImageBehavior = false;
            this.MainListView.View = System.Windows.Forms.View.Details;
            // 
            // CmnEmployeeID
            // 
            this.CmnEmployeeID.Text = "Employee ID";
            this.CmnEmployeeID.Width = 106;
            // 
            // CmnChosenName
            // 
            this.CmnChosenName.Text = "Name";
            this.CmnChosenName.Width = 512;
            // 
            // CmnBestTime
            // 
            this.CmnBestTime.Text = "Best Time";
            this.CmnBestTime.Width = 146;
            // 
            // CmnHost
            // 
            this.CmnHost.Text = "Host";
            // 
            // ListenWorker
            // 
            this.ListenWorker.WorkerReportsProgress = true;
            this.ListenWorker.WorkerSupportsCancellation = true;
            this.ListenWorker.DoWork += new System.ComponentModel.DoWorkEventHandler(this.ListenWorker_DoWork);
            this.ListenWorker.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.ListenWorker_ProgressChanged);
            this.ListenWorker.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.ListenWorker_RunWorkerCompleted);
            // 
            // ClientNotifyIcon
            // 
            this.ClientNotifyIcon.BalloonTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            this.ClientNotifyIcon.BalloonTipText = "Text goes here";
            this.ClientNotifyIcon.BalloonTipTitle = "Title goes here";
            this.ClientNotifyIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("ClientNotifyIcon.Icon")));
            this.ClientNotifyIcon.Text = "Inverse Dog Backend Server";
            this.ClientNotifyIcon.Visible = true;
            // 
            // ServerForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1099, 504);
            this.Controls.Add(this.MainListView);
            this.Name = "ServerForm";
            this.Text = "Inverse Dog Backend Server ({0} players)";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ServerForm_FormClosing);
            this.Shown += new System.EventHandler(this.ServerForm_Shown);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListView MainListView;
        private System.Windows.Forms.ColumnHeader CmnEmployeeID;
        private System.Windows.Forms.ColumnHeader CmnChosenName;
        private System.ComponentModel.BackgroundWorker ListenWorker;
        private System.Windows.Forms.ColumnHeader CmnBestTime;
        private System.Windows.Forms.ColumnHeader CmnHost;
        private System.Windows.Forms.NotifyIcon ClientNotifyIcon;
    }
}

