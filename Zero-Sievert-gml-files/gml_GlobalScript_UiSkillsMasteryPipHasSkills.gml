function UiSkillsMasteryPipHasSkills(arg0)
{
    with (player_get_local())
        return mastery_to_skills.get_abilities_array_count(arg0);
}
