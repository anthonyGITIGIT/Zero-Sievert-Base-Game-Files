function npc_dialogue_get_heal_hp_price()
{
    if (!player_exists_local())
        return 0;
    
    var _player = player_get_local();
    return floor((_player.hp_max_total - _player.wound - _player.hp) * global.heal_hp_k);
}
