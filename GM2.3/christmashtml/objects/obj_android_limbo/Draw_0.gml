/// @description draw the 'safe to quit' text.

draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_text);
x = room_width/2;
y = room_height/2;
draw_text(x, y, string_hash_to_newline("IT IS NOW SAFE#TO CLOSE THIS GAME."));

// draw THE DOG
draw_sprite(spr_THE_DOG, 0, room_width, room_height);

