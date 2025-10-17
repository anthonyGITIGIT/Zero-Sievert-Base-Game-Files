function UiSkillsDescFromID(arg0)
{
    with (player_get_local())
        return language_get_string(variable_struct_get(global.skills_data, arg0).desc);
}
