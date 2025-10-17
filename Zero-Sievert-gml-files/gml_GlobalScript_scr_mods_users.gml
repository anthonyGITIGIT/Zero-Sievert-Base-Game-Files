function __MODS_ItemCreate(arg0, arg1 = "none")
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: arg1,
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "none",
                sprite_ingame: "s_item_undefined",
                sprite_inv: "s_item_undefined",
                stack_max: 1,
                value: 0,
                weight: 0.5
            }
        });
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        array_push(global.item_data_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemCreateAmmo(arg0, arg1 = "", arg2 = 0, arg3 = 0, arg4 = 0.015, arg5 = "rifle", arg6 = 1, arg7 = 25, arg8 = 0, arg9 = 0)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "ammo",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "none",
                sprite_ingame: "s_item_book_cardio",
                sprite_inv: "s_item_book_cardio",
                stack_max: 100,
                value: 0,
                weight: 0.05
            },
            ammo: 
            {
                acc: arg2,
                caliber: arg1,
                damage: arg3,
                dur: arg4,
                eff_range: arg5,
                number: arg6,
                pen: arg7,
                recoil: arg8,
                shell: arg9
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.caliber_data, arg1, 
        {
            name: arg1
        });
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, item_get_category(arg0)), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemSetSpriteIngame(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, __MODS_SpriteGet(arg1));
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that does not exists, \"" + arg0 + "\"");
}

function __MODS_ItemSetSpriteInventory(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, __MODS_SpriteGet(arg1));
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that does not exists, \"" + arg0 + "\"");
}

