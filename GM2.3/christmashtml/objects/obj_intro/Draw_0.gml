/// @description typewriter draw.

draw_set_color(c_red);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
draw_text(x, y, string_hash_to_newline(text_curr));

// draw THE DOG.
draw_sprite(spr_THE_DOG, 0, room_width, room_height);

var tstr = "CHECKING INTERNET CONNECTION,#HANG ON...";
if (testdone) {
    tstr = "ALL GOOD!#YOU WILL BE ABLE TO UPLOAD YOUR SCORE.";
    if (!global.net) {
        tstr = "UNABLE TO CONNECT TO INVERSENET(tm)#RESULT REPORTING IS DISABLED!";
    }
}
draw_text(0, room_height - 60, string_hash_to_newline(tstr));

