///scr_special_step()
// A script for *special* tiles.

counter += 1;
if (counter > 255) counter = 0;

var col; col = make_color_hsv(counter, 255, 255);
image_blend = col;

return true;
