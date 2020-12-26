/// @description time... (and lives)
/// @param and lives

global.time += inc;

// die.
if (lives < 1) {
    room_goto(rom_death);
}


if (is_dev) {
    room_caption = caption + " [dev mode]";
    window_set_caption(caption + " [dev mode]");
    
    if (keyboard_check_pressed(vk_f2)) {
        scr_next_level();
    }
}

