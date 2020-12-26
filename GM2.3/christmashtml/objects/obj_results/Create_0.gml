/// @description init results object.

scr_stopsound(snd_summertime);

text_curr = "AND SO,#HERE ARE THE RESULTS...##TIME: " + string(global.time / room_speed) + " SECONDS / " + string(global.time) + " STEPS.##";
if (global.net) {
    text_curr += "UPLOAD YOUR RESULTS TO INVERSE INC. (Y/N)? #";
}

drawreporting = false;
reported = false;
reportstr = "REPORTING...";
quitting = false;
quittime = 3 * room_speed; // 3 seconds.

success = "Report ok.";
phpurl = "https://inversedog.ddns.net/dogs.php";
http = -1;

margin = 30;

