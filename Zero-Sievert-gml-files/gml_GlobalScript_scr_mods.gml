global.Mods_Failed_To_Compile = false;
global.Mods_Trace_Error = "";
global.Mods_Is_Dirty = true;
global.Mods_Dynamic_Assets = 
{
    sounds: [],
    sprites: []
};
global.Mods_Sprite_Ingame_Data = {};
global.Mods_Sprite_Inventory_Data = {};
global.Mods_Sprite_Armor_Data = {};
global.Mods_Sprite_Backpack_Data = {};
global.Mods_Sprite_Consumable_Animation_Data = {};
global.Mods_Sprite_Weapon_Scopes = {};
global.Mods_Audio_Data = {};
global.Mods_Data = {};
global.Mods_Scripts = {};
global.Mods_Objects = {};
global.Mods_Rooms = {};
global.Mods_Languages = {};
global.Mods_Data_Array = [];
global.Mods_Meta = {};
global.Mods_Order = [];
global.Mods_Off = [];
global.__Mods_Path_Current = "";
global.__Mods_File_Current = "";
global.__Mods_Context_Current = undefined;
global.__Mods_Dialogue_Text[1000][0] = "";
global.__Mods_Dialogue_Type[1000][0] = "";
global.__Mods_Question_Text[1000][0] = "";
global.__Mods_Answer_Text[1000][0] = "";
global.__Mods_Quests[1000][0] = "";
global.__Mods_SpeakerQuestMax = array_create(1000, 0);
global.__Mods_Sprite_Idle = array_create(1000, undefined);
global.__Mods_Sprite_Move = array_create(1000, undefined);
global.__Mods_Hello_Text = array_create(1000, "");
global.__Mods_Speaker_Name = array_create(1000, "");
global.__Mods_Speaker_Move = array_create(1000, false);
global.__Mods_Speaker_Array = [];
global.__Mods_Variable_Self = undefined;
global.__Mods_Room_To_Load = "";
global.__Mods_Crafting_Recipes = [];
global.__Mods_Cleanup_Quests_Array = [];

function ModData(arg0, arg1) constructor
{
    static scripts_build = function()
    {
        for (var _i = 0; _i < array_length(scripts_to_compile); _i++)
        {
            if (string_pos(file_path, scripts_to_compile[_i]) != 0 && string_pos(".script", scripts_to_compile[_i]) != 0)
            {
                array_push(files, scripts_to_compile[_i]);
                scripts_assign_events(scripts_to_compile[_i]);
                script_add_to_database(scripts_to_compile[_i]);
            }
        }
    };
    
    static script_add_to_database = function(arg0)
    {
        var _str = string_delete(string_replace_all(arg0, file_path, ""), 1, 1);
        variable_struct_set(scripts, _str, global.__katspeak__.compile(global.__katspeak__.parseString(file_get_text(arg0))));
    };
    
    static scripts_assign_events = function(arg0)
    {
        var _str = string_replace_all(string_replace_all(string_replace_all(arg0, file_path, ""), "/", ""), "\\", "");
        
        switch (_str)
        {
            case "init.script":
                event_functions.init = global.__katspeak__.compile(global.__katspeak__.parseString(file_get_text(arg0)));
                break;
        }
    };
    
    mod_name = arg0;
    file_path = arg1;
    files = [];
    scripts = {};
    sprites = {};
    sounds = {};
    scripts_to_compile = [];
    compiled = false;
    failed_to_compile = false;
    enabled = true;
    event_functions = 
    {
        init: undefined,
        enter_hub: undefined,
        enter_raid: undefined,
        exit_train: undefined,
        player_spawn: undefined,
        player_death: undefined,
        trade_completed: undefined
    };
}

function mods_perform_event_file(arg0 = "")
{
    for (var _i = 0; _i < array_length(global.Mods_Data_Array); _i++)
    {
        global.__Mods_Context_Current = variable_struct_get(global.Mods_Data, global.Mods_Data_Array[_i]);
        var _event_func = variable_struct_get(variable_struct_get(global.Mods_Data, global.Mods_Data_Array[_i]).event_functions, arg0);
        
        if (!is_undefined(_event_func))
        {
            global.__Mods_Path_Current = variable_struct_get(global.Mods_Data, global.Mods_Data_Array[_i]).file_path + obj_mods.file_slash_format;
            global.__Mods_File_Current = arg0 + ".script";
            _event_func();
        }
    }
}

function mods_perform_event(arg0 = "")
{
    for (var _i = 0; _i < array_length(global.Mods_Data_Array); _i++)
    {
        global.__Mods_Context_Current = variable_struct_get(global.Mods_Data, global.Mods_Data_Array[_i]);
        var _event_func = variable_struct_get(variable_struct_get(global.Mods_Data, global.Mods_Data_Array[_i]).event_functions, arg0);
        
        if (!is_undefined(_event_func))
        {
            try
            {
                _event_func();
            }
            catch (_error)
            {
                mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" failed to run the event, \"" + arg0 + "\".\n" + _error.longMessage);
            }
        }
    }
}

function mods_object_perform_event(arg0 = "")
{
    var _struct = variable_struct_get(global.Mods_Objects, object_id);
    
    if (!is_undefined(_struct) && !is_undefined(variable_struct_get(variable_struct_get(global.Mods_Objects, object_id), arg0)) && instance_exists(id))
    {
        var _object_events = variable_struct_get(global.Mods_Objects, object_id);
        global.__Mods_Context_Current = variable_struct_get(_object_events, arg0).context;
        
        try
        {
            variable_struct_get(_object_events, arg0).func(id);
        }
        catch (_error)
        {
            mods_trace_error("Mod \"" + global.__Mods_Context_Current.mod_name + "\" failed to run the object event, \"" + arg0 + "\".\n" + _error.longMessage);
        }
        
        return true;
    }
    else
    {
        return false;
    }
}

function mods_object_has_events()
{
    return variable_struct_exists(global.Mods_Objects, object_get_name(object_index));
}

function mods_create_empty_events()
{
    object_events = 
    {
        create_event: undefined,
        step_begin_event: undefined,
        step_normal_event: undefined,
        step_end_event: undefined,
        draw_normal_event: undefined,
        draw_end_event: undefined,
        destroy_event: undefined,
        cleanup_event: undefined,
        object_type: object_index,
        object_id: object_get_name(object_index)
    };
}

function mods_kill_dangerous_functions()
{
    global.__katspeak__.interface.exposeFunction = undefined;
    global.__katspeak__.interface.exposeConstant = undefined;
    global.__katspeak__.interface.exposeAsset = undefined;
    global.__katspeak__.interface.exposeDynamicConstant = undefined;
    global.__katspeak__.interface.exposeFunctionByPrefix = undefined;
    global.__katspeak__.interface.exposeMethod = undefined;
    global.__katspeak__.interface.exposeAsset = undefined;
}

