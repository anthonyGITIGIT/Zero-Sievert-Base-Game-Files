function skill_get_specialization(arg0)
{
    if (is_string(arg0))
    {
        var _new_index = skill_get_index(arg0);
        
        if (_new_index == undefined)
            __uiError("Skill \"", arg0, "\" not recognised");
        
        arg0 = _new_index;
    }
    
    var _upgrade_array = global.sk_upgrade[arg0];
    var _i = 0;
    
    repeat (array_length(_upgrade_array))
    {
        var _specialization_index = _upgrade_array[_i];
        
        if (global.sk_lvl[_specialization_index] >= 0)
            return _specialization_index;
        
        _i++;
    }
    
    return arg0;
}
