function UiSkillsMasteryArrayIDs(arg0, arg1)
{
    with (player_get_local())
        return mastery_to_skills.get_abilities(arg0, arg1);
}
