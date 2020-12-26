/// @description Ease-in text.

if (advance && string_length(text_curr) < string_length(text_orig)) {
    text_curr = string_copy(text_orig, 1, floor(text_pos));
    text_pos += text_spd;
    
    // pause at newlines with no space.
    if (string_char_at(text_orig, floor(text_pos) - 1) != " " && string_char_at(text_orig, floor(text_pos)) == "#") {
        advance = false;
        //text_pos += 1;
        alarm[0] = room_speed / 3;
    }
    
    if (keyboard_check_pressed(vk_shift)) text_spd *= 5;
}

if (string_length(text_curr) >= string_length(text_orig) && alarm[1] == -1) {
    alarm[1] = 2 * room_speed;
}

