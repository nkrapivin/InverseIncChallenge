/// @description Initialize Variables.

advance = true;
text_pos = 1;
text_spd = 0.3;
text_curr = "";
text_orig = "<-- INVERSE INC RECRUITMENT CHALLENGE -->##HELLO,#THANK YOU FOR #SHOWING YOUR INTEREST IN INVERSE INC.#WE HAVE PREPARED A CHALLENGE FOR YOU,#WHO SOLVES IT FIRST WILL GET A PRIZE.# #";
text_orig += "GREEN TILE - YOU #YELLOW TILE - EXIT #WHEN LIVES REACH 0, YOU DIE. #THERE ARE 30 LEVELS. # #PRESS ANY KEY TO BEGIN...";

// initialize global scope variables.
global.seed = 0;
global.time = 0;
lives = 3;
score = 0;
health = 1; // LEVEL INDEX!

window_set_caption("INVERSE INCORPORATED RECRUITMENT CHALLENGE");
room_caption = "INVERSE INCORPORATED RECRUITMENT CHALLENGE";

// secret way to run the game again even after dying...
if (keyboard_check_direct(vk_ralt) && keyboard_check_direct(vk_rshift)) {
    highscore_clear();
    file_delete("hiscore.dat");
    show_message("Highscore table has been cleared, run the game again.");
    scr_game_end();
    exit; // don't execute the death check please.
}

// die check.
if (highscore_name(1) == "DEATH") {
    room_goto(rom_death);
}

// check for internet just by requesting / from the challenge server
global.net = true;
testurl = "https://inversedog.ddns.net/";
test = http_get(testurl);
testdone = false;

instance_deactivate_object(obj_touch_number);

// TEST
//window_set_size(1440, 720);
alarm[2] = 1;

//show_debug_message(string(display_get_dpi_x()));

