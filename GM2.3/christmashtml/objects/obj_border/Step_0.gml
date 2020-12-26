/// @description do blendy things.

// blend between white (border sprite col) and mergecol by amount.
image_blend = merge_color(c_white, mergecol, amount);

// decrement blend amount and clamp it between 0 and 1 so we don't break merge_color.
amount -= spd;
amount = clamp(amount, 0, 1);

