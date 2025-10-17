event_inherited();

if (!variable_instance_exists(id, "mp_index"))
    __mp_error("Must create obj_player_puppet using player_create()");

player_init_load_items();
arma_now = player_loadout_exists(self, weapon_slot_now);
