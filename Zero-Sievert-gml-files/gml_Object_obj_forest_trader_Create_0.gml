event_inherited();
npc_setup("forest_trader");
npc_setup_weapon();

if (quest_is_complete("igor_supplies"))
    instance_create_depth(x + 20, y, 0, obj_chest_forest_trader_regalo);
