var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

if (player_exists_local() && instance_exists(obj_mouse) && !instance_exists(obj_camera_test))
{
    var _player = player_get_local();
    
    if (follow == UnknownEnum.Value_1)
    {
        if (!global.shake && player_local_state_is(scr_player_state_move, scr_player_state_consumable_animation))
        {
            view_w = camera_get_view_width(view_camera[0]);
            view_h = camera_get_view_height(view_camera[0]);
            var cur_x = camera_get_view_x(view_camera[0]);
            var cur_y = camera_get_view_y(view_camera[0]);
            var lookdist = 0;
            var viewdist = global.gamepad_data.gamepad.aiming_view_distance;
            
            if (mouse_check_button(mb_right))
            {
                _player.hspd *= 0.5;
                _player.vspd *= 0.5;
                
                if (item_exists(_player.arma_now))
                {
                    viewdist = item_weapon_get_default_extend_view(_player.arma_now);
                    var _scope = player_loadout_get_mod(_player, _player.weapon_slot_now, "scope");
                    
                    if (item_exists(_scope))
                        viewdist = item_mod_get_scope_extend_view(_scope);
                }
            }
            
            if (obj_gamepad.action[UnknownEnum.Value_28].value)
            {
                _player.hspd *= 0.5;
                _player.vspd *= 0.5;
                
                if (item_exists(_player.arma_now))
                {
                    viewdist = item_weapon_get_default_extend_view(_player.arma_now);
                    var _scope = player_loadout_get_mod(_player, _player.weapon_slot_now, "scope");
                    
                    if (item_exists(_scope))
                        viewdist = item_mod_get_scope_extend_view(_scope);
                }
            }
            
            var _x = x;
            var _y = y;
            lookdist = lerp(lookdist, viewdist, 0.084);
            _x = lerp(_player.x, obj_mouse.x, lookdist) - (view_w / 2);
            _y = lerp(_player.y, obj_mouse.y, lookdist * 1.16) - (view_h / 2);
            nofollowx = _x;
            nofollowy = _y;
            _x = clamp(_x, 0, room_width - view_w);
            _y = clamp(_y, 0, room_height - view_h);
            camera_set_view_size(view_camera[0], view_w, view_h);
            camera_set_view_pos(view_camera[0], lerp(cur_x, _x, 0.2), lerp(cur_y, _y, 0.2));
            x = _x + (view_w / 2);
            y = _y + (view_h / 2);
            var getx = camera_get_view_x(view_camera[0]);
            var gety = camera_get_view_y(view_camera[0]);
            getx = clamp(getx, 0, room_width);
            gety = clamp(gety, 0, room_height);
            
            if (player_exists_local())
            {
                if (is_in_hub())
                {
                    if (is_inside_bunker())
                    {
                        gety = clamp(gety, 0, 1114 - view_h);
                    }
                    else
                    {
                        gety = clamp(gety, 1130, room_height);
                        getx = clamp(getx, 384, 976 - view_w);
                    }
                    
                    camera_set_view_pos(view_camera[0], getx, gety);
                }
                
                if (player_distance_local(x, y) > 400)
                {
                    x = player_get_local().x;
                    y = player_get_local().y;
                    obj_mouse.x = player_get_local().x;
                    obj_mouse.y = player_get_local().y;
                    camera_set_view_pos(view_camera[0], x - 240, y - 135);
                }
            }
        }
    }
    
    if (follow == UnknownEnum.Value_0)
    {
        if (obj_map_generator.state == UnknownEnum.Value_0 || obj_map_generator.state == UnknownEnum.Value_1 || obj_map_generator.state == UnknownEnum.Value_2 || obj_map_generator.state == UnknownEnum.Value_3 || obj_map_generator.state == UnknownEnum.Value_4 || obj_map_generator.state == UnknownEnum.Value_5 || obj_map_generator.state == UnknownEnum.Value_6 || obj_map_generator.state == UnknownEnum.Value_7 || obj_map_generator.state == UnknownEnum.Value_8 || obj_map_generator.state == UnknownEnum.Value_9 || obj_map_generator.state == UnknownEnum.Value_10 || obj_map_generator.state == UnknownEnum.Value_11 || obj_map_generator.state == UnknownEnum.Value_12 || obj_map_generator.state == UnknownEnum.Value_13 || obj_map_generator.state == UnknownEnum.Value_14 || obj_map_generator.state == UnknownEnum.Value_15 || obj_map_generator.state == UnknownEnum.Value_16)
        {
            camera_set_view_pos(view_camera[0], 0, 0);
            camera_set_view_size(view_camera[0], room_width, obj_map_generator.map_height);
        }
        else if (instance_exists(obj_train))
        {
            var lenx = 32;
            var leny = 36;
            vel_camera = 0.1;
            view_w = camera_get_view_width(view_camera[0]);
            view_h = camera_get_view_height(view_camera[0]);
            var xto = obj_train.x - (96 * obj_train.image_xscale);
            var yto = obj_train.y;
            var amountx = (xto - x) * vel_camera;
            var amounty = (yto - y) * vel_camera;
            amountx = clamp(amountx, 1, 100) * sign(amountx);
            amounty = clamp(amounty, 1, 100) * sign(amounty);
            x += ((xto - x) * vel_camera);
            y += ((yto - y) * vel_camera);
            camera_set_view_pos(view_camera[0], -(view_w / 2) + x, -(view_h / 2) + y);
            var getx = camera_get_view_x(view_camera[0]);
            var gety = camera_get_view_y(view_camera[0]);
            getx = clamp(getx, 480, room_width - 480);
            gety = clamp(gety, 270, room_height - 270);
            camera_set_view_size(view_camera[0], 480, 270);
            camera_set_view_pos(view_camera[0], getx, gety);
            
            if (point_distance(x, y, obj_train.x, obj_train.y) > 400)
            {
                x = obj_train.x;
                y = obj_train.y;
                obj_mouse.x = obj_train.x;
                obj_mouse.y = obj_train.y;
                camera_set_view_pos(view_camera[0], x - 240, y - 135);
            }
        }
        else
        {
            follow = UnknownEnum.Value_1;
            x = obj_player.x;
            y = obj_player.y;
            
            with (obj_player)
            {
                visible = true;
                player_set_state(scr_player_state_move, mp_index);
            }
        }
    }
    
    if (follow == UnknownEnum.Value_3)
    {
        var o = obj_controller;
        var page_ = o.tut_text_page;
        var xx = o.tut_x[page_];
        var yy = o.tut_y[page_];
        var amountx = xx - x;
        var amounty = yy - y;
        var vel = 0.035;
        x += (amountx * vel);
        y += (amounty * vel);
        camera_set_view_size(view_camera[0], 480, 270);
        camera_set_view_pos(view_camera[0], -(view_w / 2) + x, -(view_h / 2) + y);
    }
    
    if (follow == UnknownEnum.Value_4)
    {
        var xx = obj_cristallo_viola.x;
        var yy = obj_cristallo_viola.y;
        var amountx = xx - x;
        var amounty = yy - y;
        var vel = 0.01;
        x += (amountx * vel);
        y += (amounty * vel);
        camera_set_view_size(view_camera[0], 480, 270);
        camera_set_view_pos(view_camera[0], -(view_w / 2) + x, -(view_h / 2) + y);
    }
    
    if (follow == UnknownEnum.Value_6)
    {
        var xx = obj_quest_end_game.x;
        var yy = obj_quest_end_game.y + 48;
        var amountx = xx - x;
        var amounty = yy - y;
        var vel = 0.02;
        x += (amountx * vel);
        y += (amounty * vel);
        camera_set_view_size(view_camera[0], 480, 270);
        camera_set_view_pos(view_camera[0], -(view_w / 2) + x, -(view_h / 2) + y);
    }
    
    if (follow == UnknownEnum.Value_5)
    {
        switch (wl_state)
        {
            case UnknownEnum.Value_0:
                wl_timer_avv++;
                var _k = wl_timer_avv / wl_timer_avv_max;
                var _view_w = lerp(480, wl_view_w, power(_k, 1 - _k));
                var _view_h = lerp(270, wl_view_h, power(_k, 1 - _k));
                camera_set_view_size(view_camera[0], _view_w, _view_h);
                
                if (wl_timer_avv >= wl_timer_avv_max)
                {
                    wl_state = UnknownEnum.Value_1;
                    wl_timer_avv = 0;
                }
                
                break;
            
            case UnknownEnum.Value_1:
                wl_timer_look++;
                
                if (wl_timer_look >= wl_timer_look_max)
                {
                    wl_timer_look = 0;
                    wl_state = UnknownEnum.Value_2;
                }
                
                camera_set_view_size(view_camera[0], wl_view_w, wl_view_h);
                break;
            
            case UnknownEnum.Value_2:
                wl_timer_avv++;
                var _k = wl_timer_avv / wl_timer_avv_max;
                var _view_w = lerp(wl_view_w, 480, power(_k, 1 - _k));
                var _view_h = lerp(wl_view_h, 270, power(_k, 1 - _k));
                camera_set_view_size(view_camera[0], _view_w, _view_h);
                
                if (wl_timer_avv >= wl_timer_avv_max)
                {
                    if (player_get_state() == scr_player_state_weapon_look)
                    {
                        follow = UnknownEnum.Value_1;
                        player_set_local_state(scr_player_state_move);
                        wl_timer_avv = 0;
                    }
                }
                
                break;
        }
        
        if (player_get_state() == scr_player_state_dead)
            camera_set_view_size(view_camera[0], 480, 270);
        
        var _ww = camera_get_view_width(view_camera[0]);
        var _hh = camera_get_view_height(view_camera[0]);
        camera_set_view_pos(view_camera[0], _player.x - (_ww / 2), _player.y - (_hh / 2));
    }
    
    if (follow == UnknownEnum.Value_1)
    {
        if (global.general_debug && player_local_state_is(scr_player_state_start, scr_player_state_free_camera))
        {
            camera_set_view_size(view_camera[0], view_w, view_h);
            camera_set_view_pos(view_camera[0], player_get_local().x - 240, player_get_local().y - 135);
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
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_28 = 28
}
