/// @description check for input.

var p, po, px, py;
p = device_mouse_check_button(0, mb_left);
po = device_mouse_check_button_pressed(0, mb_left);
px = device_mouse_x_to_gui(0);
py = device_mouse_y_to_gui(0);

var x1, y1, x2, y2, sprmargin, w, h;
w = sprite_width * image_xscale;
h = sprite_height * image_yscale;
sprmargin = h - (sprite_get_bbox_bottom(sprite_index) * image_yscale);

// copy the previous state.
array_copy(prev_pressed, 0, pressed, 0, arrows);

// only bother if we've actually pressing at the screen.
if (p) {
    // angle 0
    x1 = x - w/2;
    x2 = x + w/2;
    y1 = y - h;
    y2 = y - sprmargin;
    
    pressed[0] = point_in_rectangle(px, py, x1, y1, x2, y2);
    
    // angle 90
    x1 = x - h;
    x2 = x - sprmargin;
    y1 = y - w/2;
    y2 = y + w/2;
    
    pressed[1] = point_in_rectangle(px, py, x1, y1, x2, y2);
    
    
    // angle 180
    x1 = x - w/2;
    x2 = x + w/2;
    y1 = y + sprmargin;
    y2 = y + h;
    
    pressed[2] = point_in_rectangle(px, py, x1, y1, x2, y2);
    
    // angle 270
    x1 = x + sprmargin;
    x2 = x + h;
    y1 = y - w/2;
    y2 = y + w/2;
    
    pressed[3] = point_in_rectangle(px, py, x1, y1, x2, y2);
}
else {
    for (var i = 0; i < arrows; i++) {
        pressed[i] = false;
    }
}

// calculate pressed and released states.
for (var i = 0; i < arrows; i++) {
    once[i] = !prev_pressed[i] && pressed[i];
    released[i] = prev_pressed[i] && !pressed[i];
}

// hehe
if (po && obj_game_controller.is_dev) {
    if (point_in_rectangle(px, py, 0, 0, 128, 128)) {
        scr_next_level();
    }
}

