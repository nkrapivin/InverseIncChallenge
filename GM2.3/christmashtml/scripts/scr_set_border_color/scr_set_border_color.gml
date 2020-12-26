/// @description scr_set_border_color(col)
/// @param col
function scr_set_border_color(argument0) {
	// Safely sets the grid border color.

	if (!instance_exists(obj_border)) {
	    return false;
	}

	obj_border.mergecol = argument0;
	obj_border.amount = 1; // reset amount to highest even if there was a color already.

	return true;



}
