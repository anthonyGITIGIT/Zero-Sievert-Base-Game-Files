depth = -y - 38;

if (!instance_exists(obj_editor))
    alarm[0] = 1;

ano_id = UnknownEnum.Value_16;
damage = 0.6;
emitter_sound = audio_emitter_create();
audio_emitter_position(emitter_sound, x, y, 0);
audio_emitter_falloff(emitter_sound, 96, 300, 1);
audio_play_sound_on(emitter_sound, snd_poltergeist, true, 15);
var _rad = obj_rad_125;

repeat (4)
{
    var _dir = irandom(360);
    var _dis = irandom_range(16, 96);
    var _xx = lengthdir_x(_dir, _dis);
    var _yy = lengthdir_y(_dir, _dis);
    instance_create_depth(x + _xx, y + _yy, 0, _rad);
}

enum UnknownEnum
{
    Value_16 = 16
}
