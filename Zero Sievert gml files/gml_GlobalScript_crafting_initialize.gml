function class_crafting_mode(arg0, arg1, arg2, arg3, arg4 = class_ui_loot_crafting) constructor
{
    name = arg0;
    macro = arg1;
    loot_generator_function = arg2;
    crafting_function = arg3;
    ui_constructor = arg4;
}

function crafting_mode_create(arg0, arg1, arg2, arg3, arg4 = undefined)
{
    var _mode = new class_crafting_mode(arg0, arg1, arg2, arg3, arg4);
    array_push(global.crafting_mode_array, arg1);
    variable_struct_set(global.crafting_mode_dict, arg1, _mode);
    return _mode;
}

function crafting_initialize()
{
    global.crafting_mode_array = [];
    global.crafting_mode_dict = {};
    crafting_mode_create("Medication", "medication", function()
    {
        return crafting_loot_array_from_type(UnknownEnum.Value_0);
    }, function(arg0)
    {
        return crafting_craft(arg0);
    });
    crafting_mode_create("Ammunition", "ammunition", function()
    {
        return crafting_loot_array_from_type(UnknownEnum.Value_1);
    }, function(arg0)
    {
        return crafting_craft(arg0);
    });
    crafting_mode_create("Food", "food", function()
    {
        return crafting_loot_array_from_type(UnknownEnum.Value_2);
    }, function(arg0)
    {
        return crafting_craft(arg0);
    });
    crafting_mode_create("Repair Kit", "repair_kit", function()
    {
        return crafting_loot_array_from_type(UnknownEnum.Value_3);
    }, function(arg0)
    {
        return crafting_craft(arg0);
    });
    crafting_mode_create("Repair Gear", "repair_gear", function()
    {
        return inventory_and_stash_get_repairable_array();
    }, function(arg0)
    {
        return crafting_repair(arg0);
    });
    crafting_mode_create("Mod Weapons", "mod_weapons", function()
    {
        return inventory_and_stash_get_moddable_array();
    }, function(arg0)
    {
        exit;
    }, class_ui_loot_crafting_go_to_modding);
    crafting_mode_create("Modules Tier 1", "modules_tier_1", function()
    {
        return crafting_loot_array_from_type(UnknownEnum.Value_6);
    }, function(arg0)
    {
        return crafting_craft(arg0);
    });
    crafting_mode_create("Modules Tier 2", "modules_tier_2", function()
    {
        return crafting_loot_array_from_type(UnknownEnum.Value_7);
    }, function(arg0)
    {
        return crafting_craft(arg0);
    });
    crafting_mode_create("Modules Tier 2+", "modules_tier_3", function()
    {
        return crafting_loot_array_from_type(UnknownEnum.Value_8);
    }, function(arg0)
    {
        return crafting_craft(arg0);
    });
    crafting_mode_create("Extras", "extras", function()
    {
        return crafting_loot_array_from_type(UnknownEnum.Value_9);
    }, function(arg0)
    {
        return crafting_craft(arg0);
    });
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_6 = 6,
    Value_7,
    Value_8,
    Value_9
}
