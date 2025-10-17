function UiSkillsMasteryPipCount(arg0)
{
    with (player_get_local())
        return skills.get_data(arg0).value_max;
    
    return 0;
}
