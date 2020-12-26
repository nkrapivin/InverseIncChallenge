/// @description draw current seed.

draw_set_color(c_red);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
draw_text(x, y, string_hash_to_newline("ENTER YOUR INVERSE INCORPORATED EMPLOYEE ID:#" + droidstring));

// draw THE DOG
draw_sprite(spr_THE_DOG, 0, room_width, room_height);

