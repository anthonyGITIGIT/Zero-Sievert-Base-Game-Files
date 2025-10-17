function skill_obtained(arg0)
{
    with (player_get_local())
        return skills.get_value(arg0) > 0;
    
    return false;
}
