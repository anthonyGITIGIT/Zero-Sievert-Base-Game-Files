if (instance_exists(obj_prologue))
{
    if (place_meeting(x, y, obj_player_parent))
    {
        if (obj_prologue.state < UnknownEnum.Value_30)
            obj_prologue.state = UnknownEnum.Value_30;
    }
}

enum UnknownEnum
{
    Value_30 = 30
}
