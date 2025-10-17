function experience_get_name()
{
    return global.xp_level_name[min(experience_get_level(), array_length(global.xp_level_name) - 1)];
}
