/// Decompiler warnings:
// gml_Script_ui_initialize_functions: Data left over on VM stack at end of fragment (512 elements).

global.Ui_Equipment_Selected = "";
global.Ui_TraderPage_Selected = 0;

function ui_initialize_functions()
{
    uiAddFunction("Min", function(arg0, arg1)
    {
        return min(arg0, arg1);
    });
    uiAddFunction("Max", function(arg0, arg1)
    {
        return max(arg0, arg1);
    });
    uiAddFunction("Clamp", function(arg0, arg1, arg2)
    {
        return clamp(arg0, arg1, arg2);
    });
    uiAddFunction("Lerp", function(arg0, arg1, arg2)
    {
        return lerp(arg0, arg1, arg2);
    });
    uiAddFunction("Clamp", function(arg0, arg1, arg2)
    {
        return clamp(arg0, arg1, arg2);
    });
    uiAddFunction("Lerp", function(arg0, arg1, arg2)
    {
        return lerp(arg0, arg1, arg2);
    });
    uiAddFunction("DrawSprite", function(arg0, arg1, arg2, arg3)
    {
        draw_sprite(arg0, arg1, arg2, arg3);
    });
    uiAddFunction("DrawSpriteExt", function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    {
        draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    });
    uiAddFunction("DrawSpriteStretched", function(arg0, arg1, arg2, arg3, arg4, arg5)
    {
        draw_sprite_stretched(arg0, arg1, arg2, arg3, arg4, arg5);
    });
    uiAddFunction("DrawSpriteStretchedExt", function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    {
        draw_sprite_stretched_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    });
    uiAddNativeFunction(floor, "Floor");
    uiAddNativeFunction(ceil, "Ceil");
    uiAddNativeFunction(round, "Round");
    uiAddNativeFunction(abs, "Abs");
    uiAddNativeFunction(sign, "Sign");
    uiAddNativeFunction(string, "String");
    uiAddNativeFunction(string_format, "StringFormat");
    uiAddNativeFunction(string_replace_all, "StringReplaceAll");
    uiAddNativeFunction(is_struct, "IsStruct");
    uiAddNativeFunction(is_array, "IsArray");
    uiAddNativeFunction(is_string, "IsString");
    uiAddNativeFunction(is_numeric, "IsNumeric");
    uiAddNativeFunction(array_length, "ArrayLength");
    uiAddNativeFunction(array_sort, "ArraySort");
    uiAddNativeFunction(array_push, "ArrayPush");
    uiAddNativeFunction(array_pop, "ArrayPop");
    uiAddNativeFunction(array_insert, "ArrayInsert");
    uiAddNativeFunction(array_delete, "ArrayDelete");
    uiAddNativeFunction(draw_rectangle, "DrawRectangle");
    uiAddNativeFunction(draw_circle, "DrawCircle");
    uiAddNativeFunction(draw_text, "DrawText");
    uiAddNativeFunction(draw_text_ext, "DrawTextExt");
    uiAddNativeFunction(file_exists, "FileExists");
    uiAddNativeFunction(string_width, "StringWidth");
    uiCatspeakGetEnvironment().addGlobalFunction("HasEyeForValueSkill", function()
    {
        return skill_hunter_obtained("eyeforvalue");
    }, "DrawSetFontLanguage", draw_set_font_language, "LanguageResolveFont", language_resolve_font, "EquipmentGetName", function(arg0)
    {
        return struct_get_from_hash(variable_struct_get(global.loadout_data, arg0), variable_get_hash("name"));
    }, "EquipmentNameSelected", function()
    {
        return global.Ui_Equipment_Selected;
    });
    uiCatspeakGetEnvironment().addGlobalFunction("LootActionGetArray", loot_action_get_array, "LootActionExecute", loot_action_execute, "LootActionScrapNow", loot_action_scrap_now, "LootActionGetYOffset", loot_action_get_y_offset, "LootDraw", loot_draw, "LootGetItem", loot_get_item, "LootGetName", loot_get_name, "LootGetDescription", loot_get_description, "LootGetWeight", loot_get_weight, "LootGetValue", loot_get_value, "LootGetValuePerUnit", loot_get_value_per_unit, "LootGetValueSell", loot_get_value_sell, "LootGetValueSellPerUnit", loot_get_value_sell_per_unit, "LootGetValueDiffMultiplier", loot_get_value_diff_multiplier, "LootGetValuePerUnitDiffMultiplier", loot_get_value_per_unit_diff_multiplier, "LootGetSeen", loot_get_seen, "LootGetDurability", loot_get_durability, "LootGetCategory", loot_get_category, "LootIsTraders", loot_is_traders, "LootWeaponGetFireMode", loot_weapon_get_fire_mode, "LootWeaponGetRateOfFire", loot_weapon_get_rate_of_fire, "LootWeaponGetFireModeName", loot_weapon_get_fire_mode_name, "LootWeaponGetMagazine", loot_weapon_get_magazine, "LootWeaponGetCaliber", loot_weapon_get_caliber, "LootWeaponGetCaliberName", loot_weapon_get_caliber_name, "LootWeaponGetDamage", loot_weapon_get_damage, "LootWeaponGetAccuracy", loot_weapon_get_accuracy, "LootWeaponGetRecoil", loot_weapon_get_recoil, "LootWeaponGetErgonomics", loot_weapon_get_ergonomics, "LootWeaponGetReloadTime", loot_weapon_get_reload_time, "LootWeaponGetModdable", loot_weapon_get_moddable, "LootWeaponGetModPosModdable", loot_weapon_get_position_moddable, "LootWeaponGetMod", loot_weapon_get_mod, "LootWeaponGetType", loot_weapon_get_type, "LootWeaponModRemove", loot_weapon_mod_remove, "LootWeaponModAdd", loot_weapon_mod_add, "LootArmorGetMelee", loot_armor_get_pierce, "LootArmorGetRadiation", loot_armor_get_radiation, "LootArmorGetAnomaly", loot_armor_get_anomaly, "LootArmorGetFirearm", loot_armor_get_firearm, "LootArmorGetFragility", loot_armor_get_dur_damage, "LootArmorGetClass", loot_armor_get_class, "LootBackpackGetWeight", loot_backpack_get_weight, "LootBackpackGetMovementSpeed", loot_backpack_get_movement_speed, "LootBackpackGetErgonomics", loot_backpack_get_ergonomic, "LootAmmoGetPenetration", loot_ammo_get_pen, "LootAmmoGetDamageBoost", loot_ammo_get_damage, "LootAmmoGetAccuracyBoost", loot_ammo_get_acc, "LootAmmoGetRecoilBoost", loot_ammo_get_recoil, "LootAmmoGetBurnDuration", loot_ammo_get_dur, "LootMedGetDuration", loot_med_get_duration, "LootMedGetDurationSeconds", loot_med_get_duration_seconds, "LootMedGetCanMove", loot_med_get_can_move, "LootMedGetSpeedMultiplier", loot_med_get_speed_multiplier, "LootMedGetHealth", loot_med_get_hp, "LootMedGetBleed", loot_med_get_bleed, "LootMedGetWound", loot_med_get_wound, "LootMedGetRadiation", loot_med_get_radiation, "LootConsumableGetHunger", loot_consumable_get_energy, "LootConsumableGetThirst", loot_consumable_get_thirst, "LootConsumableGetFatigue", loot_consumable_get_fatigue, "LootConsumableGetRadiation", loot_consumable_get_radiation, "LootInjectorGetDuration", loot_injector_get_duration, "LootInjectorGetDurationSeconds", loot_injector_get_duration_seconds, "LootInjectorGetMaxHP", loot_injector_get_max_hp, "LootInjectorGetHPRegen", loot_injector_get_hp_regen, "LootInjectorGetBleedRec", loot_injector_get_bleed_rec, "LootInjectorGetBleedImmune", loot_injector_get_bleed_immune, "LootInjectorGetStaminaMax", loot_injector_get_stamina_max, "LootInjectorGetStaminaRegen", loot_injector_get_stamina_regen, "LootInjectorGetMaxWeight", loot_injector_get_max_weight, "LootInjectorGetRadRegen", loot_injector_get_rad_regen, "LootInjectorGetRadDefence", loot_injector_get_rad_defence, "LootInjectorGetHunger", loot_injector_get_hunger, "LootInjectorGetHungerRegen", loot_injector_get_hunger_regen, "LootInjectorGetThirst", loot_injector_get_thirst, "LootInjectorGetThirstRegen", loot_injector_get_thirst_regen, "LootRepairGetMinDur", loot_repair_get_min_dur, "LootRepairGetMaxDur", loot_repair_get_max_dur, "LootRepairGetGain", loot_repair_get_gain, "LootRepairGetArmorClass", loot_repair_get_armor_class, "LootRepairGetCaliberCount", loot_repair_get_caliber_count, "LootRepairGetCaliber", loot_repair_get_caliber, "CaliberGetName", caliber_get_name, "LootModGetType", loot_mod_get_type, "LootModGetRecoil", loot_mod_get_recoil, "LootModGetErgonomics", loot_mod_get_ergo, "LootModGetAccuracy", loot_mod_get_acc, "LootModGetDamage", loot_mod_get_damage, "LootModGetReloadSpeed", loot_mod_get_reload_speed, "LootModGetMagazineSize", loot_mod_get_magazine_size, "LootModGetHandguardPosExists", loot_mod_handguard_pos_exists, "LootModGetWeaponAll", loot_mod_get_weapon_all, "LootModGetWeaponString", loot_mod_get_weapon_string, "LootModGetWeaponCount", loot_mod_get_weapon_count, "LootModGetWeapon", loot_mod_get_weapon, "LootModGetScopeViewDistance", loot_mod_get_scope_view_distance, "LootModGetScopeEffRange", loot_mod_get_scope_eff_range, "LootGrenadeGetThrowType", loot_grenade_get_throw_type, "LootGrenadeGetDetonationType", loot_grenade_get_detonation_type, "LootGrenadeGetRadiusMinDamage", loot_grenade_get_radius_min_damage, "LootGrenadeGetDamageMax", loot_grenade_get_damage_max, "ItemGetName", item_get_name, "DialogueLogicCCSpokeAfterPortQuest", dialogue_logic_cc_spoke_after_port_quest, "DialogueLogicSpokeWithArtemovichAfterTookEyes", dialogue_logic_spoke_with_artemovich_after_took_eyes, "DialogueLogicGivePrologueLetterToBarman", dialogue_logic_give_prologue_letter_to_barman, "WeatherGetTemperatureNowUi", weather_get_temperature_now_ui, "WeatherGetIconUi", weather_get_icon_ui, "WeatherGetIconUiCurrentMap", weather_get_icon_ui_current_map, "WeatherGetKitBuilt", weather_get_kit_built, "PrologueIsDone", prologue_is_done);
}
