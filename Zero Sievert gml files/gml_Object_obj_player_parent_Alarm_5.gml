if (global.general_debug)
    trace_error("You've found a secret crash!\nTalk to Juju and he'll send you a reward");

alarm[5] = 3;

if (xprevious != x || yprevious != y)
{
    var walk = choose(snd_walk1, snd_walk2, snd_walk3, snd_walk4);
    audio_play_sound(walk, 10, false);
}
