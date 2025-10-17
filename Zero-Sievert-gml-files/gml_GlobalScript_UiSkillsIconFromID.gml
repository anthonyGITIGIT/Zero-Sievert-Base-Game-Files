function UiSkillsIconFromID(arg0)
{
    with (player_get_local())
        return variable_struct_get(global.skills_data, arg0).icon;
}
