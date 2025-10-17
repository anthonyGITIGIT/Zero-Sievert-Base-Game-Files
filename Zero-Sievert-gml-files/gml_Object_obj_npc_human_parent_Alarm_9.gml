event_inherited();

if (hp_set == false)
{
    hp *= difficulty_get("enemy_human_hp");
    hp = clamp(hp, 1, 99999);
    hp_set = true;
}

linked_weapon_id = instance_create_depth(x, y, 0, obj_npc_weapon);
linked_weapon_id.follow_id = id;

if (item_get_category(arma_now) == "weapon")
    tipo_arma_equipped = item_weapon_get_type(arma_now);
