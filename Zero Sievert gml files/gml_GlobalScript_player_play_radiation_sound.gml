function player_play_radiation_sound(arg0)
{
    var _new_sound = undefined;
    
    if (arg0 > 0 && arg0 <= 200)
        _new_sound = snd_radiation_low;
    else if (arg0 > 200 && arg0 <= 400)
        _new_sound = snd_radiation_medium;
    else
        _new_sound = snd_radiation_high;
    
    if (arg0 <= 0)
        _new_sound = undefined;
    
    var _loop = false;
    
    if (_new_sound != undefined)
    {
        if (audio_exists(_new_sound))
        {
            if (!audio_is_playing(_new_sound))
                _loop = true;
        }
    }
    
    if (radiation_sound != _new_sound || _loop)
    {
        radiation_sound = _new_sound;
        
        if (radiation_voice != undefined)
            audio_stop_sound(radiation_voice);
        
        if (_new_sound == undefined)
            radiation_voice = undefined;
        else
            radiation_voice = audio_play_sound(_new_sound, 10, false);
    }
}
