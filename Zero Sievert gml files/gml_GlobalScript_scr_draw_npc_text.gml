function scr_draw_npc_text(arg0, arg1)
{
    var id_ = arg0;
    var text_ = arg1;
    
    if (!instance_exists(id_))
        exit;
    
    if (instance_exists(obj_npc_draw_text))
    {
        with (obj_npc_draw_text)
        {
            if (id_npc == id_)
                instance_destroy();
        }
    }
    
    var dd = instance_create_depth(id_.x, id_.y - 24, -15921, obj_npc_draw_text);
    dd.text_id = text_;
    dd.id_npc = id_;
    dd.id_che_parla = id_.id;
    dd.text_speed = global.t_npc_text_speed[text_];
    dd.text_timer = global.t_npc_text_timer[text_];
}
