if (fill) {
    draw_rectangle_colour(x - sprite_xoffset, y - sprite_yoffset, x + sprite_xoffset, y + sprite_yoffset, c_red, c_red, c_red, c_red, false);
}
else {
    draw_self();
    draw_set_font(fnt_text);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_red);
    draw_text(x, y, string_hash_to_newline(c));
}


