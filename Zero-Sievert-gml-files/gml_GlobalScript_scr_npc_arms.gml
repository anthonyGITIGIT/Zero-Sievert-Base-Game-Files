function scr_npc_arms(arg0, arg1)
{
    var ss = arg0;
    var arms = arg1;
    state = ss;
    draw_weapon = false;
    var aa = instance_create_depth(x, y, 0, arms);
    aa.linked_id = id;
    aa.image_xscale = image_xscale;
}