function mods_expose_functions()
{
    global.__katspeak__.interface.exposeFunction("SoundLoad", __MODS_SoundLoad);
    global.__katspeak__.interface.exposeFunction("SoundGet", __MODS_SoundGet);
    global.__katspeak__.interface.exposeFunction("SoundPlay", __MODS_SoundPlay);
    global.__katspeak__.interface.exposeFunction("SoundPlayAt", __MODS_SoundPlayAt);
    global.__katspeak__.interface.exposeFunction("SpriteLoad", __MODS_SpriteLoad);
    global.__katspeak__.interface.exposeFunction("SpriteGet", __MODS_SpriteGet);
    global.__katspeak__.interface.exposeFunction("SpriteSetSpeed", __MODS_SpriteSetSpeed);
    global.__katspeak__.interface.exposeFunction("SpriteSetOrigin", __MODS_SpriteSetOrigin);
    global.__katspeak__.interface.exposeFunction("SpriteGetWidth", __MODS_SpriteGetWidth);
    global.__katspeak__.interface.exposeFunction("SpriteGetHeight", __MODS_SpriteGetHeight);
    global.__katspeak__.interface.exposeFunction("SpeakerCreate", __MODS_SpeakerCreate);
    global.__katspeak__.interface.exposeFunction("SpeakerGetIndex", __MODS_SpeakerGetIndex);
    global.__katspeak__.interface.exposeFunction("SpeakerAddDialogueChoice", __MODS_SpeakerAddDialogueChoice);
    global.__katspeak__.interface.exposeFunction("SpeakerAddQuestion", __MODS_SpeakerAddQuestion);
    global.__katspeak__.interface.exposeFunction("SpeakerAddHello", __MODS_SpeakerAddHello);
    global.__katspeak__.interface.exposeFunction("SpeakerSetMoves", __MODS_SpeakerSetMoves);
    global.__katspeak__.interface.exposeFunction("SpeakerAddQuest", __MODS_SpeakerAddQuest);
    global.__katspeak__.interface.exposeFunction("CraftingRecipeCreate", __MODS_CraftingRecipeCreate);
    global.__katspeak__.interface.exposeConstant("Base_Module_None", -1);
    global.__katspeak__.interface.exposeConstant("Base_Module_Medical", UnknownEnum.Value_1);
    global.__katspeak__.interface.exposeConstant("Base_Module_Storage", UnknownEnum.Value_2);
    global.__katspeak__.interface.exposeConstant("Base_Module_Bed", UnknownEnum.Value_3);
    global.__katspeak__.interface.exposeConstant("Base_Module_Kitchen", UnknownEnum.Value_4);
    global.__katspeak__.interface.exposeConstant("Base_Module_Recyling", UnknownEnum.Value_5);
    global.__katspeak__.interface.exposeConstant("Base_Module_Gym", UnknownEnum.Value_6);
    global.__katspeak__.interface.exposeConstant("Base_Module_ShootingRange", UnknownEnum.Value_7);
    global.__katspeak__.interface.exposeConstant("Base_Module_Forge", UnknownEnum.Value_8);
    global.__katspeak__.interface.exposeConstant("Base_Module_Scavenger", UnknownEnum.Value_9);
    global.__katspeak__.interface.exposeConstant("Base_Module_Garden", UnknownEnum.Value_10);
    global.__katspeak__.interface.exposeConstant("Base_Module_Ammo", UnknownEnum.Value_11);
    global.__katspeak__.interface.exposeConstant("Base_Module_Workshop", UnknownEnum.Value_12);
    global.__katspeak__.interface.exposeConstant("CraftingType_Medication", UnknownEnum.Value_0);
    global.__katspeak__.interface.exposeConstant("CraftingType_Ammo", UnknownEnum.Value_1);
    global.__katspeak__.interface.exposeConstant("CraftingType_Food", UnknownEnum.Value_2);
    global.__katspeak__.interface.exposeConstant("CraftingType_ModWeapon", UnknownEnum.Value_5);
    global.__katspeak__.interface.exposeConstant("CraftingType_BaseUpgrade1", UnknownEnum.Value_6);
    global.__katspeak__.interface.exposeConstant("CraftingType_BaseUpgrade2", UnknownEnum.Value_7);
    global.__katspeak__.interface.exposeConstant("CraftingType_BaseUpgrade3", UnknownEnum.Value_8);
    global.__katspeak__.interface.exposeConstant("CraftingType_Extras", UnknownEnum.Value_9);
    global.__katspeak__.interface.exposeFunction("ItemCreate", __MODS_ItemCreate);
    global.__katspeak__.interface.exposeFunction("ItemSetSpriteInventory", __MODS_ItemSetSpriteInventory);
    global.__katspeak__.interface.exposeFunction("ItemSetSpriteIngame", __MODS_ItemSetSpriteIngame);
    global.__katspeak__.interface.exposeFunction("ItemSetName", __MODS_ItemSetName);
    global.__katspeak__.interface.exposeFunction("ItemSetDescription", __MODS_ItemSetDescription);
    global.__katspeak__.interface.exposeFunction("ItemSetWeight", __MODS_ItemSetWeight);
    global.__katspeak__.interface.exposeFunction("ItemSetPriceValue", __MODS_ItemSetPriceValue);
    global.__katspeak__.interface.exposeFunction("ItemSetStackLimit", __MODS_ItemSetStackLimit);
    global.__katspeak__.interface.exposeFunction("ItemSetConsumableSound", __MODS_ItemSetConsumableSound);
    global.__katspeak__.interface.exposeFunction("InventoryItemExists", __MODS_InventoryItemExists);
    global.__katspeak__.interface.exposeFunction("InventoryItemCount", __MODS_InventoryItemCount);
    global.__katspeak__.interface.exposeFunction("ItemMedicalCreate", __MODS_ItemMedicalCreate);
    global.__katspeak__.interface.exposeFunction("ItemMedicalSetAnimation", __MODS_ItemMedicalSetAnimation);
    global.__katspeak__.interface.exposeFunction("ItemMedicalSetWound", __MODS_ItemMedicalSetWound);
    global.__katspeak__.interface.exposeFunction("ItemMedicalSetRadiation", __MODS_ItemMedicalSetRadiation);
    global.__katspeak__.interface.exposeFunction("ItemMedicalSetMoveSpeedMultiplier", __MODS_ItemMedicalSetMoveSpeedMultiplier);
    global.__katspeak__.interface.exposeFunction("ItemMedicalSetDuration", __MODS_ItemMedicalSetDuration);
    global.__katspeak__.interface.exposeFunction("ItemMedicalSetCanMove", __MODS_ItemMedicalSetCanMove);
    global.__katspeak__.interface.exposeFunction("ItemMedicalSetBleed", __MODS_ItemMedicalSetBleed);
    global.__katspeak__.interface.exposeFunction("ItemInjectorCreate", __MODS_ItemInjectorCreate);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetBleedImmune", __MODS_ItemInjectorSetBleedImmune);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetBleedRec", __MODS_ItemInjectorSetBleedRec);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetDuration", __MODS_ItemInjectorSetDuration);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetHpRegen", __MODS_ItemInjectorSetHpRegen);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetHunger", __MODS_ItemInjectorSetHunger);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetHungerRegen", __MODS_ItemInjectorSetHungerRegen);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetMaxHp", __MODS_ItemInjectorSetMaxHp);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetMaxWeight", __MODS_ItemInjectorSetMaxWeight);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetRadDef", __MODS_ItemInjectorSetRadDef);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetRadRegen", __MODS_ItemInjectorSetRadRegen);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetStaminaMax", __MODS_ItemInjectorSetStaminaMax);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetStaminaRegen", __MODS_ItemInjectorSetStaminaRegen);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetThirst", __MODS_ItemInjectorSetThirst);
    global.__katspeak__.interface.exposeFunction("ItemInjectorSetThirstRegen", __MODS_ItemInjectorSetThirstRegen);
    global.__katspeak__.interface.exposeFunction("ItemBackpackCreate", __MODS_ItemBackpackCreate);
    global.__katspeak__.interface.exposeFunction("ItemBackpackSetErgonomic", __MODS_ItemBackpackSetErgonomic);
    global.__katspeak__.interface.exposeFunction("ItemBackpackSetMovementSpeed", __MODS_ItemBackpackSetMovementSpeed);
    global.__katspeak__.interface.exposeFunction("ItemBackpackSetSpriteGame", __MODS_ItemBackpackSetSpriteGame);
    global.__katspeak__.interface.exposeFunction("ItemBackpackSetWeight", __MODS_ItemBackpackSetWeight);
    global.__katspeak__.interface.exposeFunction("ItemArmorCreate", __MODS_ItemArmorCreate);
    global.__katspeak__.interface.exposeFunction("ItemArmorSetAnomaly", __MODS_ItemArmorSetAnomaly);
    global.__katspeak__.interface.exposeFunction("ItemArmorSetClass", __MODS_ItemArmorSetClass);
    global.__katspeak__.interface.exposeFunction("ItemArmorSetFragility", __MODS_ItemArmorSetFragility);
    global.__katspeak__.interface.exposeFunction("ItemArmorSetPierce", __MODS_ItemArmorSetPierce);
    global.__katspeak__.interface.exposeFunction("ItemArmorSetRadiation", __MODS_ItemArmorSetRadiation);
    global.__katspeak__.interface.exposeFunction("ItemArmorSetSpriteDead", __MODS_ItemArmorSetSpriteDead);
    global.__katspeak__.interface.exposeFunction("ItemArmorSetSpriteIdle", __MODS_ItemArmorSetSpriteIdle);
    global.__katspeak__.interface.exposeFunction("ItemArmorSetSpriteRun", __MODS_ItemArmorSetSpriteRun);
    global.__katspeak__.interface.exposeFunction("ItemBarterCreate", __MODS_ItemBarterCreate);
    global.__katspeak__.interface.exposeFunction("ItemConsumableCreate", __MODS_ItemConsumableCreate);
    global.__katspeak__.interface.exposeFunction("ItemConsumableSetAnimation", __MODS_ItemConsumableSetAnimation);
    global.__katspeak__.interface.exposeFunction("ItemConsumableSetEnergy", __MODS_ItemConsumableSetEnergy);
    global.__katspeak__.interface.exposeFunction("ItemConsumableSetFatigue", __MODS_ItemConsumableSetFatigue);
    global.__katspeak__.interface.exposeFunction("ItemConsumableSetRadiation", __MODS_ItemConsumableSetRadiation);
    global.__katspeak__.interface.exposeFunction("ItemConsumableSetSound", __MODS_ItemConsumableSetSound);
    global.__katspeak__.interface.exposeFunction("ItemConsumableSetThirst", __MODS_ItemConsumableSetThirst);
    global.__katspeak__.interface.exposeFunction("ItemConsumableSetEvent", __MODS_ItemConsumableSetEvent);
    global.__katspeak__.interface.exposeFunction("ItemHeadsetCreate", __MODS_ItemHeadsetCreate);
    global.__katspeak__.interface.exposeFunction("ItemHeadsetSetLightID", __MODS_ItemHeadsetSetLightID);
    global.__katspeak__.interface.exposeFunction("ItemHeadsetSetType", __MODS_ItemHeadsetSetType);
    global.__katspeak__.interface.exposeFunction("ItemHeadsetSetVisionValues", __MODS_ItemHeadsetSetVisionValues);
    global.__katspeak__.interface.exposeFunction("ItemArmourRepairCreate", __MODS_ItemArmourRepairCreate);
    global.__katspeak__.interface.exposeFunction("ItemArmorRepairCreate", __MODS_ItemArmourRepairCreate);
    global.__katspeak__.interface.exposeFunction("ItemWeaponRepairCreate", __MODS_ItemWeaponRepairCreate);
    global.__katspeak__.interface.exposeFunction("ItemKeyCreate", __MODS_ItemKeyCreate);
    global.__katspeak__.interface.exposeFunction("ItemDocumentCreate", __MODS_ItemDocumentCreate);
    global.__katspeak__.interface.exposeFunction("ItemCreateAmmo", __MODS_ItemCreateAmmo);
    global.__katspeak__.interface.exposeFunction("WeaponCreate", __MODS_WeaponCreate);
    global.__katspeak__.interface.exposeFunction("WeaponCopy", __MODS_WeaponCopy);
    global.__katspeak__.interface.exposeFunction("WeaponModCreate", __MODS_WeaponModCreate);
    global.__katspeak__.interface.exposeFunction("WeaponSetWeaponModData", __MODS_WeaponSetWeaponModData);
    global.__katspeak__.interface.exposeFunction("WeaponSetMagazineModCapacity", __MODS_WeaponSetMagazineModCapacity);
    global.__katspeak__.interface.exposeFunction("WeaponSetSounds", __MODS_WeaponSetSounds);
    global.__katspeak__.interface.exposeFunction("WeaponSetDamage", __MODS_WeaponSetDamage);
    global.__katspeak__.interface.exposeFunction("WeaponSetReloadTime", __MODS_WeaponSetReloadTime);
    global.__katspeak__.interface.exposeFunction("WeaponSetCaliber", __MODS_WeaponSetCaliber);
    global.__katspeak__.interface.exposeFunction("WeaponSetRateOfFire", __MODS_WeaponSetRateOfFire);
    global.__katspeak__.interface.exposeFunction("WeaponSetAmmo", __MODS_WeaponSetAmmo);
    global.__katspeak__.interface.exposeFunction("WeaponSetFireMode", __MODS_WeaponSetFireMode);
    global.__katspeak__.interface.exposeFunction("WeaponSetPrecision", __MODS_WeaponSetPrecision);
    global.__katspeak__.interface.exposeFunction("WeaponSetReloadType", __MODS_WeaponSetReloadType);
    global.__katspeak__.interface.exposeFunction("WeaponSetErgonomics", __MODS_WeaponSetErgonomics);
    global.__katspeak__.interface.exposeFunction("WeaponSetRecoil", __MODS_WeaponSetRecoil);
    global.__katspeak__.interface.exposeFunction("WeaponSetModdable", __MODS_WeaponSetModdable);
    global.__katspeak__.interface.exposeFunction("WeaponSetWeaponType", __MODS_WeaponSetWeaponType);
    global.__katspeak__.interface.exposeFunction("WeaponModScopeConfigure", __MODS_WeaponModScopeConfigure);
    global.__katspeak__.interface.exposeFunction("WeaponModLaserConfigure", __MODS_WeaponModLaserConfigure);
    global.__katspeak__.interface.exposeFunction("WeaponModSilencerConfigure", __MODS_WeaponModSilencerConfigure);
    global.__katspeak__.interface.exposeFunction("WeaponSetScript", __MODS_WeaponSetScript);
    global.__katspeak__.interface.exposeFunction("NpcCreate", __MODS_NpcCreate);
    global.__katspeak__.interface.exposeFunction("NpcCopy", __MODS_NpcCopy);
    global.__katspeak__.interface.exposeFunction("NpcSetSpeaker", __MODS_NpcSetSpeaker);
    global.__katspeak__.interface.exposeFunction("NpcSetFootstep", __MODS_NpcSetFootstep);
    global.__katspeak__.interface.exposeFunction("NpcSetFaction", __MODS_NpcSetFaction);
    global.__katspeak__.interface.exposeFunction("NpcSetChestDropped", __MODS_NpcSetChestDropped);
    global.__katspeak__.interface.exposeFunction("NpcSetImageSpeed", __MODS_NpcSetImageSpeed);
    global.__katspeak__.interface.exposeFunction("NpcSetWeapon", __MODS_NpcSetWeapon);
    global.__katspeak__.interface.exposeFunction("NpcSetTraderId", __MODS_NpcSetTraderId);
    global.__katspeak__.interface.exposeFunction("NpcSetName", __MODS_NpcSetName);
    global.__katspeak__.interface.exposeFunction("NpcSetSpriteIdle", __MODS_NpcSetSpriteIdle);
    global.__katspeak__.interface.exposeFunction("NpcSetSpriteMoving", __MODS_NpcSetSpriteMoving);
    global.__katspeak__.interface.exposeFunction("NpcSetSpriteDead", __MODS_NpcSetSpriteDead);
    global.__katspeak__.interface.exposeFunction("NpcSetArmor", __MODS_NpcSetArmor);
    global.__katspeak__.interface.exposeFunction("NpcSetHp", __MODS_NpcSetHp);
    global.__katspeak__.interface.exposeFunction("NpcSetPreset", __MODS_NpcSetPreset);
    global.__katspeak__.interface.exposeFunction("NpcSetRecoilCrosshairDelay", __MODS_NpcSetRecoilCrosshairDelay);
    global.__katspeak__.interface.exposeFunction("NpcSetRecoilAimRadius", __MODS_NpcSetRecoilAimRadius);
    global.__katspeak__.interface.exposeFunction("NpcSetSweetAngleChance", __MODS_NpcSetSweetAngleChance);
    global.__katspeak__.interface.exposeFunction("NpcSetRotatingAngleRate", __MODS_NpcSetRotatingAngleRate);
    global.__katspeak__.interface.exposeFunction("NpcSetMeleeDamage", __MODS_NpcSetMeleeDamage);
    global.__katspeak__.interface.exposeFunction("NpcSetExperience", __MODS_NpcSetExperience);
    global.__katspeak__.interface.exposeFunction("NpcSpawn", __MODS_NpcSpawn);
    global.__katspeak__.interface.exposeFunction("NpcObjectSpawnNearPlayer", npc_spawn_near_player);
    global.__katspeak__.interface.exposeFunction("NpcObjectDestroy", npc_delete);
    global.__katspeak__.interface.exposeFunction("ChestCreate", __MODS_ChestCreate);
    global.__katspeak__.interface.exposeFunction("ChestSetAlwaysSeen", __MODS_ChestSetAlwaysSeen);
    global.__katspeak__.interface.exposeFunction("ChestSetDestroyWhenEmpty", __MODS_ChestSetDestroyWhenEmpty);
    global.__katspeak__.interface.exposeFunction("ChestSetFromEnemy", __MODS_ChestSetFromEnemy);
    global.__katspeak__.interface.exposeFunction("ChestSetIsDrop", __MODS_ChestSetIsDrop);
    global.__katspeak__.interface.exposeFunction("ChestSetItemCount", __MODS_ChestSetItemCount);
    global.__katspeak__.interface.exposeFunction("ChestSetItemDropChance", __MODS_ChestSetItemDropChance);
    global.__katspeak__.interface.exposeFunction("ChestSetItemsDecay", __MODS_ChestSetItemsDecay);
    global.__katspeak__.interface.exposeFunction("ChestSetSoundType", __MODS_ChestSetSoundType);
    global.__katspeak__.interface.exposeFunction("ChestSetSprite", __MODS_ChestSetSprite);
    global.__katspeak__.interface.exposeFunction("ChestSetName", __MODS_ChestSetName);
    global.__katspeak__.interface.exposeFunction("ChestAddItem", __MODS_ChestAddItem);
    global.__katspeak__.interface.exposeFunction("ChestAddSpecialItem", __MODS_ChestAddSpecialItem);
    global.__katspeak__.interface.exposeFunction("FactionCreate", __MODS_FactionCreate);
    global.__katspeak__.interface.exposeFunction("FactionSetName", __MODS_FactionSetName);
    global.__katspeak__.interface.exposeFunction("FactionSetRelationship", __MODS_FactionSetRelationship);
    global.__katspeak__.interface.exposeFunction("FactionExists", __MODS_FactionExists);
    global.__katspeak__.interface.exposeFunction("QuestIsComplete", __MODS_QuestIsComplete);
    global.__katspeak__.interface.exposeFunction("QuestCreate", __MODS_QuestCreate);
    global.__katspeak__.interface.exposeFunction("QuestSetName", __MODS_QuestSetName);
    global.__katspeak__.interface.exposeFunction("QuestSetText", __MODS_QuestSetText);
    global.__katspeak__.interface.exposeFunction("QuestAddReward", __MODS_QuestAddReward);
    global.__katspeak__.interface.exposeFunction("QuestAddObjective", __MODS_QuestAddObjective);
    global.__katspeak__.interface.exposeFunction("QuestObjectiveTypeKill", __MODS_QuestObjectiveTypeKill);
    global.__katspeak__.interface.exposeFunction("QuestObjectiveTypeCollect", __MODS_QuestObjectiveTypeCollect);
    global.__katspeak__.interface.exposeFunction("QuestObjectiveTypeSurviveMap", __MODS_QuestObjectiveTypeSurviveMap);
    global.__katspeak__.interface.exposeFunction("QuestObjectiveTypeSurviveMinimumMoney", __MODS_QuestObjectiveTypeSurviveMinimumMoney);
    global.__katspeak__.interface.exposeFunction("QuestObjectiveTypeSurviveMinimumExperience", __MODS_QuestObjectiveTypeSurviveMinimumExperience);
    global.__katspeak__.interface.exposeFunction("QuestObjectiveTypeApproach", __MODS_QuestObjectiveTypeApproach);
    global.__katspeak__.interface.exposeFunction("ScriptGet", __MODS_ScriptGet);
    global.__katspeak__.interface.exposeFunction("ScriptExpose", __MODS_ScriptExpose);
    global.__katspeak__.interface.exposeFunction("ScriptExecute", __MODS_ScriptExecute);
    global.__katspeak__.interface.exposeFunction("TraderCreate", __MODS_TraderCreate);
    global.__katspeak__.interface.exposeFunction("TraderSetFaction", __MODS_TraderSetFaction);
    global.__katspeak__.interface.exposeFunction("TraderSetFormatPages", __MODS_TraderSetFormatPages);
    global.__katspeak__.interface.exposeFunction("TraderSetMoney", __MODS_TraderSetMoney);
    global.__katspeak__.interface.exposeFunction("TraderSetName", __MODS_TraderSetName);
    global.__katspeak__.interface.exposeFunction("TraderAddItem", __MODS_TraderAddItem);
    global.__katspeak__.interface.exposeFunction("RoomGetCurrent", __MODS_RoomGetCurrent);
    global.__katspeak__.interface.exposeConstant("DIALOGUE_TYPE_back", "back");
    global.__katspeak__.interface.exposeConstant("DIALOGUE_TYPE_question", "question");
    global.__katspeak__.interface.exposeConstant("DIALOGUE_TYPE_task", "task");
    global.__katspeak__.interface.exposeConstant("DIALOGUE_TYPE_trade", "trade");
    global.__katspeak__.interface.exposeConstant("DIALOGUE_TYPE_repair_armor", "repair_armor");
    global.__katspeak__.interface.exposeConstant("DIALOGUE_TYPE_heal", "heal");
    global.__katspeak__.interface.exposeConstant("DIALOGUE_TYPE_choose_map", "choose_map");
    global.__katspeak__.interface.exposeFunction("ParticleSystemCreate", part_system_create);
    global.__katspeak__.interface.exposeFunction("ParticleSystemDestroy", part_system_destroy);
    global.__katspeak__.interface.exposeFunction("ParticleSystemClear", part_system_clear);
    global.__katspeak__.interface.exposeFunction("ParticleSystemPosition", part_system_position);
    global.__katspeak__.interface.exposeFunction("ParticleSystemUpdate", part_system_update);
    global.__katspeak__.interface.exposeFunction("ParticleSystemExists", part_system_exists);
    global.__katspeak__.interface.exposeFunction("ParticleSystemDepth", part_system_depth);
    global.__katspeak__.interface.exposeFunction("ParticleSystemCount", part_particles_count);
    global.__katspeak__.interface.exposeFunction("ParticleTypeCreate", part_type_create);
    global.__katspeak__.interface.exposeFunction("ParticleTypeAlpha1", part_type_alpha1);
    global.__katspeak__.interface.exposeFunction("ParticleTypeAlpha2", part_type_alpha2);
    global.__katspeak__.interface.exposeFunction("ParticleTypeAlpha3", part_type_alpha3);
    global.__katspeak__.interface.exposeFunction("ParticleTypeColor1", part_type_color1);
    global.__katspeak__.interface.exposeFunction("ParticleTypeColor2", part_type_color2);
    global.__katspeak__.interface.exposeFunction("ParticleTypeColor3", part_type_color3);
    global.__katspeak__.interface.exposeFunction("ParticleTypeBlend", part_type_blend);
    global.__katspeak__.interface.exposeFunction("ParticleTypeClear", part_type_clear);
    global.__katspeak__.interface.exposeFunction("ParticleTypeDestroy", part_type_destroy);
    global.__katspeak__.interface.exposeFunction("ParticleTypeSpeed", part_type_speed);
    global.__katspeak__.interface.exposeFunction("ParticleTypeLife", part_type_life);
    global.__katspeak__.interface.exposeFunction("ParticleTypeOrientation", part_type_orientation);
    global.__katspeak__.interface.exposeFunction("ParticleTypeDirection", part_type_direction);
    global.__katspeak__.interface.exposeFunction("ParticleTypeScale", part_type_scale);
    global.__katspeak__.interface.exposeFunction("ParticleTypeSize", part_type_size);
    global.__katspeak__.interface.exposeFunction("ParticleTypeGravity", part_type_gravity);
    global.__katspeak__.interface.exposeFunction("ParticleTypeStep", part_type_step);
    global.__katspeak__.interface.exposeFunction("ParticleTypeSprite", part_type_sprite);
    global.__katspeak__.interface.exposeFunction("ParticleTypeShape", part_type_shape);
    global.__katspeak__.interface.exposeFunction("ParticleTypeDeath", part_type_death);
    global.__katspeak__.interface.exposeFunction("ParticleTypeExists", part_type_exists);
    global.__katspeak__.interface.exposeFunction("ParticleEmitterCreate", part_emitter_create);
    global.__katspeak__.interface.exposeFunction("ParticleEmitterDestroy", part_emitter_destroy);
    global.__katspeak__.interface.exposeFunction("ParticleEmitterDestroyAll", part_emitter_destroy_all);
    global.__katspeak__.interface.exposeFunction("ParticleEmitterExists", part_emitter_exists);
    global.__katspeak__.interface.exposeFunction("ParticleEmitterBurst", part_emitter_burst);
    global.__katspeak__.interface.exposeFunction("ParticleEmitterClear", part_emitter_clear);
    global.__katspeak__.interface.exposeFunction("ParticleEmitterRegion", part_emitter_region);
    global.__katspeak__.interface.exposeFunction("ParticleEmitterStream", part_emitter_stream);
    global.__katspeak__.interface.exposeFunction("ParticleParticlesCreate", part_particles_create);
    global.__katspeak__.interface.exposeConstant("pt_shape_circle", 5);
    global.__katspeak__.interface.exposeFunction("pt_shape_pixel", 0);
    global.__katspeak__.interface.exposeFunction("pt_shape_disk", 1);
    global.__katspeak__.interface.exposeFunction("pt_shape_square", 2);
    global.__katspeak__.interface.exposeFunction("pt_shape_line", 3);
    global.__katspeak__.interface.exposeFunction("pt_shape_star", 4);
    global.__katspeak__.interface.exposeFunction("pt_shape_circle", 5);
    global.__katspeak__.interface.exposeFunction("pt_shape_ring", 6);
    global.__katspeak__.interface.exposeFunction("pt_shape_sphere", 7);
    global.__katspeak__.interface.exposeFunction("pt_shape_flare", 8);
    global.__katspeak__.interface.exposeFunction("pt_shape_spark", 9);
    global.__katspeak__.interface.exposeFunction("pt_shape_explosion", 10);
    global.__katspeak__.interface.exposeFunction("pt_shape_cloud", 11);
    global.__katspeak__.interface.exposeFunction("pt_shape_smoke", 12);
    global.__katspeak__.interface.exposeFunction("pt_shape_snow", 13);
    global.__katspeak__.interface.exposeFunction("ps_distr_linear", 0);
    global.__katspeak__.interface.exposeFunction("ps_distr_gaussian", 1);
    global.__katspeak__.interface.exposeFunction("ps_distr_invgaussian", 2);
    global.__katspeak__.interface.exposeFunction("ps_shape_rectangle", 0);
    global.__katspeak__.interface.exposeFunction("ps_shape_ellipse", 1);
    global.__katspeak__.interface.exposeFunction("ps_shape_diamond", 2);
    global.__katspeak__.interface.exposeFunction("ps_shape_line", 3);
    global.__katspeak__.interface.exposeFunction("ObjectCreate", __MODS_ObjectCreate);
    global.__katspeak__.interface.exposeFunction("ObjectSetScript", __MODS_ObjectSetScript);
    global.__katspeak__.interface.exposeFunction("ObjectSetType", __MODS_ObjectSetType);
    global.__katspeak__.interface.exposeFunction("ObjectSpawn", __MODS_ObjectSpawn);
    global.__katspeak__.interface.exposeFunction("ObjectExists", __MODS_ObjectExists);
    global.__katspeak__.interface.exposeFunction("ObjectGetAllInstances", __MODS_ObjectGetAllInstances);
    global.__katspeak__.interface.exposeFunction("InstanceContext", __MODS_InstanceContext);
    global.__katspeak__.interface.exposeFunction("InstanceCreate", __MODS_InstanceCreate);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeCreate", __MODS_ItemGrenadeCreate);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetAnimation", __MODS_ItemGrenadeSetAnimation);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetThrowMin", __MODS_ItemGrenadeSetThrowMin);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetThrowMax", __MODS_ItemGrenadeSetThrowMax);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetFuseTime", __MODS_ItemGrenadeSetFuseTime);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetThrowType", __MODS_ItemGrenadeSetThrowType);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetDamageMax", __MODS_ItemGrenadeSetDamageMax);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetDamageMin", __MODS_ItemGrenadeSetDamageMin);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetDetonationType", __MODS_ItemGrenadeSetDetonationType);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetDetonationDuration", __MODS_ItemGrenadeSetDetonationDuration);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetRadiusMaxDamage", __MODS_ItemGrenadeSetRadiusMaxDamage);
    global.__katspeak__.interface.exposeFunction("ItemGrenadeSetRadiusMinDamage", __MODS_ItemGrenadeSetRadiusMinDamage);
    global.__katspeak__.interface.exposeFunction("LanguageCreate", __MODS_LanguageCreate);
    global.__katspeak__.interface.exposeFunction("LanguageSetFontSizes", __MODS_LanguageSetFontSizes);
    global.__katspeak__.interface.exposeFunction("LanguageSetFontOffsets", __MODS_LanguageSetFontOffsets);
    global.__katspeak__.interface.exposeFunction("LoadoutClear", __MODS_LoadoutClear);
    global.__katspeak__.interface.exposeFunction("LoadoutAddItem", __MODS_LoadoutAddItem);
    global.__katspeak__.interface.exposeFunction("CollisionWalkable", scr_check_position_free);
    global.__katspeak__.interface.exposeFunction("EventAssignFunction", __MODS_EventAssignFunction);
    global.__katspeak__.interface.exposeFunction("TimeGetYear", function()
    {
        with (obj_light_controller)
            return date_get_year(game_time_played);
        
        return 0;
    });
    global.__katspeak__.interface.exposeFunction("TimeGetMonth", function()
    {
        with (obj_light_controller)
            return date_get_month(game_time_played);
        
        return 0;
    });
    global.__katspeak__.interface.exposeFunction("TimeGetHour", time_get_hours_fraction);
    global.__katspeak__.interface.exposeFunction("TimeGetDay", time_get_days);
    global.__katspeak__.interface.exposeFunction("TimeGetMinute", time_get_minutes);
    global.__katspeak__.interface.exposeFunction("TimeGetSecond", time_get_seconds);
    global.__katspeak__.interface.exposeFunction("ShowMessage", show_message);
    global.__katspeak__.interface.exposeFunction("ShowDebugMessage", show_debug_message);
    global.__katspeak__.interface.exposeFunction("String", string);
    global.__katspeak__.interface.exposeFunction("Real", real);
    global.__katspeak__.interface.exposeFunction("ObjectGetName", object_get_name);
    global.__katspeak__.interface.exposeFunction("PlaceMeeting", place_meeting);
    global.__katspeak__.interface.exposeFunction("InstanceExists", instance_exists);
    global.__katspeak__.interface.exposeFunction("LengthDirX", lengthdir_x);
    global.__katspeak__.interface.exposeFunction("LengthDirY", lengthdir_y);
    global.__katspeak__.interface.exposeFunction("PointDirection", point_direction);
    global.__katspeak__.interface.exposeFunction("PointDistance", point_distance);
    global.__katspeak__.interface.exposeFunction("Min", min);
    global.__katspeak__.interface.exposeFunction("Max", max);
    global.__katspeak__.interface.exposeFunction("Round", round);
    global.__katspeak__.interface.exposeFunction("Floor", floor);
    global.__katspeak__.interface.exposeFunction("Ceil", ceil);
    global.__katspeak__.interface.exposeFunction("Mean", mean);
    global.__katspeak__.interface.exposeFunction("Median", median);
    global.__katspeak__.interface.exposeFunction("Clamp", clamp);
    global.__katspeak__.interface.exposeFunction("Frac", frac);
    global.__katspeak__.interface.exposeFunction("Abs", abs);
    global.__katspeak__.interface.exposeFunction("Sign", sign);
    global.__katspeak__.interface.exposeFunction("Lerp", lerp);
    global.__katspeak__.interface.exposeFunction("Exp", exp);
    global.__katspeak__.interface.exposeFunction("Ln", ln);
    global.__katspeak__.interface.exposeFunction("Power", power);
    global.__katspeak__.interface.exposeFunction("Sqr", sqr);
    global.__katspeak__.interface.exposeFunction("Sqrt", sqrt);
    global.__katspeak__.interface.exposeFunction("Log2", log2);
    global.__katspeak__.interface.exposeFunction("Log10", log10);
    global.__katspeak__.interface.exposeFunction("Logn", logn);
    global.__katspeak__.interface.exposeFunction("Choose", choose);
    global.__katspeak__.interface.exposeFunction("Random", random);
    global.__katspeak__.interface.exposeFunction("RandomRange", random_range);
    global.__katspeak__.interface.exposeFunction("Irandom", irandom);
    global.__katspeak__.interface.exposeFunction("IrandomRange", irandom_range);
    global.__katspeak__.interface.exposeFunction("Arccos", arccos);
    global.__katspeak__.interface.exposeFunction("Arcsin", arcsin);
    global.__katspeak__.interface.exposeFunction("Arctan", arctan);
    global.__katspeak__.interface.exposeFunction("Arctan2", arctan2);
    global.__katspeak__.interface.exposeFunction("Cos", cos);
    global.__katspeak__.interface.exposeFunction("Sin", sin);
    global.__katspeak__.interface.exposeFunction("Tan", tan);
    global.__katspeak__.interface.exposeFunction("Dcos", dcos);
    global.__katspeak__.interface.exposeFunction("Dsin", dsin);
    global.__katspeak__.interface.exposeFunction("Dtan", dtan);
    global.__katspeak__.interface.exposeFunction("Darccos", darccos);
    global.__katspeak__.interface.exposeFunction("Darcsin", darcsin);
    global.__katspeak__.interface.exposeFunction("Darctan", darctan);
    global.__katspeak__.interface.exposeFunction("Darctan2", darctan2);
    global.__katspeak__.interface.exposeFunction("Degtorad", degtorad);
    global.__katspeak__.interface.exposeFunction("Radtodeg", radtodeg);
    global.__katspeak__.interface.exposeFunction("DotProduct", dot_product);
    global.__katspeak__.interface.exposeFunction("AngleDifference", angle_difference);
    global.__katspeak__.interface.exposeFunction("GetInstanceOfObject", function(arg0)
    {
        var _object = asset_get_index(arg0);
        
        if (object_exists(_object))
        {
            with (_object)
                return id;
        }
        else if (variable_struct_exists(global.Mods_Objects, arg0))
        {
            with (variable_struct_get(global.Mods_Objects, arg0).object_type)
            {
                if (object_events.object_id == arg0)
                    return id;
            }
        }
        
        return -1;
    });
    global.__katspeak__.interface.exposeFunction("DrawSelf", draw_self);
    global.__katspeak__.interface.exposeFunction("DrawSprite", draw_sprite);
    global.__katspeak__.interface.exposeFunction("DrawSpriteExt", draw_sprite_ext);
    global.__katspeak__.interface.exposeFunction("DrawSpriteStretched", draw_sprite_stretched);
    global.__katspeak__.interface.exposeFunction("DrawSpriteStretchedExt", draw_sprite_stretched_ext);
    global.__katspeak__.interface.exposeFunction("DrawSpriteSprite", draw_sprite_part);
    global.__katspeak__.interface.exposeFunction("DrawSpriteSpriteExt", draw_sprite_part_ext);
    global.__katspeak__.interface.exposeFunction("DrawSpritePos", draw_sprite_pos);
    global.__katspeak__.interface.exposeFunction("DrawSpritePart", draw_sprite_part);
    global.__katspeak__.interface.exposeFunction("DrawSpritePartExt", draw_sprite_part_ext);
    global.__katspeak__.interface.exposeFunction("DrawSpriteGeneral", draw_sprite_general);
    global.__katspeak__.interface.exposeFunction("DrawSpriteTiled", draw_sprite_tiled);
    global.__katspeak__.interface.exposeFunction("DrawSpriteTiledExt", draw_sprite_tiled_ext);
    global.__katspeak__.interface.exposeFunction("KeyboardCheck", keyboard_check);
    global.__katspeak__.interface.exposeFunction("KeyboardCheckPressed", keyboard_check_pressed);
    global.__katspeak__.interface.exposeFunction("KeyboardCheckReleased", keyboard_check_released);
    global.__katspeak__.interface.exposeFunction("MouseCheckButton", mouse_check_button);
    global.__katspeak__.interface.exposeFunction("MouseCheckButtonPressed", mouse_check_button_pressed);
    global.__katspeak__.interface.exposeFunction("MouseCheckButtonReleased", mouse_check_button_released);
    global.__katspeak__.interface.exposeFunction("Ord", ord);
    global.__katspeak__.interface.exposeConstant("vk_nokey", 0);
    global.__katspeak__.interface.exposeConstant("vk_anykey", 1);
    global.__katspeak__.interface.exposeConstant("vk_enter", 13);
    global.__katspeak__.interface.exposeConstant("vk_return", 13);
    global.__katspeak__.interface.exposeConstant("vk_shift", 16);
    global.__katspeak__.interface.exposeConstant("vk_control", 17);
    global.__katspeak__.interface.exposeConstant("vk_alt", 18);
    global.__katspeak__.interface.exposeConstant("vk_escape", 27);
    global.__katspeak__.interface.exposeConstant("vk_space", 32);
    global.__katspeak__.interface.exposeConstant("vk_backspace", 8);
    global.__katspeak__.interface.exposeConstant("vk_tab", 9);
    global.__katspeak__.interface.exposeConstant("vk_pause", 19);
    global.__katspeak__.interface.exposeConstant("vk_printscreen", 44);
    global.__katspeak__.interface.exposeConstant("vk_left", 37);
    global.__katspeak__.interface.exposeConstant("vk_right", 39);
    global.__katspeak__.interface.exposeConstant("vk_up", 38);
    global.__katspeak__.interface.exposeConstant("vk_down", 40);
    global.__katspeak__.interface.exposeConstant("vk_home", 36);
    global.__katspeak__.interface.exposeConstant("vk_end", 35);
    global.__katspeak__.interface.exposeConstant("vk_delete", 46);
    global.__katspeak__.interface.exposeConstant("vk_insert", 45);
    global.__katspeak__.interface.exposeConstant("vk_pageup", 33);
    global.__katspeak__.interface.exposeConstant("vk_pagedown", 34);
    global.__katspeak__.interface.exposeConstant("vk_f1", 112);
    global.__katspeak__.interface.exposeConstant("vk_f2", 113);
    global.__katspeak__.interface.exposeConstant("vk_f3", 114);
    global.__katspeak__.interface.exposeConstant("vk_f4", 115);
    global.__katspeak__.interface.exposeConstant("vk_f5", 116);
    global.__katspeak__.interface.exposeConstant("vk_f6", 117);
    global.__katspeak__.interface.exposeConstant("vk_f7", 118);
    global.__katspeak__.interface.exposeConstant("vk_f8", 119);
    global.__katspeak__.interface.exposeConstant("vk_f9", 120);
    global.__katspeak__.interface.exposeConstant("vk_f10", 121);
    global.__katspeak__.interface.exposeConstant("vk_f11", 122);
    global.__katspeak__.interface.exposeConstant("vk_f12", 123);
    global.__katspeak__.interface.exposeConstant("vk_numpad0", 96);
    global.__katspeak__.interface.exposeConstant("vk_numpad1", 97);
    global.__katspeak__.interface.exposeConstant("vk_numpad2", 98);
    global.__katspeak__.interface.exposeConstant("vk_numpad3", 99);
    global.__katspeak__.interface.exposeConstant("vk_numpad4", 100);
    global.__katspeak__.interface.exposeConstant("vk_numpad5", 101);
    global.__katspeak__.interface.exposeConstant("vk_numpad6", 102);
    global.__katspeak__.interface.exposeConstant("vk_numpad7", 103);
    global.__katspeak__.interface.exposeConstant("vk_numpad8", 104);
    global.__katspeak__.interface.exposeConstant("vk_numpad9", 105);
    global.__katspeak__.interface.exposeConstant("vk_divide", 111);
    global.__katspeak__.interface.exposeConstant("vk_multiply", 106);
    global.__katspeak__.interface.exposeConstant("vk_subtract", 109);
    global.__katspeak__.interface.exposeConstant("vk_add", 107);
    global.__katspeak__.interface.exposeConstant("vk_decimal", 110);
    global.__katspeak__.interface.exposeConstant("vk_lshift", 160);
    global.__katspeak__.interface.exposeConstant("vk_lcontrol", 162);
    global.__katspeak__.interface.exposeConstant("vk_lalt", 164);
    global.__katspeak__.interface.exposeConstant("vk_rshift", 161);
    global.__katspeak__.interface.exposeConstant("vk_rcontrol", 163);
    global.__katspeak__.interface.exposeConstant("vk_ralt", 165);
    global.__katspeak__.interface.exposeConstant("mb_any", -1);
    global.__katspeak__.interface.exposeConstant("mb_none", 0);
    global.__katspeak__.interface.exposeConstant("mb_left", 1);
    global.__katspeak__.interface.exposeConstant("mb_right", 2);
    global.__katspeak__.interface.exposeConstant("mb_middle", 3);
    global.__katspeak__.interface.exposeConstant("mb_side1", 4);
    global.__katspeak__.interface.exposeConstant("mb_side2", 5);
    global.__katspeak__.interface.exposeFunction("ArrayLength", array_length);
    global.__katspeak__.interface.exposeFunction("ArrayContains", global.array_contains);
    global.__katspeak__.interface.exposeFunction("ArrayPush", array_push);
    global.__katspeak__.interface.exposeFunction("ArrayDelete", array_delete);
    global.__katspeak__.interface.exposeFunction("ArrayFirst", array_first);
    global.__katspeak__.interface.exposeFunction("ArrayLast", array_last);
    global.__katspeak__.interface.exposeFunction("ArrayResize", array_resize);
    global.__katspeak__.interface.exposeFunction("StructExists", variable_struct_exists);
    global.__katspeak__.interface.exposeFunction("StructRemove", variable_struct_remove);
    global.__katspeak__.interface.exposeFunction("StructGetNames", variable_struct_get_names);
    global.__katspeak__.interface.exposeFunction("StructGet", function(arg0, arg1)
    {
        if (is_struct(arg0))
            return variable_struct_get(arg0, arg1);
    });
    global.__katspeak__.interface.exposeFunction("StructSet", variable_struct_set);
    global.__katspeak__.interface.exposeFunction("FileDataWrite", __MODS_FileDataWrite);
    global.__katspeak__.interface.exposeFunction("FileDataRead", __MODS_FileDataRead);
    var _index = 0;
    
    while (sprite_exists(_index))
        global.__katspeak__.interface.exposeAsset(sprite_get_name(_index++));
    
    objects_to_expose = [];
    array_push(objects_to_expose, obj_player);
    array_push(objects_to_expose, obj_solid);
    array_push(objects_to_expose, obj_solid_can_see);
    array_push(objects_to_expose, obj_npc_parent);
    array_push(objects_to_expose, obj_npc_human_parent);
    array_push(objects_to_expose, obj_enemy_mutant_parent);
    array_push(objects_to_expose, obj_enemy_boar);
    array_push(objects_to_expose, obj_enemy_boar_zombie);
    array_push(objects_to_expose, obj_enemy_blink);
    array_push(objects_to_expose, obj_enemy_big);
    array_push(objects_to_expose, obj_enemy_anomaly_electric);
    array_push(objects_to_expose, obj_enemy_anomaly_fire);
    array_push(objects_to_expose, obj_enemy_crow);
    array_push(objects_to_expose, obj_enemy_ghoul);
    array_push(objects_to_expose, obj_enemy_ghoul_2);
    array_push(objects_to_expose, obj_enemy_rabbit);
    array_push(objects_to_expose, obj_enemy_rat);
    array_push(objects_to_expose, obj_enemy_spider);
    array_push(objects_to_expose, obj_enemy_spine);
    array_push(objects_to_expose, obj_enemy_wolf_brown);
    array_push(objects_to_expose, obj_enemy_zombie);
    array_push(objects_to_expose, obj_bandit_preset_expert);
    array_push(objects_to_expose, obj_bandit_preset_intermediate);
    array_push(objects_to_expose, obj_bandit_preset_master);
    array_push(objects_to_expose, obj_bandit_preset_rookie);
    array_push(objects_to_expose, obj_bandit_preset_skilled);
    array_push(objects_to_expose, obj_bandit_preset_veteran);
    array_push(objects_to_expose, obj_boss_arman);
    array_push(objects_to_expose, obj_boss_city);
    array_push(objects_to_expose, obj_boss_killa);
    array_push(objects_to_expose, obj_crimson_cyclops);
    array_push(objects_to_expose, obj_crimson_preset_expert);
    array_push(objects_to_expose, obj_crimson_preset_intermediate);
    array_push(objects_to_expose, obj_crimson_preset_master);
    array_push(objects_to_expose, obj_crimson_preset_rookie);
    array_push(objects_to_expose, obj_crimson_preset_skilled);
    array_push(objects_to_expose, obj_crimson_preset_veteran);
    array_push(objects_to_expose, obj_crimson_soldier);
    array_push(objects_to_expose, obj_dummy);
    array_push(objects_to_expose, obj_enemy_big);
    array_push(objects_to_expose, obj_enemy_blink);
    array_push(objects_to_expose, obj_enemy_boar);
    array_push(objects_to_expose, obj_enemy_boss_city_guard);
    array_push(objects_to_expose, obj_enemy_ghoul);
    array_push(objects_to_expose, obj_enemy_ghoul_2);
    array_push(objects_to_expose, obj_enemy_human_bandit_boss);
    array_push(objects_to_expose, obj_enemy_human_bandit_boss_guard);
    array_push(objects_to_expose, obj_enemy_human_bandit_boss_outpost);
    array_push(objects_to_expose, obj_enemy_human_bandit_novice);
    array_push(objects_to_expose, obj_enemy_infestation);
    array_push(objects_to_expose, obj_enemy_rabbit);
    array_push(objects_to_expose, obj_enemy_rat);
    array_push(objects_to_expose, obj_enemy_spider);
    array_push(objects_to_expose, obj_enemy_wolf_brown);
    array_push(objects_to_expose, obj_green_army_cyclops);
    array_push(objects_to_expose, obj_green_army_preset_expert);
    array_push(objects_to_expose, obj_green_army_preset_intermediate);
    array_push(objects_to_expose, obj_green_army_preset_master);
    array_push(objects_to_expose, obj_green_army_preset_rookie);
    array_push(objects_to_expose, obj_green_army_preset_skilled);
    array_push(objects_to_expose, obj_green_army_preset_veteran);
    array_push(objects_to_expose, obj_green_army_soldier1);
    array_push(objects_to_expose, obj_hunter_cyclops);
    array_push(objects_to_expose, obj_hunter_preset_expert);
    array_push(objects_to_expose, obj_hunter_preset_intermediate);
    array_push(objects_to_expose, obj_hunter_preset_master);
    array_push(objects_to_expose, obj_hunter_preset_rookie);
    array_push(objects_to_expose, obj_hunter_preset_skilled);
    array_push(objects_to_expose, obj_hunter_preset_veteran);
    array_push(objects_to_expose, obj_loner_enemy);
    array_push(objects_to_expose, obj_loner_novice);
    array_push(objects_to_expose, obj_scientist);
    array_push(objects_to_expose, obj_scientist_2);
    array_push(objects_to_expose, obj_watcher_cyclops);
    array_push(objects_to_expose, obj_watcher_devil);
    array_push(objects_to_expose, obj_watcher_general);
    array_push(objects_to_expose, obj_watcher_preset_expert);
    array_push(objects_to_expose, obj_watcher_preset_intermediate);
    array_push(objects_to_expose, obj_watcher_preset_master);
    array_push(objects_to_expose, obj_watcher_preset_rookie);
    array_push(objects_to_expose, obj_watcher_preset_skilled);
    array_push(objects_to_expose, obj_watcher_preset_veteran);
    array_push(objects_to_expose, obj_enemy_boss_city_guard);
    array_push(objects_to_expose, obj_enemy_human_bandit_boss);
    array_push(objects_to_expose, obj_enemy_human_bandit_boss_guard);
    array_push(objects_to_expose, obj_enemy_human_bandit_boss_outpost);
    array_push(objects_to_expose, obj_boss_city);
    array_push(objects_to_expose, obj_watcher_devil);
    array_push(objects_to_expose, obj_crimson_soldier);
    array_push(objects_to_expose, obj_enemy_human_bandit_novice);
    array_push(objects_to_expose, obj_green_army_soldier1);
    array_push(objects_to_expose, obj_loner_enemy);
    array_push(objects_to_expose, obj_watcher_general);
    array_push(objects_to_expose, obj_mod_generic);
    array_push(objects_to_expose, obj_mod_generic_solid);
    _index = 0;
    
    for (_index = 0; _index < array_length(objects_to_expose); _index++)
    {
        var _object_name = object_get_name(objects_to_expose[_index]);
        global.__katspeak__.interface.exposeAsset(_object_name);
        variable_struct_set(global.Mods_Objects, _object_name, new ObjectData(_object_name, objects_to_expose[_index]));
    }
}

