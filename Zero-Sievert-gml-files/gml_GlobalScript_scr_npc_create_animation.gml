function scr_npc_create_animation(arg0)
{
    var arms = arg0;
    draw_weapon = false;
    var aa = instance_create_depth(x, y, 0, arms);
    aa.linked_id = id;
    aa.image_xscale = image_xscale;
}
