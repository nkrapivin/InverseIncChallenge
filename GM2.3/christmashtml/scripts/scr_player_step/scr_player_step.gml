/// @description scr_player_step()
function scr_player_step() {
	// Player step script.

	var axish, axisv;

	image_blend = c_green;

	axish = obj_game_controller.right - obj_game_controller.left;
	axisv = obj_game_controller.down - obj_game_controller.up;

	// two directions are pressed at the same time, or we didn't move at all.
	if (axish != 0 && axisv != 0 || axish + axisv == 0) {
	    return false;
	}

	if (axish != 0 || axisv != 0) {
	    var tx, ty, ti;
	    tx = x + (axish * sprite_width);
	    ty = y + (axisv * sprite_height);
	    ti = instance_position(tx, ty, object_index);
	    var step; step = scr_playsound(snd_step, false);
	    audio_sound_gain(step, 0.8 + ((1 + irandom(1)) / 10), 0);
	    if (instance_exists(ti)) {
	        if (ti.image_blend == c_white) {
	            scr_transfer_tile(ti);
	        }
	        else {
	            scr_tile_reaction(ti); // special tile reacton.
	        }
	    }
	}

	return true; // all good, we've moved.



}
