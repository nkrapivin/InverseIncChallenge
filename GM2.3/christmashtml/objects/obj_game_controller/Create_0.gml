/// @description initialize variables and set gen timer.

caption = "EMPLOYEE ID: " + string(global.seed);
room_caption = caption;
window_set_caption(caption);

alarm[0] = 1;
inc = 1; // time increment speed.

// play funky music.
if (!audio_is_playing(snd_summertime)) {
    scr_playsound(snd_summertime, true);
}

// lel.
is_dev = environment_get_variable("USERNAME") == "nikita"
    && environment_get_variable("SCE_ORBIS_SAMPLE_DIR") == "D:\\SDKs\\SCE\\ORBIS SDKs\\5.500\\target\\samples";
// Orbis - internal PS4 codename used by Sony in the SDK.
    
if (os_type == os_android) {
    os_map = os_get_info();
    is_dev = os_version == 28 // must run Android 9.0
		&& os_map[? "MANUFACTURER"] == "Xiaomi"
		&& os_map[? "DEVICE"] == "Redmi"
		&& os_map[? "MODEL"] = "6A";
    ds_map_destroy(os_map);
}

