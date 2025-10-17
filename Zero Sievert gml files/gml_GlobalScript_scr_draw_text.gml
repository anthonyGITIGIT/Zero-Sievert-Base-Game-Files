function scr_draw_text(arg0, arg1, arg2, arg3)
{
    var text_ = arg0;
    
    if (text_counter < string_length(text_))
    {
        text_counter += 0.5;
        
        if (scr_chance(10))
            audio_play_sound(snd_voice1, 10, false);
    }
    
    var substring = string_copy(text_, 1, text_counter);
    draw_text_ext(arg1, arg2, substring, 11, arg3);
}
