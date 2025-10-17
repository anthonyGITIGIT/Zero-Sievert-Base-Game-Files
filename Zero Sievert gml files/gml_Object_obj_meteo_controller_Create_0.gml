weather_map_pool();
weather_load();
weather_particle_array_clear();
db_open("general");
var _first_time = db_read("weather", "force_first_generation", true);
db_close();

if (_first_time)
{
    db_open("general");
    db_write("weather", "force_first_generation", false);
    db_close();
    weather_generate(true);
}

hour_track = -999;
day_track = -999;
part_smoother_now = 1;
part_smoother_increase = 0.001;
pp_transition = 1 / part_smoother_increase;
weather_transition(1, true);
global.state_emission_now = UnknownEnum.Value_0;
global.is_emission_now = false;
global.emission_make_npc_die = false;
global.emission_timer_now = 0;
global.emission_min_timer = (10 + choose(4, 8, 10)) * 60 * 60;
global.emission_done = false;
emission_chance[UnknownEnum.Value_1] = 8;
emission_chance[UnknownEnum.Value_2] = 15;
emission_chance[UnknownEnum.Value_3] = 15;
emission_chance[UnknownEnum.Value_4] = 20;
emission_chance[UnknownEnum.Value_6] = 15;
emission_chance[UnknownEnum.Value_8] = 16;
emission_chance[UnknownEnum.Value_10] = 0;
global.emission_hitbox_timer_def_min = 720;
global.emission_hitbox_timer_def_max = 1200;
global.emission_hitbox_timer_now = 0;
global.emission_hitbox_timer_max = 0;
global.emission_shader_brightness_max = 0.55;
global.emission_shader_brightness_medium = 0.3;
global.emission_shader_brightness_low = 0.1;
global.emission_shader_contrast_max = 0.3;
global.emission_shader_contrast_medium = 0.22;
global.emission_shader_contrast_low = 0.1;
global.emission_shader_red_max = 1.35;
global.emission_shader_green_max = 0.9;
global.emission_shader_blue_max = 1.35;

for (i = 0; i < UnknownEnum.Value_23; i++)
{
    global.emission_has_shader[i] = false;
    global.emission_shader_brightness[i] = 1;
    global.emission_shader_contrast[i] = 1;
    global.emission_shader_gamma[i] = 1;
}

global.emission_shader_brightness_now = 0;
global.emission_shader_contrast_now = 0;
global.emission_shader_gamma_now = 1;
global.emission_shader_red_now = 1;
global.emission_shader_blue_now = 1;
global.emission_shader_green_now = 1;
var i = UnknownEnum.Value_0;
global.emission_timer[i] = 1;
i = UnknownEnum.Value_1;
global.emission_timer[i] = 1200;
i = UnknownEnum.Value_2;
global.emission_timer[i] = 60;
i = UnknownEnum.Value_3;
global.emission_timer[i] = 240;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_4;
global.emission_timer[i] = 30;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_5;
global.emission_timer[i] = 15;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_6;
global.emission_timer[i] = 3;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_7;
global.emission_timer[i] = 8;
i = UnknownEnum.Value_8;
global.emission_timer[i] = 4;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_9;
global.emission_timer[i] = 4;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_10;
global.emission_timer[i] = 8;
i = UnknownEnum.Value_11;
global.emission_timer[i] = 4;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_12;
global.emission_timer[i] = 4;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_13;
global.emission_timer[i] = 8;
i = UnknownEnum.Value_14;
global.emission_timer[i] = 12;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_15;
global.emission_timer[i] = 180;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_16;
global.emission_timer[i] = 180;
i = UnknownEnum.Value_17;
global.emission_timer[i] = 180;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_18;
global.emission_timer[i] = 600;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_19;
global.emission_timer[i] = 900;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_20;
global.emission_timer[i] = 10800;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_21;
global.emission_timer[i] = 120;
global.emission_has_shader[i] = true;
i = UnknownEnum.Value_22;
global.emission_timer[i] = 180;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23
}