function mods_expose_macros()
{
    global.__katspeak__.interface.exposeConstant("MAP_forest", UnknownEnum.Value_1);
    global.__katspeak__.interface.exposeConstant("MAP_makeshift_camp", UnknownEnum.Value_2);
    global.__katspeak__.interface.exposeConstant("MAP_industrial_area", UnknownEnum.Value_3);
    global.__katspeak__.interface.exposeConstant("MAP_swamp", UnknownEnum.Value_4);
    global.__katspeak__.interface.exposeConstant("MAP_mall", UnknownEnum.Value_6);
    global.__katspeak__.interface.exposeConstant("MAP_zaton", UnknownEnum.Value_7);
    global.__katspeak__.interface.exposeConstant("MAP_city", UnknownEnum.Value_8);
    global.__katspeak__.interface.exposeConstant("MAP_cnpp", UnknownEnum.Value_9);
    global.__katspeak__.interface.exposeConstant("FACTION_REP_max", 1000);
    global.__katspeak__.interface.exposeConstant("FACTION_REP_min", 0);
    global.__katspeak__.interface.exposeConstant("FACTION_REP_enemy", 250);
    global.__katspeak__.interface.exposeConstant("FACTION_REP_ally", 450);
    global.__katspeak__.interface.exposeConstant("FACTION_REP_join", 600);
}

