/// @description update draw positions.

// get gui layer wh
display_set_gui_maximise();
var gh;
gh = display_get_gui_height();

// scale.
image_xscale = 1;
image_yscale = 1;

// set draw position.
margin = max(sprite_width, sprite_height) + (32 * min(image_xscale, image_yscale));
x = margin;
y = gh - margin;

