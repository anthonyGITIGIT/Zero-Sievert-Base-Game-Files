if (is_in_raid())
{
    if (y < obj_map_generator.map_height)
    {
        if (!instance_exists(obj_exit_screen))
        {
            if (scr_chance(100))
            {
                var _sound = choose(snd_bullet_crack1, snd_bullet_crack2, snd_bullet_crack3, snd_bullet_crack4, snd_bullet_crack5, snd_bullet_crack6, snd_bullet_crack7, snd_bullet_crack8, snd_bullet_crack9);
                audio_play_sound(_sound, 12, false);
            }
        }
    }
}

alarm[3] = irandom(720) + 600;

if (scr_chance(25))
    alarm[3] = 20;
