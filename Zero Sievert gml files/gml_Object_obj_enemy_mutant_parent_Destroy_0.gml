event_inherited();

if (!delete_npc)
{
    if (object_index != obj_enemy_crow)
    {
        var drop = instance_create_depth(x, y, -y, obj_chest_general);
        drop.tipo = npc_get_chest_dropped(npc_id);
        drop.chest_sprite = sprite_dead;
        drop.depth = -y + 10;
        drop.image_xscale = image_xscale;
        drop.name_chest = npc_name;
        
        if (create_item_in_chest == false)
            drop.create_item_in_chest = false;
    }
}
