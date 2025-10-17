function player_action_interact()
{
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var _task_pos;
    
    switch (ds_list_find_value(global.list_interact, global.p_int_instance_id))
    {
        case UnknownEnum.Value_1:
            player_action_open_chest(ds_list_find_value(global.list_interact_id, global.p_int_instance_id));
            break;
        
        case UnknownEnum.Value_2:
            player_action_open_stash();
            break;
        
        case UnknownEnum.Value_3:
            var _special = false;
            var _get_instance_id = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            var _get_object_index = _get_instance_id.object_index;
            
            if (_get_object_index == obj_sacriel)
            {
                _special = true;
                scr_draw_npc_text(obj_sacriel, UnknownEnum.Value_156);
            }
            
            if (_special == false)
            {
                global.speaker_nearest = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
                player_action_talk_to_npc();
            }
            
            break;
        
        case UnknownEnum.Value_4:
            __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/sleep.ui");
            player_set_local_state(scr_player_state_sleep);
            break;
        
        case UnknownEnum.Value_5:
            var indoor_id = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            var _offy = 0;
            
            if (y > obj_map_generator.area_height[obj_map_generator.area])
                _offy = -4;
            
            x = indoor_id.tele_x;
            y = indoor_id.tele_y + _offy;
            can_run_after_exit_building = false;
            obj_controller.can_pause = true;
            obj_controller.alarm[4] = 2;
            
            if (instance_exists(obj_fog_setup))
                obj_fog_setup.alarm[0] = 3;
            
            if (instance_exists(obj_camera))
                obj_camera.alarm[1] = 1;
            
            update_position = y < obj_map_generator.map_height;
            
            if (indoor_id.object_index == obj_indoor_specific_city_start_block || indoor_id.object_index == obj_indoor_specific_city_start_central || indoor_id.object_index == obj_indoor_specific_city_start_construction)
                global.city_map_started = true;
            
            break;
        
        case UnknownEnum.Value_6:
            break;
        
        case UnknownEnum.Value_10:
            var _quest_pos = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            var _quest_id = global.quest_state[_quest_pos].id;
            _task_pos = ds_list_find_value(global.list_interact_task_pos, global.p_int_instance_id);
            
            if (_quest_id != "")
            {
                if (variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].type == "interact_obj" || variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].type == "place_analyzer")
                {
                    var _item_id = variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].item_id;
                    var _i_have_item = true;
                    
                    if (_item_id != -1)
                    {
                        _i_have_item = false;
                        _i_have_item = inventory_item_exists(_item_id);
                    }
                    
                    if (_i_have_item == true)
                    {
                        var _text_item = variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].text_if_item;
                        
                        if (_text_item != -1)
                            scr_draw_npc_text(id, _text_item);
                        
                        if (_item_id != -1)
                            inventory_remove_item(_item_id, 1);
                        
                        global.quest_state[_quest_pos].amount_now[_task_pos] = 1;
                        obj_controller.alarm[1] = 1;
                        
                        if (_quest_id == UnknownEnum.Value_37)
                        {
                            obj_quest_destroy_ghoul_lair_esplosione.alarm[1] = 3600;
                            global.show_explosion_ghoul_lair = true;
                        }
                    }
                    
                    if (_i_have_item == false)
                    {
                        var _text_no_item = variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].text_if_no_item;
                        
                        if (_text_no_item != -1)
                            scr_draw_npc_text(id, _text_no_item);
                    }
                }
            }
            
            break;
        
        case UnknownEnum.Value_9:
            var _quest_pos = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            _task_pos = ds_list_find_value(global.list_interact_task_pos, global.p_int_instance_id);
            var _quest_id = global.quest_state[_quest_pos].id;
            global.quest_state[_quest_pos].amount_now[_task_pos] = 1;
            obj_controller.alarm[1] = 1;
            
            if (_quest_id == UnknownEnum.Value_89)
                scr_draw_npc_text(id, UnknownEnum.Value_41);
            
            if (_quest_id == UnknownEnum.Value_25)
                scr_draw_npc_text(id, UnknownEnum.Value_43);
            
            if (_quest_id == UnknownEnum.Value_30)
                scr_draw_npc_text(id, UnknownEnum.Value_46);
            
            if (_quest_id == UnknownEnum.Value_36)
                scr_draw_npc_text(id, UnknownEnum.Value_48);
            
            break;
        
        case UnknownEnum.Value_7:
            __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/crafting.ui", "crafting layer");
            player_set_local_state(scr_player_state_craft);
            break;
        
        case UnknownEnum.Value_8:
            var door_near = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            var d_id = door_near.id_door;
            var have_key = inventory_item_exists(global.door_key_id[d_id]);
            
            if (have_key == false)
                scr_draw_npc_text(id, UnknownEnum.Value_31);
            
            var togli_chiave = false;
            
            if (item_get_key_single_use(global.door_key_id[d_id]))
                togli_chiave = true;
            
            if (d_id == UnknownEnum.Value_8)
            {
                if (instance_exists(obj_junk_trader))
                {
                    audio_play_sound(snd_electric_spark, 15, false);
                    player_damage_local(infinity);
                }
            }
            
            if (have_key == true)
            {
                with (door_near)
                {
                    if (place_meeting(x, y, obj_solid))
                    {
                        var solid_my_poosition = instance_place(x, y, obj_solid);
                        var xx, yy;
                        
                        with (solid_my_poosition)
                        {
                            xx = x;
                            yy = y;
                            instance_destroy();
                        }
                        
                        if (togli_chiave == true)
                        {
                            inventory_remove_item(global.door_key_id[d_id], 1);
                            inventory_clean_up_empty_items();
                        }
                        
                        sprite_index = global.door_sprite_open[d_id];
                        visible = true;
                        x = xx;
                        y = yy;
                        depth = -yy;
                        open = true;
                    }
                }
            }
            
            break;
        
        case UnknownEnum.Value_11:
            var closer = instance_place(x, y, obj_base_parent);
            var base_slot_ = closer.slot;
            var closer_id = closer.id_base;
            var c_id = 0;
            
            if (closer_id == UnknownEnum.Value_8)
            {
                c_id = obj_chest_material;
                
                if (base_module_get_level(UnknownEnum.Value_8) > 1)
                    c_id = obj_chest_material_2;
            }
            
            if (closer_id == UnknownEnum.Value_10)
                c_id = obj_chest_garden;
            
            if (closer_id == UnknownEnum.Value_11)
                c_id = obj_chest_ammo;
            
            if (closer_id == UnknownEnum.Value_9)
                c_id = obj_chest_scav;
            
            if (c_id != 0)
            {
                instance_create_depth(x, y, 0, c_id);
                closer.preso = true;
                db_open("general");
                db_write("Module preso", "slot_" + string(base_slot_), true);
                db_close();
            }
            
            break;
        
        case UnknownEnum.Value_13:
            var i_have_the_kit = inventory_item_exists("repair_radio_tower");
            
            if (i_have_the_kit == true)
            {
                scr_complete_specific_q_type(UnknownEnum.Value_62, UnknownEnum.Value_11);
                inventory_remove_item("repair_radio_tower", 1);
                scr_draw_text_with_box("Quest completed!");
            }
            else
            {
                scr_draw_npc_text(id, UnknownEnum.Value_24);
            }
            
            break;
        
        case UnknownEnum.Value_14:
            var i_have_the_marker = inventory_item_exists("gps_marker");
            
            if (i_have_the_marker == true)
            {
                var _quest_pos = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
                var _quest_id = global.quest_state[_quest_pos].id;
                _task_pos = ds_list_find_value(global.list_interact_task_pos, global.p_int_instance_id);
                global.quest_state[_quest_pos].amount_now[_task_pos] = 1;
                obj_controller.alarm[1] = 1;
                inventory_remove_item("gps_marker", 1);
            }
            else
            {
                scr_draw_npc_text(id, UnknownEnum.Value_23);
            }
            
            break;
        
        case UnknownEnum.Value_15:
            var i_have_the_analyzer = inventory_item_exists("scientific_analyzer");
            
            if (i_have_the_analyzer == true)
            {
                global.save_quest_amount_now[i][0] = 1;
                global.quest_state[i].amount_now[_task_pos] = 1;
                obj_controller.alarm[1] = 1;
                inventory_remove_item("scientific_analyzer", 1);
                scr_draw_text_with_box("Quest completed!");
            }
            else
            {
                scr_draw_npc_text(id, UnknownEnum.Value_27);
            }
            
            break;
        
        case UnknownEnum.Value_16:
            var quest_pos_ = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            var i_have_repair_kit = inventory_item_exists("repair_radio_tower");
            
            if (i_have_repair_kit == true)
            {
                scr_complete_specific_q_type(UnknownEnum.Value_170, UnknownEnum.Value_13);
                inventory_remove_item("repair_radio_tower", 1);
                scr_draw_text_with_box("Quest completed!");
            }
            else
            {
                scr_draw_npc_text(id, UnknownEnum.Value_24);
            }
            
            break;
        
        case UnknownEnum.Value_17:
            var quest_pos_ = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            scr_complete_specific_q_type(UnknownEnum.Value_171, UnknownEnum.Value_14);
            obj_controller.alarm[1] = 1;
            scr_draw_text_with_box("Quest completed!");
            break;
        
        case UnknownEnum.Value_18:
            break;
        
        case UnknownEnum.Value_19:
            var i_have_the_marker = inventory_item_exists("camera_crimson_quest");
            
            if (i_have_the_marker == true)
            {
                scr_complete_specific_q_type(UnknownEnum.Value_19, UnknownEnum.Value_19);
                inventory_remove_item("camera_crimson_quest", 1);
                scr_draw_text_with_box("Quest completed!");
            }
            else
            {
                scr_draw_npc_text(id, UnknownEnum.Value_34);
            }
            
            break;
        
        case UnknownEnum.Value_20:
            if (obj_faro.light_on == false)
            {
                obj_faro.light_start = true;
                obj_spawner_ghoul_quest_swamp.alarm[0] = 480;
                obj_faro.alarm[3] = 90;
                
                with (obj_green_quest_swamp_leader)
                    scr_draw_npc_text(id, UnknownEnum.Value_107);
            }
            
            break;
        
        case UnknownEnum.Value_21:
            scr_draw_npc_text(id, UnknownEnum.Value_38);
            break;
        
        case UnknownEnum.Value_22:
            scr_draw_npc_text(id, UnknownEnum.Value_78);
            global.az_done[UnknownEnum.Value_15] = true;
            break;
        
        case UnknownEnum.Value_23:
            with (obj_prologue)
            {
                timer_go = true;
                timer_max = 10;
            }
            
            break;
        
        case UnknownEnum.Value_24:
            if (global.luci_natale_on == true)
            {
                global.luci_natale_on = false;
                scr_draw_text_with_box("Lights OFF");
            }
            else
            {
                global.luci_natale_on = true;
                scr_draw_text_with_box("Lights ON");
            }
            
            with (obj_light_natale_parent)
                scale = scale_start;
            
            break;
        
        case UnknownEnum.Value_25:
            var _colore_now;
            
            with (obj_light_natale_1)
            {
                colore_now += 1;
                var _max = array_length_1d(colore_luce);
                
                if (colore_now >= (_max - 1))
                    colore_now = 0;
                
                _colore_now = colore_now;
                db_open("general");
                db_write("Christman", "lights color 1", colore_now);
                db_close();
            }
            
            scr_draw_text_with_box(language_get_string("Lights 1 - color") + " " + string(_colore_now), false);
            break;
        
        case UnknownEnum.Value_26:
            var _colore_now;
            
            with (obj_light_natale_2)
            {
                colore_now += 1;
                var _max = array_length_1d(colore_luce);
                
                if (colore_now >= (_max - 1))
                    colore_now = 0;
                
                _colore_now = colore_now;
                db_open("general");
                db_write("Christman", "lights color 2", colore_now);
                db_close();
            }
            
            scr_draw_text_with_box(language_get_string("Lights 2 - color") + " " + string(_colore_now), false);
            break;
        
        case UnknownEnum.Value_27:
            global.luci_natale_mode += 1;
            
            if (global.luci_natale_mode > UnknownEnum.Value_2)
                global.luci_natale_mode = UnknownEnum.Value_0;
            
            if (global.luci_natale_mode == UnknownEnum.Value_2)
            {
                with (obj_light_natale_1)
                    scale = 0;
                
                with (obj_light_natale_1)
                    scale = scale_start;
            }
            
            db_open("general");
            db_write("Christman", "lights mode", global.luci_natale_mode);
            db_close();
            
            with (obj_light_natale_parent)
                luci_natale_timer_alternato = 0;
            
            scr_draw_text_with_box(language_get_string("Lights mode") + " - " + string(global.luci_natale_mode), false);
            break;
        
        case UnknownEnum.Value_28:
            global.luci_natale_timer += 1;
            
            if (global.luci_natale_timer > 4)
                global.luci_natale_timer = 0;
            
            with (obj_light_natale_parent)
                luci_natale_timer_alternato = 0;
            
            db_open("general");
            db_write("Christman", "lights timer", global.luci_natale_timer);
            db_close();
            scr_draw_text_with_box(language_get_string("Lights timer") + " - " + string(global.luci_natale_timer), false);
            break;
        
        case UnknownEnum.Value_29:
            if (!global.santa2023_given_milk)
            {
                if (inventory_item_exists("milk"))
                {
                    inventory_remove_item("milk", 1);
                    
                    with (obj_santa_claus)
                        scr_draw_npc_text(id, UnknownEnum.Value_168);
                    
                    global.santa2023_given_milk = true;
                    obj_controller.alarm[3] = 1;
                    audio_play_sound(snd_natale2023_woosh, 20, false);
                }
                else
                {
                    scr_draw_npc_text(id, UnknownEnum.Value_93);
                }
            }
            else
            {
                with (obj_santa_claus)
                    scr_draw_npc_text(id, UnknownEnum.Value_167);
            }
            
            break;
        
        case UnknownEnum.Value_30:
            var indoor_id = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            x = indoor_id.tele_x;
            y = indoor_id.tele_y;
            can_run_after_exit_building = false;
            obj_controller.can_pause = true;
            obj_controller.alarm[4] = 2;
            instance_create_depth(x, y, 0, obj_hud_outer_deity);
            global.quest_outer_deity_sound = true;
            
            if (instance_exists(obj_fog_setup))
                obj_fog_setup.alarm[0] = 3;
            
            if (instance_exists(obj_camera))
                obj_camera.alarm[1] = 1;
            
            with (obj_quest_outer_deity_interact)
                instance_destroy();
            
            break;
        
        case UnknownEnum.Value_31:
            var _id = ds_list_find_value(global.list_interact_id, global.p_int_instance_id);
            var _object = _id.object_index;
            
            switch (_object)
            {
                case obj_interact_lab_elevator_room_experiment_1:
                    scr_draw_npc_text(obj_interact_lab_elevator_room_experiment_1, UnknownEnum.Value_197);
                    break;
                
                case obj_interact_lab_elevator_room_experiment_2:
                    scr_draw_npc_text(obj_interact_lab_elevator_room_experiment_2, UnknownEnum.Value_200);
                    break;
                
                case obj_interact_lab_elevator_room_experiment_3:
                    scr_draw_npc_text(obj_interact_lab_elevator_room_experiment_3, UnknownEnum.Value_205);
                    break;
                
                case obj_interact_lab_elevator_room_experiment_4:
                    scr_draw_npc_text(obj_interact_lab_elevator_room_experiment_4, UnknownEnum.Value_208);
                    break;
            }
            
            break;
        
        case UnknownEnum.Value_35:
            global.end_game_choice = UnknownEnum.Value_35;
            end_game_save_choice();
            scr_draw_npc_text(obj_quest_end_game, UnknownEnum.Value_237);
            end_game_delete_choices();
            faction_set_rep("Player", "Green Army", 1000);
            faction_set_rep("Player", "Crimson Corporation", 1000);
            faction_set_rep("Player", "Loners", 1000);
            faction_set_rep("Player", "Scientists", 1000);
            break;
        
        case UnknownEnum.Value_32:
            global.end_game_choice = UnknownEnum.Value_32;
            end_game_save_choice();
            scr_draw_npc_text(obj_quest_end_game, UnknownEnum.Value_237);
            end_game_delete_choices();
            global.player_money = 100000000;
            break;
        
        case UnknownEnum.Value_34:
            global.end_game_choice = UnknownEnum.Value_34;
            end_game_save_choice();
            scr_draw_npc_text(obj_quest_end_game, UnknownEnum.Value_237);
            end_game_delete_choices();
            
            with (player_get_local())
                skills_hunter.set("immortal", true);
            
            break;
        
        case UnknownEnum.Value_39:
            global.end_game_choice = UnknownEnum.Value_39;
            end_game_save_choice();
            scr_draw_npc_text(obj_quest_end_game, UnknownEnum.Value_237);
            end_game_delete_choices();
            global.az_done[UnknownEnum.Value_11] = false;
            global.az_done[UnknownEnum.Value_1] = false;
            scr_save_unique_action();
            break;
        
        case UnknownEnum.Value_40:
            with (obj_dummy_bunker)
            {
                delete_npc = true;
                instance_destroy();
            }
            
            scr_draw_text_with_box("All dummies resetted");
            break;
        
        case UnknownEnum.Value_41:
            global.sr_class_now = 0;
            scr_draw_text_with_box("No armor selected");
            break;
        
        case UnknownEnum.Value_42:
            global.sr_class_now = 1;
            scr_draw_text_with_box("Class 1 armor selected");
            break;
        
        case UnknownEnum.Value_43:
            global.sr_class_now = 2;
            scr_draw_text_with_box("Class 2 armor selected");
            break;
        
        case UnknownEnum.Value_44:
            global.sr_class_now = 3;
            scr_draw_text_with_box("Class 3 armor selected");
            break;
        
        case UnknownEnum.Value_45:
            global.sr_class_now = 4;
            scr_draw_text_with_box("Class 4 armor selected");
            break;
        
        case UnknownEnum.Value_46:
            global.sr_class_now = 5;
            scr_draw_text_with_box("Class 5 armor selected");
            break;
        
        case UnknownEnum.Value_47:
            global.sr_class_now = 6;
            scr_draw_text_with_box("Class 6 armor selected");
            break;
    }
}

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
    Value_13 = 13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_34 = 34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_62 = 62,
    Value_78 = 78,
    Value_89 = 89,
    Value_93 = 93,
    Value_107 = 107,
    Value_156 = 156,
    Value_167 = 167,
    Value_168,
    Value_170 = 170,
    Value_171,
    Value_197 = 197,
    Value_200 = 200,
    Value_205 = 205,
    Value_208 = 208,
    Value_237 = 237
}
