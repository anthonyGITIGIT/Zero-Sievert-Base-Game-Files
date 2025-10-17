function npc_setup(arg0)
{
    if (variable_instance_exists(self, "npc_override"))
        arg0 = npc_override ?? arg0;
    
    npc_id = arg0;
    npc_name = npc_generate_name(npc_id);
    npc_speaker_id = npc_get_speaker_id(npc_id, true);
    armor_id = npc_get_armor(npc_id);
    faction = npc_get_faction(npc_id);
    hp = npc_get_hp(npc_id);
    state = npc_get_state_patrol(npc_id);
    sprite_idle = npc_set_sprite_idle(npc_id, armor_id);
    sprite_move = npc_set_sprite_move(npc_id, armor_id);
    sprite_dead = npc_set_sprite_dead(npc_id, armor_id);
    sprite_index = sprite_idle;
    grenade_amount_max = npc_get_grenade_amount(npc_id);
    reflexes_minimum = npc_get_reflexes_minimum(npc_id);
    reflexes_angle_min = npc_get_reflexes_angle_min(npc_id);
    reflexes_angle_max = npc_get_reflexes_angle_max(npc_id);
    reflexes_distance_min = npc_get_reflexes_distance_min(npc_id);
    reflexes_distance_max = npc_get_reflexes_distance_max(npc_id);
    angle_increase_for_target = npc_get_rotating_angle(npc_id);
    riflessi_max = reflexes_distance_max + reflexes_angle_max;
    NPCrecoil = new class_npcr_recoil(arg0, id);
}
