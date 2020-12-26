/// @description draw the congratulations text.

draw_set_color(c_red);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
draw_text(x, y, string_hash_to_newline(text_curr));

//draw THE DOG.
draw_sprite(spr_THE_DOG, 0, room_width, room_height);

if (drawreporting) {
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_text_ext(room_width - sprite_get_width(spr_THE_DOG) - margin, room_height - sprite_get_height(spr_THE_DOG)/2, string_hash_to_newline(reportstr), -1, room_width/2);
}

