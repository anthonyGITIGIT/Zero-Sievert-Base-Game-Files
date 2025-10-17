player_follow_local();

if (!instance_exists(obj_main_menu) && !player_local_state_is(scr_player_state_start, scr_player_state_free_camera))
    game_seconds_remainder += (time_increase * (delta_time / 16667));

if (instance_exists(obj_map_generator) && obj_map_generator.area == UnknownEnum.Value_10)
    game_seconds_remainder -= (time_increase * (delta_time / 16667));

real_time_played += (delta_time / 1000000);

if (game_seconds_remainder >= 1)
{
    time_increment_seconds(floor(game_seconds_remainder));
    game_seconds_remainder = frac(game_seconds_remainder);
}

var _hour = time_get_hours();
var t_alba = ciclo_time[UnknownEnum.Value_0];
var t_giorno = ciclo_time[UnknownEnum.Value_1];
var t_tra = ciclo_time[UnknownEnum.Value_2];
var t_notte = ciclo_time[UnknownEnum.Value_3];
var t_hm = time_get_hours_fraction();

if (_hour >= t_alba && _hour < t_giorno)
{
    ciclo_now = UnknownEnum.Value_0;
    darkness_now_target = darkness_max - (((t_hm - t_alba) * darkness_max) / (t_giorno - t_alba));
    var merge_amount = 1 - ((1 * darkness_now_target) / darkness_max);
    color_surface = merge_color(ciclo_color[UnknownEnum.Value_3], ciclo_color[UnknownEnum.Value_0], merge_amount);
}

if (_hour >= t_giorno && _hour < t_tra)
{
    ciclo_now = UnknownEnum.Value_1;
    darkness_now_target = 0;
    color_surface = ciclo_color[UnknownEnum.Value_1];
}

if (_hour >= t_tra && _hour < t_notte)
{
    ciclo_now = UnknownEnum.Value_2;
    darkness_now_target = ((t_hm - t_tra) * darkness_max) / (t_notte - t_tra);
    var merge_amount = (1 * darkness_now_target) / darkness_max;
    color_surface = merge_color(ciclo_color[UnknownEnum.Value_0], ciclo_color[UnknownEnum.Value_3], merge_amount);
}

if (_hour >= t_notte || _hour < t_alba)
{
    ciclo_now = UnknownEnum.Value_3;
    darkness_now_target = darkness_max;
    color_surface = ciclo_color[UnknownEnum.Value_3];
}

darkness_now_target = clamp(darkness_now_target, 0, darkness_max);
var _weather_now = weather_get_weather_now();
var darkness_tot = darkness_now_target + (settings_get("fog rain") ? weather_get_darkness(_weather_now) : 0);
darkness_tot = clamp(darkness_tot, 0, darkness_max);

if (darkness_now != darkness_tot)
    var a = 0;

darkness_now = lerp(darkness_now, darkness_tot, 0.01);
darkness_now = clamp(darkness_now, 0, 1);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_10 = 10
}
