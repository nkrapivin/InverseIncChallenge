/// @description draw buttons.

// draw arrows.
draw_sprite_ext(spr_touch_arrow, pressed[0], x, y, image_xscale, image_yscale, 0,   image_blend, image_alpha);
draw_sprite_ext(spr_touch_arrow, pressed[1], x, y, image_xscale, image_yscale, 90,  image_blend, image_alpha);
draw_sprite_ext(spr_touch_arrow, pressed[2], x, y, image_xscale, image_yscale, 180, image_blend, image_alpha);
draw_sprite_ext(spr_touch_arrow, pressed[3], x, y, image_xscale, image_yscale, 270, image_blend, image_alpha);

if (obj_game_controller.is_dev) {
    draw_set_color(c_red);
    draw_rectangle(0, 0, 128, 128, false);
}

