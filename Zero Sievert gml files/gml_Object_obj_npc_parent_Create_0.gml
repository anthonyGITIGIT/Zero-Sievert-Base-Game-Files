object_id = object_get_name(object_index);
lista_text();
gamedata_trader_calculate_shared_money();
hspd = 0;
vspd = 0;
alarm[10] = 3;
alarm[11] = 2;

if (is_in_raid())
    alarm[7] = 1;

shader_hit_size = shader_get_uniform(shd_flash_hit_blocked, "texture_pixel");
shader_outline_color = shader_get_uniform(shd_flash_hit_blocked, "outline_color");
emitter_shoot = audio_emitter_create();
audio_emitter_falloff(emitter_shoot, 128, 500, 1);
emitter_walk = audio_emitter_create();
audio_emitter_falloff(emitter_walk, 16, 164, 1);
emitter_talk = audio_emitter_create();
audio_emitter_falloff(emitter_talk, 32, 164, 1);
play_sound_death = true;
grid_faction_my = ds_grid_create(10, 10);
ds_grid_clear(grid_faction_my, 150);
weapon_seed = irandom(4294967295);
trace("Creating NPC ", object_get_name(object_index), ":", id);
npc_id = "dummy";
npc_name = "???";
npc_speaker_id = "no_speaker";
follow_path = false;
path_goto_x[0] = 0;
path_goto_y[0] = 0;
path_create_now = false;
lista_path_x = ds_list_create();
lista_path_y = ds_list_create();
path_position_now = 0;
path_color = make_color_rgb(irandom(255), irandom(255), irandom(255));
timer_visible = 0;
timer_visible_max = 45;
delete_npc = false;
force_moving_towards_player = false;
last_seen_x = 0;
last_seen_y = 0;
last_known_x = 0;
last_known_y = 0;
last_my_target_seen_x = 0;
last_my_target_seen_y = 0;
last_shot_x = 0;
last_shot_y = 0;
last_target_cover_x = 0;
last_target_cover_y = 0;
last_patrol_x = 0;
last_patrol_y = 0;
last_seen_delay_x = 0;
last_seen_delay_y = 0;
last_seen_delay_timer = 0;
last_seen_delay_timer_max = 45;
last_seen_delay = false;
move_point_x = 0;
move_point_y = 0;
enemy_seen = false;
target_seen = false;
image_xscale_before = 1;
draw_weapon = true;
create_item_in_chest = true;
dead_outside_game_window = false;
original_x = x;
original_y = y;
walk_time = 0;
dir_attack = 0;
can_attack = true;
first_shot_from_player = false;
attack_recovery = 70;
money_trader = 0;
path_timer_reset = 30;
path_timer = path_timer_reset;
path_to_target = path_add();
shooting = false;
reloading = false;
recoil_total = 3;
target = -4;
search_target_id = -4;
target_relation = UnknownEnum.Value_0;
can_be_damaged = true;
shader_hit = "BULLET_HIT_NONE";
hit = false;
grenade_close_id = -4;
grenade_can_cover = false;
grenade_amount_thrown = 0;
grenade_flash = false;
grenade_flash_timer = 0;
grenade_flash_timer_max = 300;
flash_weapon_dir_timer = 0;
flash_weapon_dir_timer_max = 60;
flash_weapon_dir = 0;
grenade_smoke = false;
hp_set = false;
reset_state_to_patrol_time = 600;
timer_recheck_eff_range = 0;
timer_recheck_eff_range_max = 60;
precision_uneffective_range = 30;
can_shoot_uneffective_range = false;
timer_shoot_uneffective_range = 0;
timer_shoot_uneffective_range_max = 45;
weapon_pointing_direction = irandom(360);
weapon_pointing_angle = 1;
weapon_pointing_amount = 0;
target_for_image_scale = 0;
alarm[3] = 10;
riflessi = 0;
riflessi_max = 0;
reflexes_distance = 0;
reflexes_angle = 0;
reflexes_can_change = true;
reflexes_shot = false;
reflex_min_distance_last_known = 30;
quest_max = 0;
armor_dur = 100;
shoot_time = 0;
shoot_time_max = 60;
red_blood = true;
unstuck_counter_timer = 0;
unstuck_counter_timer_max = 15;
unstuck_counter = 0;
unstuck_counter_max = 10;
ammo_magazine = -1;
ammo_now = 0;
arma_now = "makarov";
mod_container = loot_mod_cont_create();
loot_mod_cont_copy_from_default(mod_container, arma_now);
ammo_id_now = "no_item";
alpha_ = 1;
a_gain = 0.1;
can_talk = true;
prev_state = -1;
can_talk_reset = false;
can_talk_reset_timer = 0;
can_talk_reset_timer_max = 180;
quest_contract_is_me = false;
quest_contract_grid_pos = -1;
sprite_before = s_vuoto;
state_before = 0;
bullet_checked = false;
tick = 0;
tick_max = 10;
linked_weapon_id = -4;
ani_end = false;
wolf_alert_raggio2 = 64;
wolf_ululato = 0;
wolf_ululato_max = 0;
ghoul_2_buff_timer = 0;
ghoul_2_buff_timer_max = 60;
ghoul_buffed_mult_damage = 1.5;
ghoul_buffed_mult_speed = 1.2;
ghoul_buffed_timer = 0;
ghoul_buffed_timer_max = 120;
tick_now = 0;
tick_max = 6;
tick_from_roof = false;
pos_now = 0;
node_running_now = 0;
node_child_now = 0;
node_state_now = 3;
node_action_state = 2;
alert_player = 0;
alert_player_max_value = 45;
alert_player_max = alert_player_max_value;
last_seen_x = 0;
last_seen_y = 0;
last_cover_pos_x = 0;
last_cover_pos_y = 0;
angle_min_to_rotate = 10;
bt_action_timer_now = 0;
direction_to_aim = 0;
dir_to_aim_x = 0;
dir_to_aim_y = 0;
need_reload_already_check = false;
var i = 0;
tree_id[i] = UnknownEnum.Value_18;
tree_parent[i] = 4;
tree_pos[i] = 0;
tree_child[i] = [];
i = 1;
tree_id[i] = UnknownEnum.Value_19;
tree_parent[i] = 3;
tree_pos[i] = 1;
tree_child[i] = [];
i = 2;
tree_id[i] = UnknownEnum.Value_7;
tree_parent[i] = 3;
tree_pos[i] = 2;
tree_child[i] = [];
i = 3;
tree_id[i] = UnknownEnum.Value_2;
tree_parent[i] = 4;
tree_pos[i] = 3;
tree_child[i] = [2, 1];
i = 4;
tree_id[i] = UnknownEnum.Value_1;
tree_parent[i] = 9;
tree_pos[i] = 4;
tree_child[i] = [3, 0];
i = 5;
tree_id[i] = UnknownEnum.Value_5;
tree_parent[i] = 7;
tree_pos[i] = 5;
tree_child[i] = [];
i = 6;
tree_id[i] = UnknownEnum.Value_17;
tree_parent[i] = 8;
tree_pos[i] = 6;
tree_child[i] = [];
i = 7;
tree_id[i] = UnknownEnum.Value_4;
tree_parent[i] = 8;
tree_pos[i] = 7;
tree_child[i] = [5];
i = 8;
tree_id[i] = UnknownEnum.Value_2;
tree_parent[i] = 9;
tree_pos[i] = 8;
tree_child[i] = [7, 6];
i = 9;
tree_id[i] = UnknownEnum.Value_1;
tree_parent[i] = 10;
tree_pos[i] = 9;
tree_child[i] = [8, 4];
i = 10;
tree_id[i] = UnknownEnum.Value_0;
tree_parent[i] = -1;
tree_pos[i] = 10;
tree_child[i] = [9];
var _size = array_length(tree_id);
pos_roof = 0;

