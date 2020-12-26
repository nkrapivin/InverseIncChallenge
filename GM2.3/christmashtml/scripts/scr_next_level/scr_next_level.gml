/// @description scr_next_level()
function scr_next_level() {
	// Goes to the next level.

	if (room != rom_level) {
	    return false;
	}

	var maxlevel; maxlevel = 30;
	health += 1; // health variable is the level index!!!
	if (health > maxlevel) {
	    show_debug_message("We're done here...");
	    room_goto(rom_results);
	}
	else {
	    show_debug_message("Restarting level...");
	    room_restart();
	}

	return true;



}
