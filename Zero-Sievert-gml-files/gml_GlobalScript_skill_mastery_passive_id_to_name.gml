function skill_mastery_passive_id_to_name(arg0)
{
    return language_get_string(variable_struct_get(global.skills_gun_passives_data.weapon_mastery_stats, arg0).name);
}
