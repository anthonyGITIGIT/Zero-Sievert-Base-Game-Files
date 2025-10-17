function player_step_freeze_shooting()
{
    shooting_triggered = shooting && (mouse_check_button(mb_left) || obj_gamepad.action[UnknownEnum.Value_27].value);
    
    if (!player_state_is(mp_index, scr_player_state_move))
    {
        shooting = true;
        alarm[1] = 10;
    }
}

enum UnknownEnum
{
    Value_27 = 27
}
