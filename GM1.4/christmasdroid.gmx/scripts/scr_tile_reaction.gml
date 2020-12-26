///scr_tile_reaction(id)
// Tile reaction script.

var myid; myid = argument0;
if (!instance_exists(myid)) {
    return false;
}

switch (myid.image_blend) {
    case c_yellow: {
        // switch to the next level.
        return scr_next_level();
    }
    
    default: {
        if (myid.script_step == scr_special_step) {
            var a; a = choose(0, 0, 1, 1, 1, 1, 1, 1, 1); // chances, chances!
            var dec; dec = (1 + irandom(3)) * room_speed; // the amount of time that will be taken.
            if (a && global.time > dec) {
                // powerup reaction.
                global.time -= dec;
                scr_set_border_color(c_green);
                scr_playsound(snd_powerup, false);
                if (irandom(4) <= 2) { // also increment lives.
                    lives += 1;
                }
            }
            else {
                // hurt reaction.
                lives -= 1;
                scr_set_border_color(c_red);
                scr_playsound(snd_hurt, false);
            }
            
            scr_transfer_tile(myid);
        }
        
        return true;
    }
}