function mods_init()
{
    mods_clear_data();
    mods_audio_build_all();
    
    if (global.__katspeak__.interface.exposeFunction == undefined)
        global.__katspeak__.interface = new KatspeakForeignInterface();
    
    mods_expose_functions();
    mods_expose_macros();
    mods_kill_dangerous_functions();
    mods_sprites_build();
    mods_build_files();
}

function mods_build_files()
{
    file_slash_format = "/";
    file_prepath = ugc_get_folder();
    file_search = file_find_get_all(file_prepath, file_slash_format);
    file_search[1] = array_extract_arrays(file_search[1]);
    var _mods_enabled_json = {};
    
    if (file_exists("mods_enabled.json"))
    {
        _buffer = buffer_load("mods_enabled.json");
        
        try
        {
            _mods_enabled_json = json_parse(buffer_read(_buffer, buffer_text));
        }
        catch (_error)
        {
            show_message("There was an error while parsing \"mods_enabled.json\", this file will be deleted.");
            show_message(_error.longMessage);
            file_delete("mods_enabled.json");
            _mods_enabled_json = {};
        }
        
        buffer_delete(_buffer);
    }
    
    for (var _i = 0; _i < array_length(file_search[0]); _i++)
    {
        var _folder = file_search[0][_i];
        var _mod_name = string_replace_all(_folder, file_prepath + file_slash_format, "");
        
        if (string_pos("/", _mod_name) == 0 && string_pos("\\", _mod_name) == 0)
        {
            array_push(global.Mods_Data_Array, _mod_name);
            variable_struct_set(global.Mods_Data, _mod_name, new ModData(_mod_name, _folder));
            
            if (variable_struct_exists(_mods_enabled_json, _mod_name))
                variable_struct_get(global.Mods_Data, _mod_name).enabled = variable_struct_get(_mods_enabled_json, _mod_name);
            else
                variable_struct_set(_mods_enabled_json, _mod_name, true);
            
            variable_struct_get(global.Mods_Data, _mod_name).scripts_to_compile = file_search[1];
            
            if (variable_struct_get(global.Mods_Data, _mod_name).enabled)
                array_push(global.Mods_Order, _mod_name);
            else
                array_push(global.Mods_Off, _mod_name);
        }
    }
    
    if (file_exists("installed_mods.json"))
    {
        var _current_mods = [];
        
        try
        {
            _current_mods = json_parse(SnapStringFromFile("installed_mods.json"));
        }
        catch (_error)
        {
            show_message("There was an error while parsing \"installed_mods.json\", this file will be deleted.");
            show_message(_error.longMessage);
            file_delete("installed_mods.json");
            _current_mods = {};
        }
        
        if (is_array(_current_mods))
        {
            var _mod_count = array_length(_current_mods);
            
            for (var i = 0; i < _mod_count; i++)
            {
                var _this_mod = _current_mods[i];
                
                if (_this_mod.installed)
                {
                    var _mod_folder = _this_mod.folder;
                    var _meta_path = _mod_folder + "\\" + "meta.ini";
                    file_prepath = _mod_folder;
                    file_search = file_find_get_all(_mod_folder, file_slash_format);
                    file_search[1] = array_extract_arrays(file_search[1]);
                    
                    if (directory_exists(_mod_folder) && file_exists(_meta_path))
                    {
                        ini_open(_mod_folder + "\\" + "meta.ini");
                        var _mod_name = ini_read_string("mod", "name", "default");
                        ini_close();
                        array_push(global.Mods_Data_Array, _mod_name);
                        variable_struct_set(global.Mods_Data, _mod_name, new ModData(_mod_name, _mod_folder));
                        
                        if (variable_struct_exists(_mods_enabled_json, _mod_name))
                            variable_struct_get(global.Mods_Data, _mod_name).enabled = variable_struct_get(_mods_enabled_json, _mod_name);
                        else
                            variable_struct_set(_mods_enabled_json, _mod_name, true);
                        
                        variable_struct_get(global.Mods_Data, _mod_name).scripts_to_compile = file_search[1];
                        
                        if (variable_struct_get(global.Mods_Data, _mod_name).enabled)
                            array_push(global.Mods_Order, _mod_name);
                        else
                            array_push(global.Mods_Off, _mod_name);
                    }
                }
            }
        }
    }
    
    mods_compile();
    var _buffer = buffer_create(1, buffer_grow, 1);
    buffer_write(_buffer, buffer_text, json_stringify(_mods_enabled_json));
    buffer_save(_buffer, "mods_enabled.json");
    buffer_delete(_buffer);
}

