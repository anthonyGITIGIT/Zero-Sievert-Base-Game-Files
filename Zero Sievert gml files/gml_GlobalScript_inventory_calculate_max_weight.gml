function inventory_calculate_max_weight(arg0)
{
    var _weight_max_skills = 0;
    
    if (skill_hunter_obtained("mule"))
        _weight_max_skills += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("mule")), variable_get_hash("carry_weight_bonus"));
    
    if (skill_hunter_obtained("bighands"))
    {
        var _weapons = player_loadout_get_weapons();
        _weight_max_skills += (struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("bighands")), variable_get_hash("carry_weight_bonus_per")) * (array_length(_weapons) < 1));
        _weight_max_skills += (struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("bighands")), variable_get_hash("carry_weight_bonus_per")) * (array_length(_weapons) < 2));
    }
    
    return clamp(difficulty_get("pro_min_carry_weight") + item_backpack_get_weight(arg0) + global.sk_k[UnknownEnum.Value_1] + global.injector_factor[UnknownEnum.Value_6] + _weight_max_skills, 0, 9999);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_6 = 6
}
