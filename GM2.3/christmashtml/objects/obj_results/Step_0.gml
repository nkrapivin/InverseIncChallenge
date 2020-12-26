/// @description report the result if needed.

if (quitting || !global.net) exit;

var N, Y;
N = false;
Y = false;

with (obj_touch_number) {
    if (c == "N" && once) N = true;
    else if (c == "Y" && once) Y = true;
}

if (N || keyboard_check_pressed(ord("N"))) {
    text_curr += "N";
    reportstr = "UNDERSTOOD. QUITTING...";
    quitting = true;
    drawreporting = true;
    alarm[0] = quittime;
    
    exit;
}

if (!drawreporting && (Y || keyboard_check_pressed(ord("Y")))) {
    drawreporting = true;
    text_curr += "Y";
    exit;
}

if (drawreporting && !reported && http == -1) {
    var post; post = "time=" + string(global.time) + "&employeeid=" + string(global.seed);
    
    http = http_post_string(phpurl, post);
}

