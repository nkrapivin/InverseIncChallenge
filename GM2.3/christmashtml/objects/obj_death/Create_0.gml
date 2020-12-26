/// @description Initialize Variables.

scr_stopsound(snd_summertime);

advance = true;
text_pos = 1;
text_spd = 0.3;
text_curr = "";
text_orig = "YOU DIED,#HOW CUTE...##SORRY,#BUT YOU WON'T BE AN #INVERSE INC EMPLOYEE...##SEE YA!";

// fill the entire score table with ded.
var i; i = 20;
repeat (10) {
    highscore_add("DEATH", i);
    i -= 1;
}

room_caption = "PRESS ESCAPE TO QUIT.";
window_set_caption("PRESS ESCAPE TO QUIT.");

