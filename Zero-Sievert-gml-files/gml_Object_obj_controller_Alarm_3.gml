if (is_in_raid())
{
    if (!christmas_active())
    {
        if (global.airdrop_created == false)
        {
            if ((scr_chance(20) || global.general_debug) && global.airdrop_x != 0)
            {
                global.airdrop_created = true;
                audio_play_sound(snd_airplane, 10, false);
                var _air_drop = scr_choose_airdrop();
                instance_create_depth((global.airdrop_x * 16) + 8, (global.airdrop_y * 16) + 12, 0, _air_drop);
                var _off = irandom(10);
                var _dir = irandom(360);
                ds_list_add(global.list_intresting_id, UnknownEnum.Value_3);
                ds_list_add(global.list_intresting_x, global.airdrop_x + lengthdir_x(_off, _dir));
                ds_list_add(global.list_intresting_y, global.airdrop_y + lengthdir_y(_off, _dir));
                var _amount_max = 5 + irandom(4);
                var _amount_now = 0;
                
                repeat (1000)
                {
                    if (_amount_now < _amount_max)
                    {
                        _off = 10;
                        var _offx = irandom_range(-_off, _off);
                        var _offy = irandom_range(-_off, _off);
                        var _x = (global.airdrop_x * 16) + (_offx * 16);
                        var _y = (global.airdrop_y * 16) + (_offy * 16);
                        var _free = scr_check_position_free(_x, _y);
                        
                        if (_free == true)
                        {
                            var _npc_to_create = obj_enemy_human_bandit_regular;
                            
                            if (scr_chance(50))
                                _npc_to_create = obj_loner_enemy;
                            
                            if (scr_chance(20))
                                _npc_to_create = obj_ghoul_spawn;
                            
                            instance_create_depth(_x, _y, 0, _npc_to_create);
                            _amount_now++;
                        }
                    }
                }
            }
        }
    }
    else if (global.airdrop_created == false)
    {
        if (global.santa2023_given_milk || global.general_debug)
        {
            global.airdrop_created = true;
            instance_create_depth((global.airdrop_x * 16) + 8, (global.airdrop_y * 16) + 12, 0, obj_chest_air_drop_natale);
            var _off = irandom(10);
            var _dir = irandom(360);
            ds_list_add(global.list_intresting_id, UnknownEnum.Value_6);
            ds_list_add(global.list_intresting_x, global.airdrop_x + lengthdir_x(_off, _dir));
            ds_list_add(global.list_intresting_y, global.airdrop_y + lengthdir_y(_off, _dir));
            var a = UnknownEnum.Value_0;
            var _amount;
            _amount[a] = 5 + choose(0, 0, 0, 5, 10);
            var _object;
            _object[a] = obj_enemy_human_bandit_novice;
            var _chance;
            _chance[a] = 2;
            a = UnknownEnum.Value_1;
            _amount[a] = 3 + choose(0, 0, 0, 2, 4, 10);
            _object[a] = obj_loner_enemy;
            _chance[a] = 2;
            a = UnknownEnum.Value_2;
            _amount[a] = 8 + irandom(5) + choose(0, 0, 0, 0, 25);
            _object[a] = obj_enemy_ghoul;
            _chance[a] = 2;
            a = UnknownEnum.Value_3;
            _amount[a] = 1 + choose(0, 0, 0, 2, 5);
            _object[a] = obj_enemy_big;
            _chance[a] = 1;
            a = UnknownEnum.Value_4;
            _amount[a] = 1 + choose(0, 0, 2);
            _object[a] = obj_boss_killa;
            _chance[a] = 1;
            a = UnknownEnum.Value_5;
            _amount[a] = 1 + choose(0, 0, 2);
            _object[a] = obj_boss_arman;
            _chance[a] = 1;
            a = UnknownEnum.Value_7;
            _amount[a] = 1 + choose(0, 0, 2);
            _object[a] = obj_enemy_human_bandit_boss_outpost;
            _chance[a] = 1;
            a = UnknownEnum.Value_6;
            _amount[a] = 1 + choose(0, 0, 2);
            _object[a] = obj_enemy_human_bandit_boss;
            _chance[a] = 1;
            a = UnknownEnum.Value_8;
            _amount[a] = 1 + choose(0, 0, 2);
            _object[a] = obj_boss_city;
            _chance[a] = 1;
            var _list = ds_list_create();
            
            for (var i = 0; i < array_length(_amount); i++)
            {
                repeat (_chance[i])
                    ds_list_add(_list, i);
            }
            
            ds_list_shuffle(_list);
            var _choosen = ds_list_find_value(_list, 0);
            var _amount_max = _amount[_choosen];
            var _amount_now = 0;
            
            repeat (1000)
            {
                if (_amount_now < _amount_max)
                {
                    _off = 10;
                    var _offx = irandom_range(-_off, _off);
                    var _offy = irandom_range(-_off, _off);
                    var _x = (global.airdrop_x * 16) + (_offx * 16);
                    var _y = (global.airdrop_y * 16) + (_offy * 16);
                    var _free = scr_check_position_free(_x, _y);
                    
                    if (_free == true)
                    {
                        var _npc_to_create = _object[_choosen];
                        instance_create_depth(_x, _y, 0, _npc_to_create);
                        _amount_now++;
                    }
                }
            }
        }
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
    Value_8
}