for (i = 0; i < _size; i++)
{
    if (tree_parent[i] == -1)
        pos_roof = i;
}

for (i = 0; i < _size; i++)
{
    tree_node[i] = global.node_type[tree_id[i]];
    tree_condition_checked[i] = 9999;
    tree_condition_checked_max[i] = global.node_check_condition_max[tree_id[i]];
    tree_condition_now[i] = false;
}

recoil_shooting = 0;
recoil_arma = 0;
human_tick = 0;
human_tick_max = 7;
human_tick_max_ref = human_tick_max;
human_state_now = -1;
human_state_before = 0;
target_visto = false;
id_target_non_visto = -4;
state_finito = true;
direction_to_aim = 0;
dir_to_aim_x = 0;
dir_to_aim_y = 0;
timer_searching_target = 0;
timer_searching_target_max = 900;
timer_last_state = 0;
timer_last_state_max = 10000;
angle_min_to_rotate = 10;
angle_increase_for_target = 6;
shooted_first_time = 0;
chase_new_target_location = false;
target_visto_prima_volta = false;
alleato_morto_vicino = 0;
ally_morto_x = 0;
ally_morto_y = 0;
id_chest_ally_dead = -4;
id_of_the_killer = -4;
have_to_reload = true;
hear_target_shoot = false;
must_take_cover = false;
just_shot = 0;
counter_target_seen_neutral = 0;
timer_see_neutral = 0;
timer_see_neutral_max = 180;
text_type_neutral = 0;
neutral_distance_target = 80;
counter_target_cover = 0;
counter_target_cover_max = 5;
counter_target_toggle = true;
aim_still_timer = 4000;
debug_next_state = 0;
tipo_arma_equipped = "pistol";
debug_chance_chase = 0;

