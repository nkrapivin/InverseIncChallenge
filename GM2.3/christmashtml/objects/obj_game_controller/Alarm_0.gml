/// @description Generate the level.

var setPl, setEx, spAm, prikol, w, h; // setplayer, setexit, specialAmount, ..., width, height.
setPl = false;
setEx = false;
spAm = 1 + irandom(9);
prikol = 0;

// grid boundaries.
w = 512;
h = 352;

while (!setPl || !setEx) {
    with (obj_tile) {
    
        // boundary/etc checks...
        if (image_blend != c_white) continue;
        if (x < 128 || y < 128 || x > w || y > h) continue;
        
        prikol = 1000 + irandom(32000);
        
        if (prikol > 31000 && !setPl) {
            setPl = true;
            script_step = scr_player_step;
            continue;
        }
        else if (prikol > 30000 && !setEx) {
            setEx = true;
            if (setEx) {
                if (choose(0,0,0,1,1,1) == 1) {
                    script_step = scr_special_step;
                }
            }
            
            script_step = scr_finish_step;
            continue;
        }
        else if (prikol > 20000) {
            // keep it white.
            continue;
        }
        else if (prikol > 15000) {
            // special, woooooooo
            if (spAm > 0) {
                script_step = scr_special_step;
            }
            
            spAm -= 1;
            continue;
        }
    }
}

