/// @description Initialize.
///Allocate arrays and calculate positions.

margin = 32;
arrows = 4;

// allocate arrays in reverse (which makes the thing faster)
for (var i = arrows - 1; i > -1; i--) {
    pressed[i] = false;
    once[i] = false;
    prev_pressed[i] = false;
    released[i] = false;
}

if (os_browser != browser_not_a_browser) {
	instance_destroy();
}