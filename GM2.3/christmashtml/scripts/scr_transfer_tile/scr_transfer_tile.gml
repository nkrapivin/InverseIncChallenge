/// @description scr_transfer_tile(id)
/// @param id
function scr_transfer_tile(argument0) {
	// Transfers our tile to another.

	var new_id; new_id = argument0;
	if (!instance_exists(new_id)) {
	    return false;
	}

	var myscr; myscr = script_step;
	var mybld; mybld = image_blend;

	with (new_id) {
	    script_step = myscr;
	    image_blend = mybld;
	}

	if (myscr == scr_player_step) {
	    new_id.perform = false;
	    new_id.alarm[0] = 1;
	}

	image_blend = c_white;
	script_step = scr_dummy;

	return true;



}
