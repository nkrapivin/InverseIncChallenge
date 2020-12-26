/// @description should we fill?

var p, po, px, py;
p = device_mouse_check_button(0, mb_left);
po = device_mouse_check_button_pressed(0, mb_left);
px = device_mouse_x(0);
py = device_mouse_y(0);

// too lazy to make actual fill work lol.
if (position_meeting(px, py, id)) {
    fill = p;
    once = po;
}
else {
    fill = false;
    once = false;
}

