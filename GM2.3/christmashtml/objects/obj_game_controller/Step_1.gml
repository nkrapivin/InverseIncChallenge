/// @description Poll input.

// was too lazy to implement joysticks or stuff like that...
left = keyboard_check_pressed(vk_left);
right = keyboard_check_pressed(vk_right);
up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);

if (os_type == os_android) {
    with (obj_touch_controls) {
        other.left = once[1];
        other.right = once[3];
        other.up = once[0];
        other.down = once[2];
    }
}

