function UiSkillsGunTypeMasteryName(arg0)
{
    with (player_get_local())
        return variable_struct_get(weapon_mastery.mastery_to_gun_lookup, arg0);
}