function mods_sprites_build()
{
    for (var _i = 0; _i < array_length(global.item_data_array); _i++)
    {
        variable_struct_set(global.Mods_Sprite_Ingame_Data, global.item_data_array[_i], mods_item_get_sprite_ingame(global.item_data_array[_i]));
        variable_struct_set(global.Mods_Sprite_Inventory_Data, global.item_data_array[_i], mods_item_get_sprite_inv(global.item_data_array[_i]));
        
        if (item_fits_category(global.item_data_array[_i], "armor"))
        {
            variable_struct_set(global.Mods_Sprite_Armor_Data, variable_struct_get(global.item_data, global.item_data_array[_i]).armor.s_idle, asset_get_index(variable_struct_get(global.item_data, global.item_data_array[_i]).armor.s_idle));
            variable_struct_set(global.Mods_Sprite_Armor_Data, variable_struct_get(global.item_data, global.item_data_array[_i]).armor.s_dead, asset_get_index(variable_struct_get(global.item_data, global.item_data_array[_i]).armor.s_dead));
            variable_struct_set(global.Mods_Sprite_Armor_Data, variable_struct_get(global.item_data, global.item_data_array[_i]).armor.s_run, asset_get_index(variable_struct_get(global.item_data, global.item_data_array[_i]).armor.s_run));
        }
        else if (item_fits_category(global.item_data_array[_i], "backpack"))
        {
            variable_struct_set(global.Mods_Sprite_Backpack_Data, variable_struct_get(global.item_data, global.item_data_array[_i]).backpack.sprite_game, asset_get_index(variable_struct_get(global.item_data, global.item_data_array[_i]).backpack.sprite_game));
        }
        else if (item_fits_category(global.item_data_array[_i], "w_mod"))
        {
            var _struct = variable_struct_get(global.item_data, global.item_data_array[_i]).weapon_mod;
            
            if (_struct.type == "scope" && _struct.scope_optic == true)
                variable_struct_set(global.Mods_Sprite_Weapon_Scopes, _struct.scope_image, asset_get_index(_struct.scope_image));
        }
        else if (item_fits_category(global.item_data_array[_i], "consumable"))
        {
            var _struct = struct_get_from_hash(variable_struct_get(global.item_data, global.item_data_array[_i]), variable_get_hash("consumable"));
            
            if (_struct != undefined)
            {
                if (struct_get_from_hash(_struct, variable_get_hash("animation")) != undefined)
                    variable_struct_set(global.Mods_Sprite_Consumable_Animation_Data, _struct.animation, asset_get_index(_struct.animation));
            }
        }
    }
}

