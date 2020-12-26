///scr_playsound(sndindex,loop)
// just play me a sound already.

if (!audio_exists(argument0)) {
    return false;
}

return audio_play_sound(argument0, argument1, argument1);
// no, double argument1 is not a typo
// sounds that want to loop (e.g. argument1 == 1)
// should be less prioritized than sound effects.
// and 0 is the highest priority.
