lista_skill_2();
skills_load();
lista_base();
player_init_weapons();
player_init_laser();
player_init_torch();
instance_create_depth(x, y, 0, obj_light_general, 
{
    follow_id: id
});
weapon_holder = new class_player_weapon(id);
arms_holder = undefined;
torch_holder = -4;
arma_now = "no_item";
armor_now = "no_item";
backpack_now = "no_item";
headset_now = "no_item";
emitter_shoot = audio_emitter_create();
audio_emitter_falloff(emitter_shoot, 256, 400, 1);
emitter_walk = audio_emitter_create();
audio_emitter_falloff(emitter_shoot, 64, 96, 1);
hit = false;
hit_shader = "BULLET_HIT_NONE";
sprite_idle = s_pg1_idle;
sprite_run = s_pg1_run;
sprite_dead = s_pg1_dead;
sprite_index = sprite_idle;
switching_weapon = false;
switching_weapon_now = 0;
switching_weapon_max = 60;
switching_weapon_max_now = switching_weapon_max;
next_weapon_slot = UnknownEnum.Value_1;
switching_fase = 0;
hspd = 0;
vspd = 0;
faction = "Player";
reloading = false;
state_reload = UnknownEnum.Value_4;
reload_cocking = false;
shooting = true;
shoot_input = false;
shoot_input_delay = 0;
shooting_frames = 0;
shooting_triggered = false;
shoot_stop_ani = false;
alarm[1] = 30;
aiming = false;
is_indoor = false;
max_weight = 0;
player_weight = 0;
can_run_after_exit_building = true;
can_run_after_exit_building_timer = 0;
recoil_from_movement = 0;
recoil_from_shooting = 0;
recoil_from_moving_mouse = 0;
recoil_total = 0;
total_ergo = 0;
total_precision = 0;
image_speed_move_current = 0.4;
weapon_pointing_direction = 0;
aim_point_x = obj_cursor.aa_x;
aim_point_y = obj_cursor.aa_y;
laser_startx = 0;
laser_starty = 0;

if (!variable_instance_exists(id, "mp_index"))
    mp_index = 0;

player_set_state(scr_player_state_move, mp_index);

if (is_in_raid())
{
    player_set_state(scr_player_state_start, mp_index);
}
else if (is_in_hub())
{
    player_set_state(scr_player_state_start, mp_index);
    alarm[4] = 3;
}

skills_damage_multiplier = 1;
scoped_damage_multiplier = 1;
adrenalinerush_cooldown = 0;
adrenalinerush_movement_speed_timer = 0;
nojamthanks_timer = 0;
immortal_used = false;
frames_since_last_swap_weapon = 0;
frames_left_steady_sniper = 0;
teleport_used_frames = 0;
teleport_used_can_count = false;
frames_left_of_killer_reload = -1;
hovering_enemy = false;
hovering_enemy_frames = 0;

enum UnknownEnum
{
    Value_1 = 1,
    Value_4 = 4
}
