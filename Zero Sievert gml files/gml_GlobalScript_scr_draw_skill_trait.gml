function scr_draw_skill_trait(arg0, arg1, arg2, arg3, arg4)
{
    var s_id_ = arg0;
    var xx = arg1;
    var yy = arg2;
    var lvl_max_ = arg4;
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    var id_skill = s_id_;
    var name_ = arg3;
    draw_text(xx, yy, name_);
    var w = sprite_get_width(s_pda_skill_level) + 2;
    
    for (var i = 0; i < lvl_max_; i++)
    {
        var im = 0;
        
        if (floor(s_id_) > i)
            im = 1;
        
        draw_sprite(s_pda_skill_level, im, xx + (w * i), yy + 10);
    }
}

enum UnknownEnum
{
    Value_0
}
