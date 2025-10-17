function player_action_weapon_closeup()
{
    with (player_get_local())
    {
        if (!player_state_is(mp_index, scr_player_state_weapon_look, scr_player_state_sleep))
        {
            if (!__uiGlobal().__defaultOnion.HasInputReceiver())
            {
                if (!player_get_local_var("aiming", false) && arms_holder == undefined)
                {
                    obj_camera.follow = UnknownEnum.Value_5;
                    obj_camera.wl_state = UnknownEnum.Value_0;
                    weapon_holder.pl_weap_state = UnknownEnum.Value_0;
                    weapon_holder.wl_angle_max = irandom_range(-30, 80);
                    weapon_holder.wl_off_x_max = irandom_range(-3, 4);
                    weapon_holder.wl_off_y_max = irandom_range(-3, 4);
                    player_set_local_state(scr_player_state_weapon_look);
                    return true;
                }
            }
        }
        
        return false;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_5 = 5
}
