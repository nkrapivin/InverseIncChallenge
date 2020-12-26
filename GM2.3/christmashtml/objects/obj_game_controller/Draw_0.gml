/// @description Draw "HUD".

draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_red);
draw_text(obj_border.x, obj_border.y, string_hash_to_newline("LIVES: " + string(lives) + "#LEVEL: " + string(health)));
draw_set_valign(fa_top);
draw_text(obj_border.x, obj_border.y + obj_border.h, string_hash_to_newline("TIME: " + string(floor(global.time / room_speed))));

