function skill_can_specialize(arg0)
{
    return !skill_is_specialized(arg0) && skill_get_specialization_count(arg0) > 0 && skill_get_level(arg0) >= skill_get_max_level(arg0);
}
