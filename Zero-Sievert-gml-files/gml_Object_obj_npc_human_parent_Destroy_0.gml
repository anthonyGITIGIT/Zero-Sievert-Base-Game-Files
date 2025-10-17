event_inherited();

if (!delete_npc)
{
    var drop = instance_create_depth(x, y, -y, obj_chest_general);
    drop.tipo = npc_get_chest_dropped(npc_id);
    drop.arma_drop = arma_now;
    drop.ammo_drop = ammo_id_now;
    drop.armor_drop = armor_id;
    drop.armor_dur = armor_dur;
    drop.chest_sprite = sprite_dead;
    drop.name_chest = npc_name;
    drop.chest_faction = npc_get_faction(npc_id);
    drop.id_of_the_killer = id_of_the_killer;
    drop.chest_npc_id = npc_id;
    drop.depth = -y + 10;
    drop.image_xscale = image_xscale;
    loot_mod_cont_copy_to(mod_container, drop.mod_container);
    trace("Dropping chest for ", id);
    trace("npc_id = ", npc_id);
    trace("npc_name = ", npc_name);
    trace("arma_now = ", arma_now);
    trace("weapon_seed = ", weapon_seed);
    trace("create_item_in_chest = ", create_item_in_chest);
    trace(SnapToJSON(mod_container, true, true));
    
    if (create_item_in_chest == false)
        drop.create_item_in_chest = false;
}
