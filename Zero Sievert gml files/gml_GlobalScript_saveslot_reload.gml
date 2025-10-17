global.Quest_Load_Version_Has_Changed = false;

function saveslot_reload()
{
    if (db_version_older_than("shared", 1, 2, 24))
        global.Quest_Load_Version_Has_Changed = true;
    
    inventory_set_target_db_to_pre_raid();
    hotfix_move_npc_to_pre_raid();
    hotfix_inventory_clean_up_all_positions();
    hotfix_chest_clean_up_all_positions();
    hotfix_convert_quest_objects();
    difficulty_sandbox_load();
    
    if (db_meta_read("shared", "save_version", undefined) == "0.31 production")
    {
        hotfix_npc_quest_array();
        hotfix_remove_completed_quests();
    }
    
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", []);
    loot_array_update_to_zs32(_loot_array, "player inventory");
    var _c = 0;
    
    repeat (db_read_ext("chest", "Storage", "slot now", 2))
    {
        _loot_array = db_read_ext("chest", "chest_" + string(_c), "items", []);
        loot_array_update_to_zs32(_loot_array, "player stash");
        _c++;
    }
}
