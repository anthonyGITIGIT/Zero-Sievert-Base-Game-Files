function scr_draw_skill(arg0, arg1, arg2)
{
    var s_id_ = arg0;
    var xx = arg1;
    var yy = arg2;
    var draw_normal = true;
    
    if (global.sk_hover == s_id_)
    {
        if (global.sk_base[global.sk_hover] == true && global.sk_lvl[global.sk_hover] >= global.sk_lvl_max[global.sk_hover])
        {
            draw_normal = false;
            language_set_font(UnknownEnum.Value_0);
            draw_set_halign(fa_center);
            draw_text(xx + global.language_font_offset.x + 40, yy + global.language_font_offset.y + 5, "specialize");
        }
    }
    
    if (global.sk_upgrading == true)
    {
        if (global.sk_selected == s_id_)
        {
            draw_normal = false;
            language_set_font(UnknownEnum.Value_0);
            draw_set_halign(fa_center);
            draw_text(xx + global.language_font_offset.x + 40, yy + global.language_font_offset.y + 5, "specialize");
        }
    }
    
    if (draw_normal == true)
    {
        language_set_font(UnknownEnum.Value_0);
        draw_set_halign(fa_left);
        var id_skill = s_id_;
        
        for (var i = 0; i < array_length_2d(global.sk_upgrade, s_id_); i++)
        {
            var spec_id = global.sk_upgrade[s_id_][i];
            
            if (global.sk_lvl[spec_id] >= 0)
                id_skill = spec_id;
        }
        
        var name_ = global.sk_name[id_skill];
        draw_text(xx + global.language_font_offset.x, yy + global.language_font_offset.y, name_);
        var w = sprite_get_width(s_pda_skill_level) + 2;
        
        for (var i = 0; i < global.sk_lvl_max[id_skill]; i++)
        {
            var im = 0;
            
            if (floor(global.sk_lvl[id_skill]) > i)
                im = 1;
            
            draw_sprite(s_pda_skill_level, im, xx + (w * i), yy + 10);
        }
    }
}

enum UnknownEnum
{
    Value_0
}