function mods_audio_build_all()
{
    for (var _index = 0; audio_exists(_index); _index++)
        variable_struct_set(global.Mods_Audio_Data, audio_get_name(_index), _index);
}

function mods_item_get_sprite_ingame(arg0)
{
    if (!item_exists(arg0))
        return s_vuoto;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        mods_trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("basic"));
    
    if (!is_struct(_struct))
        mods_trace_error("Item \"", arg0, "\" has no .basic data");
    
    return asset_get_index(_struct.sprite_ingame);
}

function mods_item_get_sprite_inv(arg0)
{
    if (!item_exists(arg0))
        return s_vuoto;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        mods_trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("basic"));
    
    if (!is_struct(_struct))
        mods_trace_error("Item \"", arg0, "\" has no .basic data");
    
    return asset_get_index(_struct.sprite_inv);
}

function file_find_get_all(arg0 = "", arg1 = "/")
{
    var _files = [];
    var _folders = [];
    var _folder = file_find_first(arg0 + arg1 + "*", 16);
    
    while (_folder != "")
    {
        array_push(_folders, arg0 + arg1 + _folder);
        _folder = file_find_next();
    }
    
    file_find_close();
    
    for (var _i = 0; _i < array_length(_folders); _i++)
    {
        if (!directory_exists(_folders[_i]))
            array_delete(_folders, _i--, 1);
    }
    
    var _file = file_find_first(arg0 + arg1 + "*", 0);
    
    while (_file != "")
    {
        array_push(_files, arg0 + arg1 + _file);
        _file = file_find_next();
    }
    
    file_find_close();
    
    for (var _i = 0; _i < array_length(_folders); _i++)
    {
        var _files_sub = file_find_get_all(_folders[_i], arg1);
        
        for (var _r = 0; _r < array_length(_files_sub); _r++)
            array_push(_files, _files_sub[_r]);
    }
    
    return [_folders, _files];
}

