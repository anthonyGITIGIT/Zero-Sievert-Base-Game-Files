function npc_setup_weapon()
{
    arma_now = npc_get_weapon(npc_id);
    ammo_magazine = item_weapon_get_magazine(arma_now);
    ammo_now = ammo_magazine;
    
    if (item_weapon_get_moddable(arma_now))
    {
        loot_mod_cont_copy_from_default(mod_container, arma_now);
        
        if (npc_id == "killa")
        {
            loot_mod_cont_clear(mod_container);
            loot_mod_cont_set(mod_container, "stock", "mod_rpk_stock");
            loot_mod_cont_set(mod_container, "grip", "mod_rpk_grip");
            loot_mod_cont_set(mod_container, "handguard", "mod_rpk_handguard_1");
            loot_mod_cont_set(mod_container, "magazine", "mod_rpk_magazine");
            loot_mod_cont_set(mod_container, "scope", "mod_scope_mrs");
            loot_mod_cont_set(mod_container, "att_1", "mod_foregrip_1");
            loot_mod_cont_set(mod_container, "att_2", "mod_torch_2");
            loot_mod_cont_set(mod_container, "att_4", "mod_laser_rosso");
        }
        else
        {
            random_set_seed(weapon_seed);
            var _random_mods = variable_struct_get(global.item_possible_mod_data, arma_now).Generate(npc_get_attachment_value(npc_id));
            _random_mods.ChooseAll(mod_container);
            trace("Generating weapon ...");
            trace("id = ", id);
            trace("npc_id = ", npc_id);
            trace("arma_now = ", arma_now);
            trace("weapon_seed = ", weapon_seed);
            trace(SnapToJSON(mod_container, true, true));
        }
        
        var _stats = item_weapon_get_modded_stats(arma_now, mod_container);
        recoil_arma = _stats.recoil;
        ammo_now = item_weapon_get_modded_magazine_size(arma_now, mod_container);
    }
}
