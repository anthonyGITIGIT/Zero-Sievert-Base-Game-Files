a += a_plus;
a = clamp(a, 0, 1);

if (a >= 1)
{
    if (keyboard_check_pressed(vk_anykey))
    {
    }
}

timer_audio++;
timer_audio = clamp(timer_audio, 0, timer_audio_max);
var _audio = settings_get("master volume") - (timer_audio / timer_audio_max);
_audio = clamp(_audio, 0, 1);
audio_master_gain(_audio);
player_follow_local();

if (exp_numero_start == true)
{
    if (exp_numero < exp_numero_max)
    {
        exp_numero += ((exp_numero_max - exp_numero) / 20);
        
        if (exp_numero >= (exp_numero_max - 0.5))
            exp_numero = exp_numero_max;
    }
}

if (exp_bar_start == true)
{
    var _xp_steps = 50;
    global.xp += (exp_numero_max / _xp_steps);
    scr_check_level();
    
    if (++xp_steps >= _xp_steps)
    {
        global.xp = floor(exp_agg_finish);
        can_go_hub = true;
    }
    
    if (exp_numero_max == 0)
        can_go_hub = true;
}

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);

if (scr_mouse_inside((camx + button_next_x) - (button_next_w / 2), (camy + button_next_y) - (button_next_h / 2), button_next_w, button_next_h) || obj_gamepad.input_value[UnknownEnum.Value_0] || obj_gamepad.input_value[UnknownEnum.Value_13] || obj_gamepad.input_released[UnknownEnum.Value_0] || obj_gamepad.input_released[UnknownEnum.Value_13])
{
    button_next_hover = true;
    
    if (can_go_hub == true)
    {
        if (mouse_check_button_pressed(mb_left) || obj_gamepad.input_released[UnknownEnum.Value_0] || obj_gamepad.input_released[UnknownEnum.Value_13])
        {
            scr_save_ftue();
            var _prologue_done = false;
            
            if (survived || obj_map_generator.area == UnknownEnum.Value_10)
            {
                db_open("general");
                db_write("prologue", "map_done", true);
                db_close();
                db_open("shared settings");
                db_write("prologue", "at least one completed", true);
                db_close();
                _prologue_done = true;
            }
            
            if ((survived || !difficulty_get("hardcore_perma_death")) && obj_map_generator.area != UnknownEnum.Value_10)
            {
                scr_save_skill_and_base();
                scr_save_exp();
                scr_save_time();
                
                with (player_get_local())
                {
                    skills.save();
                    skills_hunter.save("skills_hunter");
                }
                
                mods_save_enabled_mods();
                stat_increment("tot_hunt");
                
                if (survived == true)
                {
                    scr_save_player_status();
                    scr_save_unique_action();
                    faction_save();
                    stat_increment("tot_hunt_survived");
                    stat_increment("survival_streak_now");
                    stat_max_value("survival_streak_max", stat_get_value("survival_streak_now"));
                    db_open("general");
                    
                    for (var j = 0; j < 30; j++)
                    {
                        var quest_id_ = global.quest_state[j].id;
                        
                        if (quest_id_ != "")
                        {
                            for (var i = 0; i < array_length(variable_struct_get(global.quest_database, quest_id_).objective); i++)
                            {
                                var _struct_single_objective = variable_struct_get(global.quest_database, quest_id_).objective[i];
                                
                                if (_struct_single_objective.type == "survive")
                                {
                                    var _map_id = _struct_single_objective.map;
                                    
                                    if (_map_id == obj_map_generator.area || _map_id == -1)
                                        global.quest_state[j].amount_now[i] += 1;
                                }
                                
                                if (_struct_single_objective.type == "survive_exp")
                                {
                                    var _map_id = _struct_single_objective.map;
                                    
                                    if (_map_id == obj_map_generator.area || _map_id == -1)
                                    {
                                        var _exp_made = global.xp_survive;
                                        
                                        if (global.quest_state[j].amount_now[i] < _struct_single_objective.amount_max)
                                        {
                                            if (_exp_made >= _struct_single_objective.exp_amount)
                                                global.quest_state[j].amount_now[i] += 1;
                                        }
                                    }
                                }
                                
                                if (_struct_single_objective.type == "survive_money")
                                {
                                    var _map_id = _struct_single_objective.map;
                                    
                                    if (_map_id == obj_map_generator.area || _map_id == -1)
                                    {
                                        if (global.quest_state[j].amount_now[i] < _struct_single_objective.amount_max)
                                        {
                                            if (value_made >= _struct_single_objective.money_amount)
                                                global.quest_state[j].amount_now[i] += 1;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    db_close();
                    stat_max_value("most_roubles_raid", value_made);
                    stat_max_value("most_exp_raid", global.xp_survive);
                    quest_save();
                }
                
                if (!survived)
                    stat_set_value("survival_streak_now", 0);
                
                if (survived == false)
                {
                    db_open("general");
                    var _size = ds_list_size(global.list_quest_before_map_npc_name);
                    
                    if (_size > 0)
                    {
                        for (var i = 0; i < _size; i++)
                        {
                            var _name = ds_list_find_value(global.list_quest_before_map_npc_name, i);
                            
                            if (db_section_exists(_name))
                                db_section_delete(_name);
                        }
                        
                        var _list_temp_name;
                        
                        for (var i = 0; i < 10; i++)
                        {
                            _list_temp_name[i] = "";
                            var _list_temp_quest_id;
                            _list_temp_quest_id[i] = ds_list_create();
                            var _list_temp_quest_premio;
                            _list_temp_quest_premio[i] = ds_list_create();
                        }
                        
                        for (var i = 0; i < _size; i++)
                        {
                            var _name = ds_list_find_value(global.list_quest_before_map_npc_name, i);
                            var _trovato_nome = false;
                            
                            for (var j = 0; j < array_length_1d(_list_temp_name); j++)
                            {
                                var _stored_name = _list_temp_name[j];
                                
                                if (_stored_name == _name)
                                    _trovato_nome = true;
                            }
                            
                            if (_trovato_nome == false)
                            {
                                var _nome_aggiunto = false;
                                
                                for (var j = 0; j < array_length_1d(_list_temp_name); j++)
                                {
                                    var _stored_name = _list_temp_name[j];
                                    
                                    if (_stored_name == "")
                                    {
                                        _nome_aggiunto = true;
                                        _list_temp_name[j] = _name;
                                    }
                                }
                            }
                        }
                        
                        for (var i = 0; i < array_length_1d(_list_temp_name); i++)
                        {
                            var _name_salvato = _list_temp_name[i];
                            var k = 0;
                            
                            for (var j = 0; j < _size; j++)
                            {
                                var _name = ds_list_find_value(global.list_quest_before_map_npc_name, j);
                                var _quest_id = ds_list_find_value(global.list_quest_before_map_quest_id, j);
                                
                                if (_name_salvato == _name)
                                {
                                    db_write(_name, "quest_" + string(k), _quest_id);
                                    k++;
                                }
                            }
                        }
                    }
                    
                    db_close();
                }
                
                var _pistol_kill_count = 0;
                var _smg_kill_count = 0;
                var _shotgun_kill_count = 0;
                var _rifle_kill_count = 0;
                var _dmr_kill_count = 0;
                var _sniper_kill_count = 0;
                var _pistol_exp = 0;
                var _smg_exp = 0;
                var _shotgun_exp = 0;
                var _rifle_exp = 0;
                var _dmr_exp = 0;
                var _sniper_exp = 0;
                
                if (survived == true)
                {
                    var _alive_multiplier = 1;
                    _pistol_kill_count = global.pistol_kill_count * _alive_multiplier;
                    _smg_kill_count = global.smg_kill_count * _alive_multiplier;
                    _shotgun_kill_count = global.shotgun_kill_count * _alive_multiplier;
                    _rifle_kill_count = global.rifle_kill_count * _alive_multiplier;
                    _dmr_kill_count = global.dmr_kill_count * _alive_multiplier;
                    _sniper_kill_count = global.sniper_kill_count * _alive_multiplier;
                    _pistol_exp = global.pistol_exp * _alive_multiplier;
                    _smg_exp = global.smg_exp * _alive_multiplier;
                    _shotgun_exp = global.shotgun_exp * _alive_multiplier;
                    _rifle_exp = global.rifle_exp * _alive_multiplier;
                    _dmr_exp = global.dmr_exp * _alive_multiplier;
                    _sniper_exp = global.sniper_exp * _alive_multiplier;
                }
                else
                {
                    var _dead_multiplier = 0.5;
                    _pistol_kill_count = 0;
                    _smg_kill_count = 0;
                    _shotgun_kill_count = 0;
                    _rifle_kill_count = 0;
                    _dmr_kill_count = 0;
                    _sniper_kill_count = 0;
                    _pistol_exp = global.pistol_exp * _dead_multiplier;
                    _smg_exp = global.smg_exp * _dead_multiplier;
                    _shotgun_exp = global.shotgun_exp * _dead_multiplier;
                    _rifle_exp = global.rifle_exp * _dead_multiplier;
                    _dmr_exp = global.dmr_exp * _dead_multiplier;
                    _sniper_exp = global.sniper_exp * _dead_multiplier;
                }
                
                stat_add_value("pistol_kill_count", _pistol_kill_count);
                stat_add_value("smg_kill_count", _smg_kill_count);
                stat_add_value("shotgun_kill_count", _shotgun_kill_count);
                stat_add_value("rifle_kill_count", _rifle_kill_count);
                stat_add_value("dmr_kill_count", _dmr_kill_count);
                stat_add_value("sniper_kill_count", _sniper_kill_count);
                stat_add_value("pistol_exp", _pistol_exp);
                stat_add_value("smg_exp", _smg_exp);
                stat_add_value("shotgun_exp", _shotgun_exp);
                stat_add_value("rifle_exp", _rifle_exp);
                stat_add_value("dmr_exp", _dmr_exp);
                stat_add_value("sniper_exp", _sniper_exp);
                skills_update_masteries();
                scr_save_stat();
            }
            
            if (survived || !difficulty_get("hardcore_perma_death"))
                inventory_handle_pre_raid_backup(false, survived);
            
            inventory_set_target_db_to_pre_raid();
            audio_stop_all();
            settings_apply("master volume");
            var _goto_hub = true;
            
            if (survived == false)
            {
                global.can_get_free_equipment = true;
                db_open("general");
                db_write("Can get free equipment", "value", global.can_get_free_equipment);
                db_close();
                steam_stat_increment("playerdeaths");
                
                if (difficulty_get("hardcore_perma_death"))
                {
                    _goto_hub = false;
                    instance_activate_all();
                    obj_controller.disattiva = false;
                    exit_to_main_menu_permadeath();
                    db_file_delete("shared");
                    difficulty_set_sandbox(true);
                    room_goto(r_menu);
                }
            }
            
            if (_goto_hub == true)
            {
                instance_activate_all();
                obj_controller.disattiva = false;
                __uiGlobal().__defaultOnion.Clear();
                room_goto(r_hub);
            }
        }
    }
    else if (mouse_check_button_pressed(mb_left) || obj_gamepad.input_released[UnknownEnum.Value_29])
    {
        alarm[2] = 1;
        
        if (exp_bar_start == false)
            alarm[0] = 999999;
        
        if (exp_numero_start == false)
            alarm[1] = 999999;
    }
}
else
{
    button_next_hover = false;
}

button_show_diff_hover = false;

if (scr_mouse_inside((camx + button_show_diff_x) - (button_show_diff_w / 2), (camy + button_show_diff_y) - (button_show_diff_h / 2), button_show_diff_w, button_show_diff_h) || obj_gamepad.action[UnknownEnum.Value_36].value || obj_gamepad.input_value[UnknownEnum.Value_15] > obj_gamepad.axis_pressed_value || obj_gamepad.input_value[UnknownEnum.Value_22] > obj_gamepad.axis_pressed_value)
    button_show_diff_hover = true;

enum UnknownEnum
{
    Value_0,
    Value_10 = 10,
    Value_13 = 13,
    Value_15 = 15,
    Value_22 = 22,
    Value_29 = 29,
    Value_36 = 36
}