func_generate_weapon = function()
{
    if (weapon_modded)
        exit;
    
    weapon_modded = true;
    
    if (item_weapon_get_moddable(arma_now))
    {
        mod_container.CopyFromWeaponDefaults(arma_now);
        
        if (npc_id == "killa")
        {
            mod_container.Initialize();
            mod_container.Set("stock", "mod_rpk_stock");
            mod_container.Set("grip", "mod_rpk_grip");
            mod_container.Set("handguard", "mod_rpk_handguard_1");
            mod_container.Set("magazine", "mod_rpk_magazine");
            mod_container.Set("scope", "mod_scope_mrs");
            mod_container.Set("att_1", "mod_foregrip_1");
            mod_container.Set("att_2", "mod_torch_2");
            mod_container.Set("att_4", "mod_laser_rosso");
        }
        else
        {
            random_set_seed(weapon_seed);
            var _random_mods = variable_struct_get(global.item_possible_mod_data, arma_now).Generate(npc_get_attachment_value(npc_id));
            _random_mods.ChooseAll(mod_container);
            trace("Generating weapon ...");
            trace("id = ", id);
            trace("npc_id = ", npc_id);
            trace("arma_now = ", arma_now);
            trace("weapon_seed = ", weapon_seed);
            trace(SnapToJSON(mod_container.data, true, true));
        }
        
        var _stats = item_weapon_get_modded_stats(arma_now, mod_container);
        recoil_arma = _stats.recoil;
        ammo_now = item_weapon_get_modded_magazine_size(arma_now, mod_container);
    }
};

frames_left_of_impaler_shot_1 = -1;
frames_left_of_impaler_shot_2 = -1;
move_speed_multiplier_from_skills = 1;
current_move_speed_multiplier = 1;
remain_visible_frames = -1;
frames_left_of_prolonged_vision = -1;
hover_frames = 0;
skill_vital_shooting_frames = 0;
npc_override = undefined;
mods_object_perform_event("create_event");

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_4 = 4,
    Value_5,
    Value_7 = 7,
    Value_17 = 17,
    Value_18,
    Value_19
}
