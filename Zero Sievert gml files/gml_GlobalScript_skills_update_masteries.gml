function skills_update_masteries()
{
    with (player_get_local())
    {
        var _gun_type = item_weapon_get_type(arma_now);
        var _gun_type_count = array_length(global.weapon_type_data_array);
        
        for (var i = 0; i < _gun_type_count; i++)
        {
            var _type_str = global.weapon_type_data_array[i];
            var _use_exp = stat_get_value(_type_str + "_exp") + (variable_global_get(_type_str + "_exp") * difficulty_get("pro_exp_multiplier"));
            var _arr_exp = global.skills_masteries_data.exp_rank.total;
            var _found = false;
            var _was = skills.get_value("mastery_" + _type_str);
            
            for (var j = 0; j < array_length(_arr_exp); j++)
            {
                if (_found == false)
                {
                    if ((_use_exp div _arr_exp[j]) == 0)
                    {
                        skills.set("mastery_" + _type_str, j);
                        _found = true;
                    }
                }
            }
            
            if (_found == false)
                skills.set("mastery_" + _type_str, array_length(_arr_exp));
            
            if (_was < skills.get_value("mastery_" + _type_str) && skills.get_value_dec("mastery_" + _type_str) < 1)
            {
                var str = language_get_string("Improved x rank");
                str = language_get_string(string_replace(str, "[TYPE]", UiGunTypeToHumanString(string(_type_str))));
                scr_draw_text_with_box(str);
            }
            else if (_was < skills.get_value("mastery_" + _type_str) && skills.get_value_dec("mastery_" + _type_str) >= 1)
            {
                var str = language_get_string("Reached max x rank");
                str = language_get_string(string_replace(str, "[TYPE]", UiGunTypeToHumanString(string(_type_str))));
                scr_draw_text_with_box(str);
            }
        }
        
        maxedoutpistol_achievement();
        maxedoutsmg_achievement();
        maxedoutshotgun_achievement();
        maxedoutrifle_achievement();
        maxedoutdmr_achievement();
        maxedoutsniper_achievement();
    }
}
