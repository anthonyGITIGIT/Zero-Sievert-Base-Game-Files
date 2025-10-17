function UiSkillsGunTypeMasteryDesc(arg0)
{
    with (player_get_local())
    {
        var _arr = weapon_mastery.get_mastery_name_and_value_array(arg0);
        var _str = "";
        
        for (var i = 0; i < array_length(_arr); i++)
        {
            var _this_skill = _arr[i];
            var _display_value = 1 - _this_skill.value;
            var _up_or_down = sign(_display_value);
            _display_value = abs(_display_value);
            _display_value += 1;
            _display_value *= 100;
            _display_value -= 100;
            _display_value = round(_display_value);
            var _up_or_down_str = (_up_or_down < 0) ? "+" : "-";
            
            if (_up_or_down == 0)
                _up_or_down_str = "";
            
            _str += string(skill_mastery_passive_id_to_name(_this_skill.name));
            _str += " = ";
            _str += (_up_or_down_str + string(_display_value) + "%");
            _str += "\n";
        }
        
        return _str;
    }
}
