if (instance_exists(obj_prologue))
{
    if (place_meeting(x, y, obj_player_parent))
    {
        if (obj_prologue.state == UnknownEnum.Value_25)
        {
            obj_prologue.timer_go = true;
            obj_prologue.timer_max = 5;
        }
    }
}

enum UnknownEnum
{
    Value_25 = 25
}
