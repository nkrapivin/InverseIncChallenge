/// @description check seed

// android
var droidpress = false;
with (obj_touch_number) {
    if (once) {
        if (c != "<" && c != "OK") {
            other.droidstring += c;
        }
        else if (c == "<") {
            other.droidstring = string_copy(other.droidstring, 1, string_length(other.droidstring) - 1);
        }
        else {
            droidpress = true;
        }
    }
}

if (os_type != os_android) {
    droidstring = keyboard_string;
}

if (keyboard_check_pressed(vk_enter) || droidpress) {

    var str; str = droidstring;
    // TODO: sanitize the string properly
    
    if (string_length(str) < 2 || string_digits(str) != str) {
        show_message_async("Invalid employee ID.");
        droidstring = "";
        exit;
    }
    
    global.seed = real(str);
    if (global.seed == 0) { // real() also returns 0 on error sometimes, and employee ID can't be zero.
        show_message_async("Invalid employee ID.");
        droidstring = "";
        exit;
    }
    
    // all good.
    random_set_seed(global.seed);
    room_goto(rom_level);
}

if (os_type != os_android) {
    keyboard_string = droidstring;
}

