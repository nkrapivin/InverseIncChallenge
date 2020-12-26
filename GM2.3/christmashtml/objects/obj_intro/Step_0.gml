/// @description Ease-in text.

if (advance && string_length(text_curr) < string_length(text_orig)) {
    text_curr = string_copy(text_orig, 1, floor(text_pos));
    text_pos += text_spd;
    
    // pause at newlines with no space.
    if (string_char_at(text_orig, floor(text_pos) - 1) != " " && string_char_at(text_orig, floor(text_pos)) == "#") {
        advance = false;
        //text_pos += 1;
        alarm[0] = room_speed; // /4;
    }
    
    if (keyboard_check_pressed(vk_shift) || device_mouse_check_button_pressed(0, mb_right)) {
        text_spd *= 5;
    }
}

// start
if ((keyboard_check_pressed(vk_anykey) || device_mouse_check_button_pressed(0, mb_left)) && testdone && string_length(text_curr) == string_length(text_orig)) {
    instance_create_layer(x, y, layer, obj_seed_asker);
    instance_destroy();
}

