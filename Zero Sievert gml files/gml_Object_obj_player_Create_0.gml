event_inherited();

if (!variable_instance_exists(id, "mp_index"))
    __mp_error("Must create obj_player using player_create()");

if (is_in_hub() || is_in_raid())
    instance_create_depth(x, y, 75, obj_fog_setup);

skills = new skill_system();
weapon_mastery = new skill_mastery_weapon(skills);
mastery_to_skills = new mastery_to_ability_joining_table(skills);
skills_hunter = new skill_system();

if (skills.save_exists())
    skills.load();

if (skills_hunter.save_exists("skills_hunter"))
    skills_hunter.load("skills_hunter");

var _count_of_skills = array_length(global.skills_data_array);

for (var i = 0; i < _count_of_skills; i++)
{
    var _skill_string_id = global.skills_data_array[i];
    skills.create(_skill_string_id, 0, variable_struct_get(global.skills_data, _skill_string_id).level_max);
}

var _array_of_passives_to_add = [];
var _array_of_gun_types_with_passives = variable_struct_get_names(global.skills_gun_passives_data.skill_gun_passives);
var _array_of_gun_types_with_passives_count = array_length(_array_of_gun_types_with_passives);

for (var i = 0; i < _array_of_gun_types_with_passives_count; i++)
{
    _array_of_passives_to_add = [];
    var _this_key = _array_of_gun_types_with_passives[i];
    
    if (_this_key == "id")
        continue;
    
    var _data_to_add = variable_struct_get(global.skills_gun_passives_data.skill_gun_passives, _this_key);
    var _passives_array = _data_to_add.passives;
    var _passives_array_count = array_length(_passives_array);
    
    for (var j = 0; j < _passives_array_count; j++)
    {
        var _to_add = _passives_array[j];
        array_push(_array_of_passives_to_add, new skill_mastery_rank(_to_add.stat, _to_add.worst, _to_add.best));
    }
    
    weapon_mastery.add_gun_type(_data_to_add.type, _data_to_add.skill, _array_of_passives_to_add);
}

var _all_data_array = global.skills_masteries_data.abilities.arr;
var _all_data_count = array_length(_all_data_array);

for (var i = 0; i < _all_data_count; i++)
{
    var _this_join = _all_data_array[i];
    mastery_to_skills.add_ability(_this_join.mastery_skill, _this_join.rank, _this_join.skill);
}

skills_update_masteries();
var _skills_array = array_length(global.skills_hunter_data_array);
var _group = 0;
global.skills_hunter_groups = [[], [], []];

for (var i = 0; i < _skills_array; i++)
{
    _group = variable_struct_get(global.skills_hunter_data, global.skills_hunter_data_array[i]).group;
    skills_hunter.create(global.skills_hunter_data_array[i]);
    
    if (_group >= 0)
        array_push(global.skills_hunter_groups[_group], global.skills_hunter_data_array[i]);
}

if (is_in_hub())
{
    db_open("general");
    var _force_restock = db_read("restock", "force", false);
    db_close();
    
    if (_force_restock)
        time_restock_traders();
    
    db_open("general");
    db_write("restock", "force", false);
    db_close();
}

wound = db_read_ext(inventory_target_db(), "player", "wound", 0);
fatigue_start = 100;
fatigue_max = -60;
fatigue = db_read_ext(inventory_target_db(), "player", "fatigue", fatigue_start);
hp_max_total = ceil(difficulty_get("pro_player_health"));
hp_max = db_read_ext(inventory_target_db(), "player", "hp_max", hp_max_total);
hp = db_read_ext(inventory_target_db(), "player", "hp", hp_max);

if (hp <= 0)
    hp = hp_max;

hp_regen = 0;
stamina_max_total = 100;
stamina_max = db_read_ext(inventory_target_db(), "player", "stamina_max", stamina_max_total);
stamina = stamina_max;
energy = db_read_ext(inventory_target_db(), "player", "energy", 90);
thirst = db_read_ext(inventory_target_db(), "player", "thirst", 90);
bleed = 0;
bleed_immune = 0;
radiation = 0;
radiation_nella_pos_attuale = 0;
radiation_defence = 0;
radiation_accumulata = db_read_ext(inventory_target_db(), "player", "radiation", 0);
radiation_sound = undefined;
radiation_voice = undefined;
shell_shot_count = 0;
stamina_run_drain = 0;
sprint_is_toggled_now = false;
mutant_slow_multiplier = 1;
spd_walk = 0.75;
spd_run = 1.2;
current_spd = spd_walk;
walk_time = 0;
looting = false;
trading = false;
looting_player_stash = false;
search_item_upgrade = true;
check_max_weight_timer = 0;
__naughty_global_variables();
map_selected = -1;
alarm[9] = 60;
quest_sono_vicino_anomalia = false;
quest_posso_piazzare_analyzer = false;
quest_scientific_analyzer_position_in_grid = -1;
quest_place_analyzer_text_said_1 = false;
quest_place_analyzer_text_said_2 = false;
timer_cristallo_viola = 0;
timer_cristallo_viola_max = 800;
timer_cristallo_viola_max2 = 850;
debug_void_extraction_create = false;
emission_riparato = false;
global.player_money = db_read_ext(inventory_target_db(), "stats", "money", 8000);
player_init_load_items();
update_position = true;
global.player_x = x;
global.player_y = y;
scr_initialise_ftue();
object_id = object_get_name(object_index);

if (room == r_hub)
    mods_perform_event("enter_hub");

mods_object_perform_event("create_event");
mods_perform_event("player_spawn");