function __MODS_ItemSetName(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).basic.name = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemSetDescription(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).basic.description = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemSetWeight(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).basic.weight = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemSetPriceValue(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).basic.value = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemSetStackLimit(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).basic.stack_max = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemSetConsumableSound(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        if (!variable_struct_exists(variable_struct_get(global.item_data, arg0), "consumable"))
            variable_struct_get(global.item_data, arg0).consumable = {};
        
        struct_get_from_hash(variable_struct_get(global.item_data, arg0), variable_get_hash("consumable")).sound = arg1;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemMedicalCreate(arg0, arg1 = 0, arg2 = "snd_medikit_1")
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "medication",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "none",
                sprite_ingame: "s_item_medikit_1",
                sprite_inv: "s_item_medikit_1",
                stack_max: 10,
                value: 0,
                weight: 0.05
            },
            consumable: 
            {
                sound: arg2
            },
            medicine: 
            {
                hp: arg1,
                radiation: 0,
                animation: "s_arms_med1",
                bleed: 0,
                can_move: false,
                duration: 30,
                speed_multiplier: 0.5,
                wound: 0
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, item_get_category(arg0)), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemMedicalSetAnimation(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).medicine.animation = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemMedicalSetWound(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).medicine.wound = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemMedicalSetRadiation(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).medicine.radiation = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemMedicalSetMoveSpeedMultiplier(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).medicine.speed_multiplier = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemMedicalSetDuration(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).medicine.duration = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemMedicalSetCanMove(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).medicine.can_move = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemMedicalSetBleed(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).medicine.bleed = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorCreate(arg0)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "injector",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "med",
                sprite_ingame: "s_item_injector1",
                sprite_inv: "s_item_injector1",
                stack_max: 3,
                value: 0,
                weight: 0.1
            },
            injector: 
            {
                bleed_immune: false,
                bleed_rec: 0,
                duration: 14400,
                hp_regen: 0,
                hunger: -10,
                hunger_regen: -10,
                max_hp: 0,
                max_weight: 0,
                rad_def: 0,
                rad_regen: 0,
                stamina_max: 40,
                stamina_regen: 100,
                thirst: -10,
                thirst_regen: -15
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = "medication";
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetBleedImmune(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.bleed_immune = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetBleedRec(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.bleed_rec = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetDuration(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.duration = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetHpRegen(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.hp_regen = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetHunger(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.hunger = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetHungerRegen(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.hunger_regen = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetMaxHp(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.max_hp = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetMaxWeight(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.max_weight = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetRadDef(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.rad_def = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetRadRegen(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.rad_regen = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetStaminaMax(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.stamina_max = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetStaminaRegen(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.stamina_regen = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetThirst(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.thirst = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemInjectorSetThirstRegen(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).injector.thirst_regen = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemBackpackCreate(arg0)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "backpack",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "none",
                sprite_ingame: "s_item_backpack_un",
                sprite_inv: "s_item_backpack_un",
                stack_max: 1,
                value: 25000,
                weight: 0
            },
            backpack: 
            {
                ergonomic: 0,
                movement_speed: 0,
                sprite_game: "s_item_backpack_un_game",
                weight: 20
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = "armor";
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemBackpackSetErgonomic(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).backpack.ergonomic = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemBackpackSetMovementSpeed(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).backpack.movement_speed = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemBackpackSetSpriteGame(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).backpack.sprite_game = arg1;
        variable_struct_set(global.Mods_Sprite_Backpack_Data, arg1, __MODS_SpriteGet(arg1));
        sprite_set_speed(variable_struct_get(global.Mods_Sprite_Backpack_Data, arg1), 15, 0);
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemBackpackSetWeight(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).backpack.weight = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeCreate(arg0)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "grenade",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "ammo",
                sprite_ingame: "s_item_grenade_f1_game",
                sprite_inv: "s_item_grenade_f1",
                stack_max: 1,
                value: 5000,
                weight: 0.5
            },
            consumable: 
            {
                sound: "snd_medikit_1"
            },
            grenade: 
            {
                animation: "s_arms_grenade_rgd",
                throw_min: 48,
                throw_max: 210,
                fuse_time: 120,
                throw_type: "GRENADE_throw_bounce",
                damage_max: 150,
                damage_min: 50,
                detonation_type: "GRENADE_detonation_explosion",
                detonation_duration: 0,
                radius_max_damage: 32,
                radius_min_damage: 52
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = item_get_category(arg0);
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetAnimation(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.animation = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetThrowMin(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.throw_min = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetThrowMax(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.throw_max = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetFuseTime(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.fuse_time = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetThrowType(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.throw_type = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetDamageMax(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.damage_max = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetDamageMin(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.damage_min = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetDetonationType(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.detonation_type = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetDetonationDuration(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.detonation_duration = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetRadiusMaxDamage(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.radius_max_damage = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemGrenadeSetRadiusMinDamage(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).grenade.radius_min_damage = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorCreate(arg0)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "armor",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "armor",
                sprite_ingame: "s_item_armor_bandit_1",
                sprite_inv: "s_item_armor_bandit_1",
                stack_max: 1,
                value: 7000,
                weight: 2
            },
            armor: 
            {
                anomaly: 0,
                class: 1,
                dur_damage: 2,
                pierce: 0.1,
                radiation: 0,
                s_dead: "s_bandit_novice_dead",
                s_idle: "s_bandit_novice_idle",
                s_run: "s_bandit_novice_run"
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = "armor";
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorSetAnomaly(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).armor.anomaly = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorSetClass(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).armor.class = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorSetFragility(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).armor.dur_damage = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorSetPierce(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).armor.pierce = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorSetRadiation(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).armor.radiation = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorSetSpriteDead(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).armor.s_dead = arg1;
        variable_struct_set(global.Mods_Sprite_Armor_Data, arg1, __MODS_SpriteGet(arg1));
        sprite_set_speed(variable_struct_get(global.Mods_Sprite_Armor_Data, arg1), 15, 0);
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorSetSpriteIdle(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).armor.s_idle = arg1;
        variable_struct_set(global.Mods_Sprite_Armor_Data, arg1, __MODS_SpriteGet(arg1));
        sprite_set_speed(variable_struct_get(global.Mods_Sprite_Armor_Data, arg1), 15, 0);
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmorSetSpriteRun(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).armor.s_run = arg1;
        variable_struct_set(global.Mods_Sprite_Armor_Data, arg1, __MODS_SpriteGet(arg1));
        sprite_set_speed(variable_struct_get(global.Mods_Sprite_Armor_Data, arg1), 15, 0);
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemConsumableCreate(arg0)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "consumable",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "food",
                sprite_ingame: "s_item_bread",
                sprite_inv: "s_item_bread",
                stack_max: 1,
                value: 100,
                weight: 0.3
            },
            consumable: 
            {
                animation: "s_arms_eat",
                energy: 0,
                fatigue: 0,
                radiation: 0,
                sound: "snd_eating_1",
                thirst: 0,
                consume_function: undefined
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = item_get_category(arg0);
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemConsumableSetAnimation(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).consumable.animation = arg1;
        variable_struct_set(global.Mods_Sprite_Consumable_Animation_Data, arg1, __MODS_SpriteGet(arg1));
        sprite_set_speed(variable_struct_get(global.Mods_Sprite_Consumable_Animation_Data, arg1), 15, 0);
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemConsumableSetEnergy(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).consumable.energy = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemConsumableSetFatigue(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).consumable.fatigue = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemConsumableSetRadiation(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).consumable.radiation = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemConsumableSetSound(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).consumable.sound = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemConsumableSetThirst(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).consumable.thirst = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemConsumableSetEvent(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).consumable.consume_function = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_ItemHeadsetCreate(arg0)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "headset",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "material",
                sprite_ingame: "s_headset_lamp1",
                sprite_inv: "s_headset_lamp1",
                stack_max: 1,
                value: 6000,
                weight: 0.3
            },
            headset: 
            {
                light_id: "headset_lamp_1",
                type: "torch",
                red: 1,
                blue: 1,
                green: 1,
                brightness: 0,
                contrast: 0,
                gamma: 1,
                grain: 0
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = item_get_category(arg0);
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemHeadsetSetLightID(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).headset.light_id = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemHeadsetSetType(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).headset.type = arg1;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemHeadsetSetVisionValues(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).headset.red = arg1;
        variable_struct_get(global.item_data, arg0).headset.green = arg2;
        variable_struct_get(global.item_data, arg0).headset.blue = arg3;
        variable_struct_get(global.item_data, arg0).headset.brightness = arg4;
        variable_struct_get(global.item_data, arg0).headset.contrast = arg5;
        variable_struct_get(global.item_data, arg0).headset.gamma = arg6;
        variable_struct_get(global.item_data, arg0).headset.grain = arg7;
        return true;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_ItemBarterCreate(arg0)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "barter",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "material",
                sprite_ingame: "s_item_alchool",
                sprite_inv: "s_item_alchool",
                stack_max: 5,
                value: 10,
                weight: 0.1
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = item_get_category(arg0);
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemArmourRepairCreate(arg0, arg1 = 1, arg2 = true, arg3 = true, arg4 = true, arg5 = true, arg6 = true, arg7 = true, arg8 = true)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        var _condition_string = arg1 ? "{armor high}" : "{armor low}";
        var _class_array = [];
        
        if (arg2)
            array_push(_class_array, 0);
        
        if (arg3)
            array_push(_class_array, 1);
        
        if (arg4)
            array_push(_class_array, 2);
        
        if (arg5)
            array_push(_class_array, 3);
        
        if (arg6)
            array_push(_class_array, 4);
        
        if (arg7)
            array_push(_class_array, 5);
        
        if (arg8)
            array_push(_class_array, 6);
        
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "repair_armor",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "none",
                sprite_ingame: "s_item_repair_armor_low",
                sprite_inv: "s_item_repair_armor_low",
                stack_max: 1,
                value: 0,
                weight: 4
            },
            repair: 
            {
                condition_gain: _condition_string,
                condition_max: _condition_string,
                condition_min: _condition_string,
                armor_class: _class_array
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = "consumable";
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemWeaponRepairCreate(arg0, arg1 = 1, arg2 = [])
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        var _condition_string = arg1 ? "{weapon high}" : "{weapon low}";
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "repair_weapon",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "none",
                sprite_ingame: "s_item_repair_weapon2_low",
                sprite_inv: "s_item_repair_weapon2_low",
                stack_max: 1,
                value: 0,
                weight: 4
            },
            repair: 
            {
                condition_gain: _condition_string,
                condition_max: _condition_string,
                condition_min: _condition_string,
                caliber: arg2
            }
        });
        array_push(global.item_data_array, arg0);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        var _debug_category_string = "consumable";
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemKeyCreate(arg0, arg1 = true)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "key",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "none",
                sprite_ingame: "s_item_undefined",
                sprite_inv: "s_item_undefined",
                stack_max: 1,
                value: 0,
                weight: 0.05
            },
            key: 
            {
                single_use: arg1
            }
        });
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        array_push(global.item_data_array, arg0);
        var _debug_category_string = "book";
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_ItemDocumentCreate(arg0, arg1 = 1)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, 
        {
            basic: 
            {
                category: "documents",
                description: "There's no description",
                name: "No Name",
                quest_item: false,
                can_be_sold: true,
                scrap: "none",
                sprite_ingame: "s_item_undefined",
                sprite_inv: "s_item_undefined",
                stack_max: 1,
                value: 0,
                weight: 0.1,
                documents_rep: arg1
            },
            document: 
            {
                reputation: arg1
            }
        });
        variable_struct_set(global.Mods_Sprite_Ingame_Data, arg0, s_item_undefined);
        variable_struct_set(global.Mods_Sprite_Inventory_Data, arg0, s_item_undefined);
        array_push(global.item_data_array, arg0);
        var _debug_category_string = "book";
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, _debug_category_string), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create an item that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_InventoryItemExists(arg0)
{
    return inventory_item_exists(arg0);
}

function __MODS_InventoryItemCount(arg0)
{
    return inventory_get_total_of_item(arg0);
}

function __MODS_WeaponCreate(arg0, arg1 = "rifle", arg2, arg3, arg4, arg5 = [])
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, SnapDeepCopy(struct_get_from_hash(global.item_data, variable_get_hash("ak_74"))));
        array_push(global.item_data_array, arg0);
        variable_struct_get(global.item_data, arg0).basic.description = "There's no description";
        variable_struct_get(global.item_data, arg0).basic.name = "No Name";
        variable_struct_get(global.item_data, arg0).weapon.caliber = arg4;
        variable_struct_get(global.item_data, arg0).weapon.moddable = arg2;
        variable_struct_get(global.item_data, arg0).weapon.mods = {};
        variable_struct_get(global.item_data, arg0).weapon.ammo = arg3;
        variable_struct_get(global.item_data, arg0).weapon.type = arg1;
        variable_struct_get(global.item_data, arg0).weapon.type_effective_range = arg1;
        variable_struct_get(global.item_data, arg0).weapon.type_effective_range_recoil = arg1;
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, item_get_category(arg0)), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a weapon that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_WeaponCopy(arg0, arg1)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        if (!variable_struct_exists(global.item_data, arg1))
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to copy an item that doesn't exists, \"" + arg1 + "\"");
        
        variable_struct_set(global.item_data, arg0, SnapDeepCopy(variable_struct_get(global.item_data, arg1)));
        array_push(global.item_data_array, arg0);
        variable_struct_get(global.item_data, arg0).basic.description = "There's no description";
        variable_struct_get(global.item_data, arg0).basic.name = "No Name";
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, item_get_category(arg0)), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a weapon that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_WeaponModCreate(arg0, arg1 = "grip", arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = false, arg8 = [], arg9 = [])
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_set(global.item_data, arg0, SnapDeepCopy(struct_get_from_hash(global.item_data, variable_get_hash("mod_ak74_grip_s_3"))));
        array_push(global.item_data_array, arg0);
        var _data = variable_struct_get(global.item_data, arg0).weapon_mod;
        _data.type = arg1;
        _data.acc = arg2;
        _data.damage = arg3;
        _data.ergo = arg4;
        _data.recoil = arg5;
        _data.reload_speed = arg6;
        _data.scope_optic = arg7;
        _data.position = [arg1];
        _data.handguard = {};
        _data.scope_extend_view = 1;
        _data.value = 5;
        _data.weapon_id = arg8;
        
        if (array_length(arg8) > 0)
            _data.weapon_all = false;
        else
            _data.weapon_all = true;
        
        if (arg1 == "scope")
        {
            _data.scope_image = "s_vuoto";
            _data.scope_glance_mouse_dis_mult = 1.15;
            _data.scope_extend_view = 1.25;
            _data.scope_mult_eff_range = 1.25;
        }
        
        if (arg1 == "laser")
        {
            _data.laser = {};
            _data.laser.color = 255;
            _data.position = ["att_1", "att_2", "att_3", "att_4"];
        }
        
        if (arg1 == "silencer")
        {
            _data.silencer_sound = "snd_sil_556x45_1";
            _data.position = ["brake"];
        }
        
        if (arg1 == "handguard")
        {
            _data = _data.handguard;
            
            for (var _i = 0; _i < array_length(arg9); _i++)
            {
                variable_struct_set(_data, array_get(array_get(arg9, _i), 0), 
                {
                    x: arg9[_i][1],
                    y: arg9[_i][2]
                });
            }
        }
        
        array_push(variable_struct_get(global.item_debug_spawner_data, struct_get_from_hash(variable_struct_get(global.category_data, item_get_category(arg0)), variable_get_hash("debug_spawner"))).raw_array, arg0);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a weapon mod that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_WeaponSetWeaponModData(arg0, arg1, arg2, arg3 = true, arg4 = 0, arg5 = 0, arg6 = [])
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon mod that doesn't exist, \"" + arg0 + "\"");
    }
    else
    {
        if (!variable_struct_exists(variable_struct_get(global.item_data, arg0).weapon.mods, arg1))
            variable_struct_set(variable_struct_get(global.item_data, arg0).weapon.mods, arg1, {});
        
        var _data = variable_struct_get(variable_struct_get(global.item_data, arg0).weapon.mods, arg1);
        _data.default_id = arg2;
        _data.needed = arg3;
        _data.x = arg4;
        _data.y = arg5;
        
        for (var _i = 0; _i < array_length(arg6); _i++)
        {
            variable_struct_set(_data, array_get(array_get(arg6, _i), 0), 
            {
                x: arg6[_i][1],
                y: arg6[_i][2]
            });
        }
    }
}

function __MODS_WeaponSetMagazineModCapacity(arg0, arg1 = 30)
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon magazine that doesn't exist, \"" + arg0 + "\"");
    }
    else
    {
        if (!variable_struct_exists(variable_struct_get(global.item_data, arg0), "weapon_mod"))
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon mod that is not a weapon mod, must use \"WeaponModCreate()\", \"" + arg0 + "\"");
        
        var _data = variable_struct_get(global.item_data, arg0).weapon_mod;
        _data.magazine_size = arg1;
    }
}

function __MODS_WeaponSetSounds(arg0, arg1 = "snd_ak_74", arg2 = "snd_ak_mag_in", arg3 = "snd_ak_mag_out", arg4 = "snd_cocking")
{
    if (!variable_struct_exists(global.item_data, arg0))
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
    }
    else
    {
        if (!variable_struct_exists(variable_struct_get(global.item_data, arg0), "weapon"))
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify an item that isn't a weapon, must use \"WeaponModCreate()\", \"" + arg0 + "\"");
        
        var _data = variable_struct_get(global.item_data, arg0).weapon;
        _data.sound = arg1;
        _data.sound_mag_in = arg2;
        _data.sound_mag_out = arg3;
        _data.sound_cocking = arg4;
    }
}

function __MODS_WeaponSetPrecision(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.precisione = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetReloadType(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.reload_type = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetReloadTime(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.reload_time = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetCaliber(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.caliber = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetAmmo(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.ammo = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetRecoil(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.recoil = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetRateOfFire(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.rate_of_fire = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetModdable(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.moddable = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetWeaponType(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        variable_struct_get(global.item_data, arg0).weapon.type = arg1;
        variable_struct_get(global.item_data, arg0).weapon.type_effective_range = arg1;
        variable_struct_get(global.item_data, arg0).weapon.type_effective_range_recoil = arg1;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_WeaponSetDamage(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.damage = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetErgonomics(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.ergo = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponSetFireMode(arg0, arg1)
{
    if (variable_struct_exists(global.item_data, arg0))
        variable_struct_get(global.item_data, arg0).weapon.fire_mode = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_WeaponModScopeConfigure(arg0, arg1 = false, arg2 = 1.15, arg3 = 1.25, arg4 = 1.25, arg5 = "s_vuoto")
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        var _data = variable_struct_get(global.item_data, arg0).weapon_mod;
        
        if (_data.type == "scope")
        {
            _data.scope_optic = arg1;
            _data.scope_glance_mouse_dis_mult = arg2;
            _data.scope_extend_view = arg3;
            _data.scope_mult_eff_range = arg4;
            
            if (arg1)
            {
                variable_struct_set(global.Mods_Sprite_Weapon_Scopes, arg5, __MODS_SpriteGet(arg5));
                _data.scope_image = __MODS_SpriteGet(arg5);
            }
        }
        else
        {
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to configure a weapon mod as a scope that is not a scope, \"" + arg0 + "\"");
        }
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon mod that doesn't exists, \"" + arg0 + "\"");
    }
}

function __MODS_WeaponModSilencerConfigure(arg0, arg1 = "snd_sil_556x45_1")
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        var _data = variable_struct_get(global.item_data, arg0).weapon_mod;
        
        if (_data.type == "silencer")
            _data.silencer_sound = arg1;
        else
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to configure a weapon mod as a silencer that is not a silencer, \"" + arg0 + "\"");
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon mod that doesn't exists, \"" + arg0 + "\"");
    }
}

function __MODS_WeaponModLaserConfigure(arg0, arg1 = [255, 255, 255])
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        var _data = variable_struct_get(global.item_data, arg0).weapon_mod;
        
        if (_data.type == "laser")
            _data.laser.color = make_color_rgb(arg1[0], arg1[1], arg1[2]);
        else
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to configure a weapon mod as a laser that is not a laser, \"" + arg0 + "\"");
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon mod that doesn't exists, \"" + arg0 + "\"");
    }
}

function __MODS_WeaponSetScript(arg0, arg1, arg2 = function()
{
})
{
    if (variable_struct_exists(global.item_data, arg0))
    {
        var _weapon_struct = variable_struct_get(global.item_data, arg0).weapon;
        
        if (!variable_struct_exists(_weapon_struct, "scripts"))
            _weapon_struct.scripts = {};
        
        switch (arg1)
        {
            case "bullet_spawn":
            case "weapon_fire":
            case "weapon_reload":
                variable_struct_set(struct_get_from_hash(_weapon_struct, variable_get_hash("scripts")), arg1, arg2);
                exit;
                break;
        }
        
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon script event that doesn't exist for the item, \"" + arg0 + "\", the invalid event provided was, \"" + arg1 + "\"");
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a weapon that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_SpriteLoad(arg0, arg1, arg2 = 1, arg3 = false, arg4 = 0, arg5 = 0)
{
    if (file_exists(global.__Mods_Path_Current + arg1))
    {
        variable_struct_set(global.__Mods_Context_Current.sprites, arg0, sprite_add(global.__Mods_Path_Current + arg1, arg2, arg3, false, arg4, arg5));
        array_push(struct_get_from_hash(global.Mods_Dynamic_Assets, variable_get_hash("sprites")), variable_struct_get(global.__Mods_Context_Current.sprites, arg0));
        return arg0;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" failed to load sprite: \"" + arg1 + "\"\n\nFile not found.");
    }
    
    return "";
}

function __MODS_SpriteGet(arg0)
{
    if (variable_struct_exists(global.__Mods_Context_Current.sprites, arg0))
    {
        return variable_struct_get(global.__Mods_Context_Current.sprites, arg0);
    }
    else
    {
        var _sprite = asset_get_index(arg0);
        
        if (_sprite != -1)
            return _sprite;
        else
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" and Zero Sievert both do not have a sprite named \"" + arg0 + "\"");
    }
    
    return false;
}

function __MODS_SpriteGetWidth(arg0)
{
    if (variable_struct_exists(global.__Mods_Context_Current.sprites, arg0))
        return sprite_get_width(variable_struct_get(global.__Mods_Context_Current.sprites, arg0));
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have a sprite named \"" + arg0 + "\"");
    
    return false;
}

function __MODS_SpriteGetHeight(arg0)
{
    if (variable_struct_exists(global.__Mods_Context_Current.sprites, arg0))
        return sprite_get_height(variable_struct_get(global.__Mods_Context_Current.sprites, arg0));
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have a sprite named \"" + arg0 + "\"");
    
    return false;
}

function __MODS_SpriteSetSpeed(arg0, arg1)
{
    if (variable_struct_exists(global.__Mods_Context_Current.sprites, arg0))
        sprite_set_speed(variable_struct_get(global.__Mods_Context_Current.sprites, arg0), arg1, 1);
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have a sprite named \"" + arg0 + "\"");
    
    return false;
}

function __MODS_SpriteSetOrigin(arg0, arg1, arg2)
{
    sprite_set_offset(__MODS_SpriteGet(arg0), arg1, arg2);
}

function __MODS_SpeakerCreate(arg0)
{
    variable_struct_set(global.speaker_data, arg0, {});
    variable_struct_get(global.speaker_data, arg0).index = array_length(variable_struct_get_names(global.speaker_data)) - 1;
    array_push(global.speaker_data_array, arg0);
    array_push(global.__Mods_Speaker_Array, arg0);
    __MODS_SpeakerSetMoves(arg0, false);
    return variable_struct_get(global.speaker_data, arg0);
}

function __MODS_SpeakerGetIndex(arg0)
{
    return speaker_get_index(arg0);
}

function __MODS_SpeakerAddDialogueChoice(arg0, arg1, arg2)
{
    var _index = arg0;
    
    if (is_string(arg0))
        _index = speaker_get_index(arg0);
    
    var _text_index = array_length_2d(global.__Mods_Dialogue_Text, _index);
    global.__Mods_Dialogue_Type[_index][_text_index] = arg1;
    global.__Mods_Dialogue_Text[_index][_text_index] = arg2;
}

function __MODS_SpeakerAddQuestion(arg0, arg1, arg2)
{
    var _index = arg0;
    
    if (is_string(arg0))
        _index = speaker_get_index(arg0);
    
    var _text_index = array_length_2d(global.__Mods_Question_Text, _index);
    global.__Mods_Question_Text[_index][_text_index] = arg1;
    global.__Mods_Answer_Text[_index][_text_index] = arg2;
}

function __MODS_SpeakerAddHello(arg0, arg1)
{
    var _index = arg0;
    
    if (is_string(arg0))
        _index = speaker_get_index(arg0);
    
    global.__Mods_Hello_Text[_index] = arg1;
}

function __MODS_SpeakerSetMoves(arg0, arg1)
{
    var _index = arg0;
    
    if (is_string(arg0))
        _index = speaker_get_index(arg0);
    
    global.__Mods_Speaker_Moves[_index] = arg1;
}

function __MODS_SpeakerAddQuest(arg0, arg1)
{
    var _index = speaker_get_index(arg0);
    var _quest_index = array_length_2d(global.__Mods_Quests, _index);
    global.__Mods_Quests[_index][_quest_index] = arg1;
    global.__Mods_SpeakerQuestMax[_index] = _quest_index + 1;
}

function __MODS_CraftingRecipeCreate(arg0, arg1, arg2, arg3, arg4)
{
    if (arg0 < 0 || arg0 > UnknownEnum.Value_9)
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a crafting recipe with an invalid crafting type.");
    
    if (arg1 < -1 || arg1 > UnknownEnum.Value_12 || arg1 == UnknownEnum.Value_0)
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a crafting recipe with an invalid module.");
    
    if (!is_array(arg3) || array_length(arg3) == 0 || !is_array(arg3[0]))
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a crafting recipe with an invalid required item array.");
    
    if (!is_array(arg4) || array_length(arg4) != 2)
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a crafting recipe with an invalid output item array.");
    
    array_push(global.__Mods_Crafting_Recipes, 
    {
        crafting_type: arg0,
        required_items: arg3,
        required_module: arg1,
        required_module_level: arg2,
        output_item: arg4
    });
}

function __MODS_ChestCreate(arg0)
{
    if (!variable_struct_exists(global.chest_data, arg0))
    {
        array_push(global.chest_data_array, arg0);
        variable_struct_set(global.chest_data, arg0, 
        {
            always_seen: true,
            chance_epic: 0,
            chance_legendary: 0,
            chance_rare: 0,
            chance_uncommon: 0,
            decay_items: false,
            destroy_when_empty: false,
            from_enemy: false,
            is_drop: false,
            item_max: false,
            item_min: false,
            items: [],
            max_durability: false,
            name: "chest_default",
            sound_type: "box",
            special_items: [],
            sprite: "s_chest_weapon_box_common"
        });
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" already has a chest with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_ChestSetName(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
        variable_struct_get(global.chest_data, arg0).name = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_ChestSetDestroyWhenEmpty(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
        variable_struct_get(global.chest_data, arg0).destroy_when_empty = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_ChestSetFromEnemy(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
        variable_struct_get(global.chest_data, arg0).from_enemy = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_ChestSetItemsDecay(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
        variable_struct_get(global.chest_data, arg0).decay_items = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_ChestSetIsDrop(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
        variable_struct_get(global.chest_data, arg0).is_drop = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_ChestSetItemCount(arg0, arg1, arg2)
{
    if (variable_struct_exists(global.chest_data, arg0))
    {
        variable_struct_get(global.chest_data, arg0).item_min = arg1;
        variable_struct_get(global.chest_data, arg0).item_max = arg2;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_ChestSetItemDropChance(arg0, arg1, arg2, arg3, arg4)
{
    if (variable_struct_exists(global.chest_data, arg0))
    {
        variable_struct_get(global.chest_data, arg0).chance_uncommon = arg1;
        variable_struct_get(global.chest_data, arg0).chance_rare = arg2;
        variable_struct_get(global.chest_data, arg0).chance_legendary = arg3;
        variable_struct_get(global.chest_data, arg0).chance_epic = arg4;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_ChestSetSoundType(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
        variable_struct_get(global.chest_data, arg0).sound_type = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_ChestSetSprite(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
    {
        if (is_string(arg1))
            variable_struct_get(global.chest_data, arg0).sprite = __MODS_SpriteGet(arg1);
        else
            variable_struct_get(global.chest_data, arg0).sprite = arg1;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_ChestSetItemsPreset(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
    {
        if (is_string(arg1))
            variable_struct_get(global.chest_data, arg0).items = arg1;
        else
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" is trying to add an item preset but it isn't a string, the chest ID is \"" + arg0 + "\"");
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_ChestAddItem(arg0, arg1, arg2 = "")
{
    if (variable_struct_exists(global.chest_data, arg0))
    {
        if (!is_array(variable_struct_get(global.chest_data, arg0).items))
            variable_struct_get(global.chest_data, arg0).items = [];
        
        var _struct = 
        {
            item: arg1
        };
        
        if (arg2 != "")
            _struct.rarity = arg2;
        
        array_push(variable_struct_get(global.chest_data, arg0).items, _struct);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_ChestAddSpecialItem(arg0, arg1, arg2 = undefined)
{
    if (variable_struct_exists(global.chest_data, arg0))
    {
        if (!is_array(variable_struct_get(global.chest_data, arg0).special_items))
            variable_struct_get(global.chest_data, arg0).special_items = [];
        
        var _struct = 
        {
            item: arg1
        };
        
        if (arg2 != undefined)
            _struct.chance = arg2;
        
        array_push(variable_struct_get(global.chest_data, arg0).special_items, _struct);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_ChestSetAlwaysSeen(arg0, arg1)
{
    if (variable_struct_exists(global.chest_data, arg0))
        variable_struct_get(global.chest_data, arg0).always_seen = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" doesn't have a chest with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_NpcCreate(arg0)
{
    if (!variable_struct_exists(global.npc_data, arg0))
    {
        variable_struct_set(global.npc_data, arg0, SnapDeepCopy(struct_get_from_hash(global.npc_data, variable_get_hash("loner_novice"))));
        variable_struct_get(global.npc_data, arg0).speaker_id = "no_speaker";
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" already has an NPC with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_NpcCopy(arg0, arg1)
{
    if (!variable_struct_exists(global.npc_data, arg0))
    {
        variable_struct_set(global.npc_data, arg0, SnapDeepCopy(variable_struct_get(global.npc_data, arg1)));
        variable_struct_get(global.npc_data, arg0).speaker_id = "no_speaker";
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" already has an NPC with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_NpcSetFaction(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
    {
        if (variable_struct_exists(global.struct_faction, arg1))
            variable_struct_get(global.npc_data, arg0).faction = arg1;
        else
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" is assigning the NPC, \"" + arg0 + "\" to a non-existent faction, \"" + arg1 + "\"");
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_NpcSetFootstep(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).footstep_type = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_NpcSetChestDropped(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).chest_dropped = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_NpcSetImageSpeed(arg0, arg1, arg2)
{
    if (variable_struct_exists(global.npc_data, arg0))
    {
        variable_struct_get(global.npc_data, arg0).ims_idle = arg1;
        variable_struct_get(global.npc_data, arg0).ims_moving = arg2;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    }
    
    exit;
}

function __MODS_NpcSetSpeaker(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).speaker_id = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_NpcSetWeapon(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).arma = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    
    exit;
}

function __MODS_NpcSetTraderId(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).trader_id = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSetName(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).name = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSetSpriteIdle(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
    {
        if (is_string(arg1))
            arg1 = __MODS_SpriteGet(arg1);
        
        variable_struct_get(global.npc_data, arg0).sprite_idle = arg1;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    }
}

function __MODS_NpcSetSpriteMoving(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
    {
        if (is_string(arg1))
            arg1 = __MODS_SpriteGet(arg1);
        
        variable_struct_get(global.npc_data, arg0).sprite_move = arg1;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    }
}

function __MODS_NpcSetSpriteDead(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
    {
        if (is_string(arg1))
            arg1 = __MODS_SpriteGet(arg1);
        
        variable_struct_get(global.npc_data, arg0).sprite_dead = arg1;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    }
}

function __MODS_NpcSetPreset(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).npc_preset = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSetArmor(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).armor = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSetHp(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).hp = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSetRecoilCrosshairDelay(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).recoil_crosshair_delay = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSetRecoilAimRadius(arg0, arg1, arg2)
{
    if (variable_struct_exists(global.npc_data, arg0))
    {
        variable_struct_get(global.npc_data, arg0).recoil_radius_min = arg1;
        variable_struct_get(global.npc_data, arg0).recoil_radius_max = arg2;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    }
}

function __MODS_NpcSetSweetAngleChance(arg0, arg1, arg2)
{
    if (variable_struct_exists(global.npc_data, arg0))
    {
        variable_struct_get(global.npc_data, arg0).sweet_angle_chance_min = arg1;
        variable_struct_get(global.npc_data, arg0).sweet_angle_chance_max = arg2;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
    }
}

function __MODS_NpcSetRotatingAngleRate(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).rotating_angle = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSetMeleeDamage(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).damage_melee = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSetExperience(arg0, arg1)
{
    if (variable_struct_exists(global.npc_data, arg0))
        variable_struct_get(global.npc_data, arg0).experience = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have an NPC with the ID \"" + arg0 + "\"");
}

function __MODS_NpcSpawn(arg0, arg1, arg2)
{
    if (variable_struct_exists(global.npc_data, arg0))
    {
        var _inst = instance_create_depth(arg1, arg2, 0, obj_mod_npc);
        
        with (_inst)
        {
            npc_setup(arg0);
            npc_setup_weapon();
        }
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to spawn an NPC that doesn't exist with ID \"" + arg0 + "\"");
    }
}

function __MODS_FactionCreate(arg0)
{
    if (!variable_struct_exists(global.struct_faction, arg0))
        faction_create(arg0);
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried creating a faction that already exists, \"" + arg0 + "\"");
}

function __MODS_FactionSetName(arg0, arg1)
{
    if (variable_struct_exists(global.struct_faction, arg0))
        variable_struct_get(global.struct_faction, arg0).name = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried setting the name for a faction that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_FactionSetRelationship(arg0, arg1, arg2)
{
    if (variable_struct_exists(global.struct_faction, arg0) && variable_struct_exists(global.struct_faction, arg1))
    {
        variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1, arg2);
        variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0, arg2);
    }
    else
    {
        if (!variable_struct_exists(global.struct_faction, arg0))
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried setting the relationship value for a faction that doesn't exist, \"" + arg0 + "\"");
        
        if (!variable_struct_exists(global.struct_faction, arg1))
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried setting the relationship value for a faction that doesn't exist, \"" + arg1 + "\"");
    }
}

function __MODS_FactionExists(arg0)
{
    return variable_struct_exists(global.struct_faction, arg0);
}

function __MODS_QuestCreate(arg0)
{
    if (!variable_struct_exists(global.quest_database, arg0))
    {
        variable_struct_set(global.quest_database, arg0, 
        {
            id: arg0,
            name: arg0,
            experience: 0,
            reputation: 0,
            money: 0,
            faction: "Player",
            daily: false,
            initial_item: [],
            rep_min: 0,
            quest_next: [],
            removable: false,
            text: "",
            objective: [],
            reward: []
        });
        array_push(global.__Mods_Cleanup_Quests_Array, arg0);
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried creating a quest with the id, \"" + arg0 + "\", a quest with that name already exists.");
}

function __MODS_QuestSetName(arg0, arg1)
{
    if (variable_struct_exists(global.quest_database, arg0))
    {
        variable_struct_get(global.quest_database, arg0).name = arg1;
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried setting the name for a quest that doesn't exists, \"" + arg0 + "\"");
}

function __MODS_QuestSetText(arg0, arg1)
{
    if (variable_struct_exists(global.quest_database, arg0))
    {
        variable_struct_get(global.quest_database, arg0).text = arg1;
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried setting the text for a quest that doesn't exists, \"" + arg0 + "\"");
}

function __MODS_QuestAddReward(arg0, arg1, arg2)
{
    if (variable_struct_exists(global.quest_database, arg0))
    {
        array_push(variable_struct_get(global.quest_database, arg0).reward, new class_quest_reward(arg1, arg2));
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried adding a reward to a quest that doesn't exists, \"" + arg0 + "\"");
}

function __MODS_QuestAddObjective(arg0, arg1)
{
    if (variable_struct_exists(global.quest_database, arg0))
    {
        array_push(variable_struct_get(global.quest_database, arg0).objective, arg1);
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried adding an objective to a quest that doesn't exists, \"" + arg0 + "\"");
}

function __MODS_QuestIsComplete(arg0)
{
    return quest_is_complete(arg0);
}

function __MODS_QuestObjectiveTypeKill(arg0, arg1 = "Player", arg2 = -1, arg3 = [], arg4 = 0, arg5 = "")
{
    return new quest_create_kill(arg0, arg1, arg2, arg3, arg4, arg5);
}

function __MODS_QuestObjectiveTypeCollect(arg0, arg1, arg2 = 0, arg3 = "")
{
    return new quest_create_collect(arg0, arg1, arg2, arg3);
}

function __MODS_QuestObjectiveTypeSurviveMap(arg0, arg1, arg2 = 0, arg3 = "")
{
    return new quest_create_survive_map(arg0, arg1, arg2, arg3);
}

function __MODS_QuestObjectiveTypeSurviveMinimumMoney(arg0, arg1, arg2, arg3 = 0, arg4 = "")
{
    return new quest_create_survive_min_money(arg0, arg1, arg2, arg3, arg4);
}

function __MODS_QuestObjectiveTypeSurviveMinimumExperience(arg0, arg1, arg2, arg3 = 0, arg4 = "")
{
    return new quest_create_survive_min_exp(arg0, arg1, arg2, arg3, arg4);
}

function __MODS_QuestObjectiveTypeApproach(arg0, arg1, arg2 = -1, arg3 = 0, arg4 = "")
{
    return new quest_create_approach(arg0, arg1, arg2, arg3, arg4);
}

function __MODS_QuestObjectiveTypeContract(arg0, arg1 = -1, arg2 = "", arg3 = 0, arg4 = "", arg5 = false)
{
    return new quest_create_contract(arg0, arg1, arg2, arg3, arg4, arg5);
}

function __MODS_QuestObjectiveTypeInteractObject(arg0, arg1 = -1, arg2, arg3 = "", arg4 = -1, arg5 = -1, arg6 = -1, arg7 = -4, arg8 = 0, arg9 = "")
{
    return new quest_create_interact_obj(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
}

function __MODS_QuestObjectiveTypeRetrieveAnalyzer(arg0, arg1 = -1, arg2, arg3, arg4 = 0, arg5 = "")
{
    return new quest_create_retrieve_analyzer(arg0, arg1, arg2, arg3, arg4, arg5);
}

function __MODS_QuestObjectiveTypeRetrieve(arg0, arg1 = -1, arg2, arg3 = 0, arg4 = "")
{
    return new quest_create_retrieve(arg0, arg1, arg2, arg3, arg4);
}

function __MODS_QuestObjectiveTypePlaceAnalyzer(arg0, arg1, arg2 = -1, arg3, arg4 = "", arg5 = -1, arg6 = -1, arg7 = -1, arg8 = -4, arg9 = 0, arg10 = "")
{
    return new quest_create_place_analyzer(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
}

function __MODS_QuestObjectiveTypeRetrieveEquipment(arg0, arg1, arg2 = -1, arg3 = -4, arg4 = 0, arg5 = "")
{
    return new quest_create_retrieve_equipment(arg0, arg1, arg2, arg3, arg4, arg5);
}

function ObjectData(arg0, arg1 = obj_mod_generic) constructor
{
    create_event = undefined;
    step_begin_event = undefined;
    step_normal_event = undefined;
    step_end_event = undefined;
    draw_normal_event = undefined;
    draw_end_event = undefined;
    destroy_event = undefined;
    cleanup_event = undefined;
    object_type = arg1;
    object_id = arg0;
}

function __MODS_ObjectCreate(arg0)
{
    if (!variable_struct_exists(global.Mods_Objects, arg0))
    {
        variable_struct_set(global.Mods_Objects, arg0, new ObjectData(arg0));
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried creating an object with the id, \"" + arg0 + "\", an object with that name already exists.", false);
}

function __MODS_ObjectSetScript(arg0, arg1 = "", arg2 = function()
{
})
{
    if (!variable_struct_exists(global.Mods_Objects, arg0))
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried modifying the events of an object with the id, \"" + arg0 + "\", that does not exist.");
    
    var _object = variable_struct_get(global.Mods_Objects, arg0);
    
    if (!variable_struct_exists(_object, arg1))
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried modifying the event, \"" + arg1 + "\", this event does not exist.");
    
    variable_struct_set(_object, arg1, 
    {
        func: arg2,
        context: global.__Mods_Context_Current
    });
}

function __MODS_ObjectSetType(arg0, arg1 = "")
{
    if (!variable_struct_exists(global.Mods_Objects, arg0))
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried modifying the object type of an object with the id, \"" + arg0 + "\", that does not exist.");
    
    var _object = variable_struct_get(global.Mods_Objects, arg0);
    
    switch (arg1)
    {
        case "obj_mod_generic":
            _object.object_type = obj_mod_generic;
            break;
        
        case "obj_mod_generic_solid":
            _object.object_type = obj_mod_generic_solid;
            break;
        
        default:
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to set the object type to a non-existing object type, \"" + arg1 + "\".");
            break;
    }
}

function __MODS_ObjectSpawn(arg0, arg1, arg2)
{
    if (variable_struct_exists(global.Mods_Objects, arg0))
    {
        var _object = variable_struct_get(global.Mods_Objects, arg0);
        return instance_create_depth(arg1, arg2, 0, struct_get_from_hash(_object, variable_get_hash("object_type")), 
        {
            object_id: arg0
        });
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried spawning an object with the id, \"" + arg0 + "\", that doesn't exist.");
}

function __MODS_ObjectExists(arg0)
{
    return variable_struct_exists(global.Mods_Objects, arg0);
}

function __MODS_ObjectGetAllInstances(arg0)
{
    var _instances = [];
    
    with (arg0)
        array_push(_instances, self);
    
    return _instances;
}

function __MODS_InstanceContext()
{
    return global.__Mods_Variable_Self;
}

function __MODS_InstanceCreate(arg0, arg1, arg2)
{
    return instance_create_depth(arg0, arg1, 0, arg2);
}

function __MODS_ScriptGet(arg0)
{
    if (variable_struct_exists(global.__Mods_Context_Current.scripts, arg0))
        return variable_struct_get(global.__Mods_Context_Current.scripts, arg0);
    else if (variable_struct_exists(global.Mods_Scripts, arg0))
        return variable_struct_get(global.Mods_Scripts, arg0);
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to get a script that does not exists, \"" + arg0 + "\"");
}

function __MODS_ScriptExecute(arg0)
{
    var _path_previous = global.__Mods_File_Current;
    global.__Mods_File_Current = arg0;
    __MODS_ScriptGet(arg0)();
    global.__Mods_File_Current = _path_previous;
}

function __MODS_ScriptExpose(arg0, arg1)
{
    if (is_callable(arg1) && !is_numeric(arg1))
        variable_struct_set(global.Mods_Scripts, arg0, arg1);
}

function __MODS_SoundLoad(arg0, arg1)
{
    if (file_exists(global.__Mods_Path_Current + arg1))
    {
        var _sound = audio_create_stream(global.__Mods_Path_Current + arg1);
        variable_struct_set(global.__Mods_Context_Current.sounds, arg0, _sound);
        variable_struct_set(global.Mods_Audio_Data, arg0, _sound);
        array_push(struct_get_from_hash(global.Mods_Dynamic_Assets, variable_get_hash("sounds")), variable_struct_get(global.Mods_Audio_Data, arg0));
        return arg0;
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" failed to load sound: \"" + arg1 + "\"\n\nFile not found.");
    }
    
    return "";
}

function __MODS_SoundGet(arg0, arg1)
{
    if (variable_struct_exists(global.__Mods_Context_Current.sounds, arg0))
        return variable_struct_get(global.__Mods_Context_Current.sounds, arg0);
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have a sound named \"" + arg0 + "\"");
    
    return false;
}

function __MODS_SoundPlay(arg0, arg1 = false, arg2 = 1, arg3 = 1)
{
    if (variable_struct_exists(global.__Mods_Context_Current.sounds, arg0))
        return audio_play_sound(variable_struct_get(global.__Mods_Context_Current.sounds, arg0), 0, false, arg2, 0, arg3);
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have a sound named \"" + arg0 + "\"");
    
    return false;
}

function __MODS_SoundPlayAt(arg0, arg1, arg2, arg3, arg4 = false, arg5 = 1, arg6 = 1)
{
    if (variable_struct_exists(global.__Mods_Context_Current.sounds, arg0))
        return audio_play_sound_at(variable_struct_get(global.__Mods_Context_Current.sounds, arg0), arg1, arg2, 0, arg3 * 0.5, arg3, 1, 0, false, arg5, 0, arg6);
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" does not have a sound named \"" + arg0 + "\"");
    
    return false;
}

function __MODS_RoomGetCurrent()
{
    return room_get_name(room);
}

function __MODS_RoomCreate(arg0, arg1 = function()
{
})
{
    if (variable_struct_exists(global.Mods_Rooms, arg0))
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a room that already exists, \"" + arg0 + "\"");
    else
        variable_struct_set(global.Mods_Rooms, arg0, arg1);
}

function __MODS_RoomGoto(arg0)
{
    if (!variable_struct_exists(global.Mods_Rooms, arg0))
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to get a room that does not exists, \"" + arg0 + "\"");
    }
    else
    {
        trace("Going to mod room, \"" + arg0);
        global.__Mods_Room_To_Load = arg0;
        room_goto(r_mod_empty);
    }
}

function loadout_get_name_from_number(arg0 = 0)
{
    switch (arg0)
    {
        case 0:
            return "equipment_1";
        
        case 2:
            return "equipment_2";
        
        case 3:
            return "equipment_3";
        
        case 4:
            return "equipment_4";
        
        case 5:
            return "equipment_5";
        
        case 6:
            return "equipment_6";
    }
}

function __MODS_LoadoutClear(arg0 = 0)
{
    if (arg0 < 0 || arg0 > 5)
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to clear a loadout that doesn't exist.");
        exit;
    }
    
    variable_struct_get(global.loadout_data, loadout_get_name_from_number(arg0)).items = [];
}

function __MODS_LoadoutAddItem(arg0 = 0, arg1 = undefined, arg2 = 1)
{
    if (arg0 < 0 || arg0 > 5)
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to clear a loadout that doesn't exist.");
        exit;
    }
    
    var _array = struct_get_from_hash(variable_struct_get(global.loadout_data, loadout_get_name_from_number(arg0)), variable_get_hash("items"));
    var _struct = 
    {
        id: arg1
    };
    
    if (arg2 > 1)
        _struct.stack = arg2;
    
    array_push(_array, _struct);
}

function __MODS_LanguageCreate(arg0, arg1, arg2, arg3)
{
    if (!variable_struct_exists(global.Mods_Languages, arg0))
    {
        if (!file_exists(global.__Mods_Path_Current + arg2))
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a language with a CSV file that does not exist, \"" + _language_name + "\", missing CSV, " + arg2);
        
        if (!file_exists(global.__Mods_Path_Current + arg3))
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a language with a font file that does not exist, \"" + _language_name + "\", missing font, " + arg3);
        
        variable_struct_set(global.Mods_Languages, arg0, 
        {
            display_name: arg1,
            csv: global.__Mods_Path_Current + arg2,
            font: global.__Mods_Path_Current + arg3,
            font_sizes: [13, 15, 18, 27, 36, 68],
            font_offset: [
            {
                x: 0,
                y: 2,
                linebreak_height: 18
            }, 
            {
                x: 0,
                y: 2,
                linebreak_height: 20
            }, 
            {
                x: 0,
                y: 3,
                linebreak_height: 23
            }, 
            {
                x: 0,
                y: 5,
                linebreak_height: 32
            }, 
            {
                x: 0,
                y: 6,
                linebreak_height: 41
            }, 
            {
                x: 0,
                y: 10,
                linebreak_height: 73
            }]
        });
        variable_struct_set(struct_get_from_hash(global.language_data, variable_get_hash("languages")), arg0, variable_struct_get(global.Mods_Languages, arg0));
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a language that already exists, \"" + _language_name + "\"");
}

function __MODS_LanguageSetFontSizes(arg0, arg1 = [13, 15, 18, 27, 36, 68])
{
    if (variable_struct_exists(global.Mods_Languages, arg0))
    {
        variable_struct_get(global.Mods_Languages, arg0).font_sizes = arg1;
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a language that doesn't exists, \"" + _language_name + "\"");
}

function __MODS_LanguageSetFontOffsets(arg0, arg1)
{
    if (variable_struct_exists(global.Mods_Languages, arg0))
    {
        variable_struct_get(global.Mods_Languages, arg0).font_offset = arg1;
        exit;
    }
    
    mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a language that doesn't exists, \"" + _language_name + "\"");
}

function __MODS_TraderCreate(arg0 = "Default", arg1 = "All Friend", arg2 = false, arg3 = 100000)
{
    if (!variable_struct_exists(global.trader_data, arg0))
    {
        variable_struct_set(global.trader_data, arg0, 
        {
            faction: arg1,
            format_pages: arg2,
            money: arg3,
            name: "Unused Value",
            items: []
        });
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to create a trader with a trader id that already exists, \"" + arg0 + "\"");
    }
}

function __MODS_TraderSetFaction(arg0 = "Default", arg1)
{
    if (variable_struct_exists(global.trader_data, arg0))
    {
        if (variable_struct_exists(global.struct_faction, arg1))
            variable_struct_get(global.trader_data, arg0).faction = arg1;
        else
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" is assigning the trader, \"" + arg0 + "\" to a non-existent faction, \"" + arg1 + "\"");
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a trader that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_TraderSetFormatPages(arg0 = "Default", arg1)
{
    if (variable_struct_exists(global.trader_data, arg0))
        variable_struct_get(global.trader_data, arg0).format_pages = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a trader that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_TraderSetMoney(arg0 = "Default", arg1)
{
    if (variable_struct_exists(global.trader_data, arg0))
        variable_struct_get(global.trader_data, arg0).money = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a trader that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_TraderSetName(arg0 = "Default", arg1)
{
    if (variable_struct_exists(global.trader_data, arg0))
        variable_struct_get(global.trader_data, arg0).name = arg1;
    else
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a trader that doesn't exist, \"" + arg0 + "\"");
}

function __MODS_TraderAddItem(arg0 = "Default", arg1, arg2 = 1, arg3 = undefined, arg4 = undefined)
{
    if (variable_struct_exists(global.trader_data, arg0))
    {
        var _items = struct_get_from_hash(variable_struct_get(global.trader_data, arg0), variable_get_hash("items"));
        var _struct = 
        {
            item: arg1
        };
        
        if (!is_undefined(arg2))
            _struct.quantity = arg2;
        
        if (!is_undefined(arg3))
            _struct.level = arg3;
        
        if (!is_undefined(arg4))
            _struct.quest_complete = arg4;
        
        array_push(_items, _struct);
    }
    else
    {
        mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to modify a trader that doesn't exist, \"" + arg0 + "\"");
    }
}

function __MODS_FileDataWrite(arg0, arg1)
{
    db_open("general");
    var _data = db_read("mods", global.__Mods_Context_Current.mod_name, {});
    variable_struct_set(_data, arg0, arg1);
    db_write("mods", global.__Mods_Context_Current.mod_name, _data, false);
    db_close();
}

function __MODS_FileDataRead(arg0)
{
    db_open("general");
    var _data = db_read("mods", global.__Mods_Context_Current.mod_name, undefined);
    var _value;
    
    if (_data != undefined)
        _value = variable_struct_get(_data, arg0);
    else
        _value = undefined;
    
    db_close();
    return _value;
}

function __MODS_EventAssignFunction(arg0, arg1)
{
    if (!is_numeric(arg1))
    {
        if (arg0 != "init" && variable_struct_exists(global.__Mods_Context_Current.event_functions, arg0))
            variable_struct_set(global.__Mods_Context_Current.event_functions, arg0, arg1);
        else
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" tried to assign a function to an event hook id that doesn't exist, \"" + arg0 + "\"");
    }
}

enum UnknownEnum
{
    Value_0,
    Value_9 = 9,
    Value_12 = 12
}
