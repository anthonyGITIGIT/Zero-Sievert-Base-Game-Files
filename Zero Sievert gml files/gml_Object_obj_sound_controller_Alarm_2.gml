if (is_in_raid())
{
    if (y < obj_map_generator.map_height)
    {
        if (!instance_exists(obj_exit_screen))
        {
            if (scr_chance(50))
            {
                var ss = choose(snd_crow1, snd_crow2, snd_crow3, snd_crow4);
                audio_play_sound(ss, 3, false);
            }
        }
    }
}

alarm[2] = irandom(720) + 360;
