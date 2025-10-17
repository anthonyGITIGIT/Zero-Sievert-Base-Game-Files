function skill_hunter_obtained(arg0)
{
    with (player_get_local())
        return skills_hunter.get_value(arg0) > 0;
    
    return false;
}
