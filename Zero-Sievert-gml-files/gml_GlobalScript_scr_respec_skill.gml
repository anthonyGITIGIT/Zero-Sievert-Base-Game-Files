function scr_respec_skill(arg0)
{
    var _skill_id = arg0;
    var _destroy = true;
    
    if (global.sk_base[_skill_id] == true)
    {
        var _specializzata = false;
        
        for (var i = 0; i < array_length_2d(global.sk_upgrade, _skill_id); i++)
        {
            var get_spec_skill = global.sk_upgrade[_skill_id][i];
            
            if (global.sk_lvl[get_spec_skill] >= 0)
            {
                _specializzata = true;
                var _amount_now = global.sk_lvl[get_spec_skill];
                global.sk_lvl[get_spec_skill] = -1;
                global.sk_lvl[_skill_id] = global.sk_lvl_max[_skill_id];
                scr_draw_text_with_box("Skill successfully reset");
            }
        }
        
        if (_specializzata == false)
        {
            scr_draw_text_with_box("You can't use this book yet: no specialisation found");
            _destroy = false;
        }
    }
    
    return _destroy;
}
