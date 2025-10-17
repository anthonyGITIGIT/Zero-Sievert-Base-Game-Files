function skill_get_specialization_count(arg0)
{
    if (is_string(arg0))
    {
        var _new_index = skill_get_index(arg0);
        
        if (_new_index == undefined)
            __uiError("Skill \"", arg0, "\" not recognised");
        
        arg0 = _new_index;
    }
    
    if (arg0 >= array_length(global.sk_upgrade) || !is_array(global.sk_upgrade[arg0]))
        return 0;
    
    return array_length(global.sk_upgrade[arg0]);
}