function file_get_text(arg0)
{
    var _buffer = buffer_load(arg0);
    var _text = buffer_read(_buffer, buffer_text);
    buffer_delete(_buffer);
    return _text;
}

function array_extract_arrays(arg0)
{
    var _result_array = [];
    
    for (var _i = 0; _i < array_length(arg0); _i++)
    {
        if (!is_array(arg0[_i]))
        {
            array_push(_result_array, arg0[_i]);
        }
        else
        {
            var _result_array_sub = array_extract_arrays(arg0[_i]);
            
            for (var _r = 0; _r < array_length(_result_array_sub); _r++)
                array_push(_result_array, _result_array_sub[_r]);
        }
    }
    
    return _result_array;
}

function mods_trace_error(arg0, arg1 = true)
{
    trace(arg0);
    global.Mods_Trace_Error = arg0;
    
    if (arg1)
    {
        var _buffer = buffer_create(1, buffer_grow, 1);
        buffer_write(_buffer, buffer_text, "// Trace Error");
        buffer_write(_buffer, buffer_text, "\n");
        buffer_write(_buffer, buffer_text, global.Mods_Trace_Error);
        buffer_write(_buffer, buffer_text, "\n\n");
        buffer_write(_buffer, buffer_text, "// Stack Trace");
        buffer_write(_buffer, buffer_text, "\n");
        buffer_write(_buffer, buffer_text, debug_get_callstack());
        buffer_save(_buffer, "CrashReport_" + string_replace_all(date_date_string(date_current_datetime()), "/", "_") + ".txt");
        buffer_delete(_buffer);
        show_error("Code failure in: \"" + global.__Mods_File_Current + "\"\n \n" + arg0 + "\n ", true);
    }
}

