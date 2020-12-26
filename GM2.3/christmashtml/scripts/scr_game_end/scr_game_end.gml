/// @description scr_game_end()
function scr_game_end() {

	if (os_type == os_android) {
	    room_goto(rom_android_limbo);
	}
	else {
	    game_end();
	}



}
