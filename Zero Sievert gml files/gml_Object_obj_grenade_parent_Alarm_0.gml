if (thrown_by_player == true)
{
    if (skill_hunter_obtained("grenadeexpert"))
    {
        radius_max_damage *= (1 + struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("grenadeexpert")), variable_get_hash("damage_radius_multiplier")));
        radius_min_damage *= (1 + struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("grenadeexpert")), variable_get_hash("damage_radius_multiplier")));
    }
}