function mods_clear_data()
{
    for (var _i = 0; _i < array_length(global.__Mods_Cleanup_Quests_Array); _i++)
        variable_struct_remove(global.quest_database, global.__Mods_Cleanup_Quests_Array[_i]);
    
    for (var _i = 0; _i < array_length(global.__Mods_Speaker_Array); _i++)
        variable_struct_remove(global.speaker_data, global.__Mods_Speaker_Array[_i]);
    
    global.Mods_Data = {};
    global.Mods_Scripts = {};
    global.Mods_Objects = {};
    global.Mods_Rooms = {};
    global.Mods_Languages = {};
    global.Mods_Data_Array = [];
    global.__Mods_Path_Current = "";
    global.__Mods_File_Current = "";
    global.__Mods_Context_Current = undefined;
    global.__Mods_Dialogue_Text = 0;
    global.__Mods_Dialogue_Text[1000][0] = "";
    global.__Mods_Dialogue_Type = 0;
    global.__Mods_Dialogue_Type[1000][0] = "";
    global.__Mods_Question_Text = 0;
    global.__Mods_Question_Text[1000][0] = "";
    global.__Mods_Answer_Text = 0;
    global.__Mods_Answer_Text[1000][0] = "";
    global.__Mods_Quests = 0;
    global.__Mods_Quests[1000][0] = "";
    global.__Mods_SpeakerQuestMax = array_create(1000, undefined);
    global.__Mods_Sprite_Idle = array_create(1000, undefined);
    global.__Mods_Sprite_Move = array_create(1000, undefined);
    global.__Mods_Hello_Text = array_create(1000, "");
    global.__Mods_Speaker_Name = array_create(1000, "");
    global.__Mods_Speaker_Move = array_create(1000, false);
    global.__Mods_Speaker_Array = [];
    global.__Mods_Variable_Self = undefined;
    global.__Mods_Room_To_Load = "";
}

function mods_rebuild_data()
{
    instance_destroy(obj_mods);
    global.Mods_Failed_To_Compile = false;
    instance_create_depth(0, 0, 0, obj_mods);
    gamedata_build_all_weapon_array();
    gamedata_build_possible_mod_dictionary();
    gamedata_build_caliber_lookup();
    gamedata_build_languages();
}

function mods_reload_gamedata()
{
    mods_free_assets();
    gamedata_initialize_and_load();
    mods_rebuild_data();
}

function mods_free_assets()
{
    var _sounds = struct_get_from_hash(global.Mods_Dynamic_Assets, variable_get_hash("sounds"));
    
    for (var _i = 0; _i < array_length(_sounds); _i++)
    {
        if (audio_exists(_sounds[_i]))
            audio_destroy_stream(_sounds[_i]);
    }
    
    global.Mods_Dynamic_Assets.sounds = [];
    var _sprites = struct_get_from_hash(global.Mods_Dynamic_Assets, variable_get_hash("sprites"));
    
    for (var _i = 0; _i < array_length(_sprites); _i++)
    {
        if (sprite_exists(_sprites[_i]))
            sprite_delete(_sprites[_i]);
    }
    
    global.Mods_Dynamic_Assets.sprites = [];
}

function mods_katspeak_throw_error(arg0)
{
    global.__Mods_Context_Current.failed_to_compile = true;
    global.__Mods_Context_Current.compile_error = arg0;
    var _buffer = buffer_create(1, buffer_grow, 1);
    buffer_write(_buffer, buffer_text, "Error");
    buffer_write(_buffer, buffer_text, "\n");
    buffer_write(_buffer, buffer_text, arg0);
    buffer_save(_buffer, "CrashReport_" + string_replace_all(date_date_string(date_current_datetime()), "/", "_") + ".txt");
    buffer_delete(_buffer);
}

function mods_compile()
{
    for (var _i = 0; _i < array_length(global.Mods_Data_Array); _i++)
    {
        var _mod = variable_struct_get(global.Mods_Data, global.Mods_Data_Array[_i]);
        
        try
        {
            global.__Mods_Context_Current = _mod;
            
            if (_mod.enabled && !_mod.compiled)
            {
                _mod.compiled = true;
                _mod.scripts_build();
            }
        }
        catch (_error)
        {
            global.__Mods_Context_Current.failed_to_compile = true;
            global.__Mods_Context_Current.compile_error = _error;
            var _buffer = buffer_create(1, buffer_grow, 1);
            buffer_write(_buffer, buffer_text, "Trace Error");
            buffer_write(_buffer, buffer_text, "\n");
            buffer_write(_buffer, buffer_text, global.Mods_Trace_Error);
            buffer_write(_buffer, buffer_text, "\n\n");
            buffer_write(_buffer, buffer_text, _error);
            buffer_save(_buffer, "CrashReport_" + string_replace_all(date_date_string(date_current_datetime()), "/", "_") + ".txt");
            buffer_delete(_buffer);
        }
    }
    
    global.Mods_Is_Dirty = false;
}

function mods_save_enabled_mods()
{
    db_open("general");
    db_write("mods", "enabled", SnapDeepCopy(global.Mods_Order));
    db_close();
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12
}
