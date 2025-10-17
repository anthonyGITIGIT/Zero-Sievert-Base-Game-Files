var _reset = false;

if (instance_exists(target))
{
    if (target_relation == UnknownEnum.Value_2)
    {
        if (point_distance(x, y, target.x, target.y) < 300)
            _reset = true;
    }
}
else
{
    _reset = true;
}

path_end();

if (_reset == true)
{
    state = npc_get_state_patrol(npc_id);
    target = -4;
    search_target_id = -4;
}
else
{
    alarm[5] = 90;
}

enum UnknownEnum
{
    Value_2 = 2
}
