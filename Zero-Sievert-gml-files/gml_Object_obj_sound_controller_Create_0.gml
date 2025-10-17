audio_group_load(snd_aas);
audio_group_load(snd_anomaly_fire);
audio_group_load(snd_aug);
audio_group_load(snd_accendino_1);
audio_group_load(snd_airplane);
audio_group_load(snd_ak_mag_out);
audio_group_load(snd_45);
audio_group_load(snd_ak_mag_in);
audio_group_load(snd_ak_74_indoor);
audio_group_load(snd_ak_74);
audio_group_load(snd_anomaly_fire_2);
audio_group_load(snd_ar_mag_in);
audio_group_load(snd_ar_mag_out);
audio_group_load(snd_ash12);
audio_group_load(snd_big_bite_1);
audio_falloff_set_model(audio_falloff_linear_distance_clamped);
alarm[1] = 30;
alarm[2] = 120;
alarm[3] = 240;
sound_emitter_wind = audio_emitter_create();
audio_emitter_position(sound_emitter_wind, x, y, 0);
sound_wind_now = 0;
audio_emitter_falloff(sound_emitter_wind, 150, 500, 1);
emitter_volume[0] = 0.5;
sound_emitter_bird_stream = audio_emitter_create();
audio_emitter_position(sound_emitter_bird_stream, x, y, 0);
audio_emitter_falloff(sound_emitter_bird_stream, 150, 500, 1);
emitter_volume[1] = 0.5;
how_many_emitter = array_length_1d(emitter_volume);
volume_modifier = 0.05;
volume_time = 0;
volume_time_max = 180;
counter_thunder = 0;
counter_thunder_max = 600;
var a = 0;
bullet_hit_flesh[a] = snd_bullet_flesh1;
a++;
bullet_hit_flesh[a] = snd_bullet_flesh2;
a++;
bullet_hit_flesh[a] = snd_bullet_flesh3;
a++;
bullet_hit_flesh[a] = snd_bullet_flesh4;
a++;
bullet_hit_flesh[a] = snd_bullet_flesh5;
a++;
bullet_hit_flesh[a] = snd_bullet_flesh6;
a++;
bullet_hit_flesh[a] = snd_bullet_flesh7;
a = 0;
bullet_hit_near[a] = snd_bullet_near1;
a++;
bullet_hit_near[a] = snd_bullet_near2;
a++;
bullet_hit_near[a] = snd_bullet_near3;
a++;
bullet_hit_near[a] = snd_bullet_near4;
a++;
bullet_hit_near[a] = snd_bullet_near5;
a++;
bullet_hit_near[a] = snd_bullet_near6;
a++;
bullet_hit_near[a] = snd_bullet_near7;
a++;
bullet_hit_near[a] = snd_bullet_near8;
a++;
bullet_hit_near[a] = snd_bullet_near9;
a++;
bullet_hit_near[a] = snd_bullet_near10;
a++;
bullet_hit_near[a] = snd_bullet_near11;
a++;
bullet_hit_near[a] = snd_bullet_near12;
a++;
bullet_hit_near[a] = snd_bullet_near13;
a++;
bullet_hit_near[a] = snd_bullet_near14;
a++;
bullet_hit_near[a] = snd_bullet_near15;
a = UnknownEnum.Value_0;
var i = 0;
global.bullet_impact[a][i] = snd_vuoto;
a = UnknownEnum.Value_1;
i = 0;
global.bullet_impact[a][i] = snd_bullet_impact_concrete1;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_concrete2;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_concrete3;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_concrete4;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_concrete5;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_concrete6;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_concrete7;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_concrete8;
i++;
a = UnknownEnum.Value_4;
i = 0;
global.bullet_impact[a][i] = snd_bullet_impact_dirt1;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_dirt2;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_dirt3;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_dirt4;
a = UnknownEnum.Value_2;
i = 0;
global.bullet_impact[a][i] = snd_bullet_impact_wood1;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_wood2;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_wood3;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_wood4;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_wood5;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_wood6;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_wood7;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_wood8;
i++;
a = UnknownEnum.Value_5;
i = 0;
global.bullet_impact[a][i] = snd_bullet_impact_glass1;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass2;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass3;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass4;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass5;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass6;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass7;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass8;
i++;
a = UnknownEnum.Value_3;
i = 0;
global.bullet_impact[a][i] = snd_bullet_impact_metal1;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_metal2;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_metal3;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_metal4;
i++;
a = UnknownEnum.Value_6;
i = 0;
global.bullet_impact[a][i] = snd_bullet_impact_glass1;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass2;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass3;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass4;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass5;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass6;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass7;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_glass8;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_metal1;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_metal2;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_metal3;
i++;
global.bullet_impact[a][i] = snd_bullet_impact_metal4;
i++;
a = UnknownEnum.Value_7;
i = 0;
global.bullet_impact[a][i] = snd_bullet_flesh_bloody1;
i++;
global.bullet_impact[a][i] = snd_bullet_flesh_bloody2;
i++;
global.bullet_impact[a][i] = snd_bullet_flesh_bloody3;
i++;
global.bullet_impact[a][i] = snd_bullet_flesh_bloody4;
i++;
grid_footstep = ds_grid_create(32, 64);

for (var xx = 0; xx < 32; xx++)
{
    for (var yy = 0; yy < 64; yy++)
        ds_grid_set(grid_footstep, xx, yy, UnknownEnum.Value_0);
}

for (var xx = 0; xx < 2; xx++)
{
    for (var yy = 12; yy < 14; yy++)
        ds_grid_set(grid_footstep, xx, yy, UnknownEnum.Value_1);
}

for (var xx = 9; xx < 15; xx++)
{
    for (var yy = 16; yy < 20; yy++)
        ds_grid_set(grid_footstep, xx, yy, UnknownEnum.Value_2);
}

for (var xx = 15; xx < 21; xx++)
{
    for (var yy = 10; yy < 11; yy++)
        ds_grid_set(grid_footstep, xx, yy, UnknownEnum.Value_2);
}

ds_grid_set(grid_footstep, 17, 23, UnknownEnum.Value_1);
ds_grid_set(grid_footstep, 18, 23, UnknownEnum.Value_1);
ds_grid_set(grid_footstep, 19, 23, UnknownEnum.Value_1);
ds_grid_set(grid_footstep, 20, 23, UnknownEnum.Value_1);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7
}
