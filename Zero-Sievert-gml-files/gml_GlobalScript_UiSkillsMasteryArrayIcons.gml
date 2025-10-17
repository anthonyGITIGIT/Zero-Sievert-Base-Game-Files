function UiSkillsMasteryArrayIcons(arg0, arg1)
{
    with (player_get_local())
    {
        var _array_of_ids = mastery_to_skills.get_abilities(arg0, arg1);
        var _to_return = [];
        var _count_of_ids = array_length(_array_of_ids);
        
        for (var i = 0; i < _count_of_ids; i++)
            _to_return[i] = UiSkillsIconFromID(_array_of_ids[i]);
        
        return _to_return;
    }
}
