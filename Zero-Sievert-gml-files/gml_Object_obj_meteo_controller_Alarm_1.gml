global.emission_timer_now = 0;
global.state_emission_now += 1;
global.is_emission_now = true;

if (global.state_emission_now == UnknownEnum.Value_5)
    audio_play_sound(snd_thunder_emission, 20, false);

if (global.state_emission_now == UnknownEnum.Value_2)
    audio_play_sound(snd_rumble_4, 20, false);

if (global.state_emission_now == UnknownEnum.Value_7)
    audio_play_sound(snd_explosive_massive_1, 20, false);

if (global.state_emission_now != UnknownEnum.Value_23)
    alarm[1] = global.emission_timer[global.state_emission_now];

if (global.state_emission_now == UnknownEnum.Value_23)
{
    global.state_emission_now = UnknownEnum.Value_0;
    global.is_emission_now = false;
    global.emission_done = true;
    weather_force_radiation_rain();
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_5 = 5,
    Value_7 = 7,
    Value_23 = 23
}
