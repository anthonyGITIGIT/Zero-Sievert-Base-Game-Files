function __uiInitEnvironment()
{
    with (__uiGlobal().__catspeakEnv)
    {
        applyPreset(UnknownEnum.Value_0);
        removeKeyword("function");
        removeKeyword("use");
        addKeyword("fn", UnknownEnum.Value_48);
        addKeyword("build", UnknownEnum.Value_46);
        addConstant("data", __uiGlobal().__dataStruct);
    }
    
    uiAddFunction("UiUsingMouse", function()
    {
        return !!obj_gamepad.last_input_keyboard;
    });
    uiAddFunction("UiUsingGamepad", function()
    {
        return !obj_gamepad.last_input_keyboard;
    });
    uiAddFunction("FocusMe", function()
    {
        uiInputPointer(self, self.Get("x"), self.Get("y"));
    });
    uiAddFunction("DirectionalOverride", function(arg0, arg1)
    {
        __directionalOverride[round(arg0 / 90)] = arg1;
    });
    uiAddFunction("Onion", uiOnionCurrent);
    uiAddFunction("OnionLayer", uiOnionCurrentLayer);
    uiAddFunction("OnionLayerIsTop", uiOnionCurrentLayerIsTop);
    uiAddFunction("OnionLayerAddTop", function(arg0, arg1 = undefined)
    {
        uiOnionCurrent().LayerAddTop(arg0, arg1);
    });
    uiAddFunction("OnionLayerDelete", function(arg0 = uiOnionCurrentLayer())
    {
        var _current = uiOnionCurrent();
        
        if (!is_undefined(_current))
            _current.LayerDelete(arg0);
    });
    uiAddFunction("OnionLayerSensitivity", function(arg0, arg1)
    {
        uiOnionCurrent().LayerSensitivity(arg0, arg1);
    });
    uiAddFunction("OnionLayerDeleteCurrent", function()
    {
        uiOnionCurrent().LayerDelete(uiOnionCurrentLayer());
    });
    uiAddFunction("OnionFind", function(arg0, arg1)
    {
        return uiFindRelaxed(uiOnionCurrent().GetStruct(arg0), arg1);
    });
    uiAddFunction("Tooltip", function(arg0, arg1)
    {
        var _current = uiOnionCurrent();
        
        if (!is_undefined(_current))
            _current.TooltipEnsureOver(arg0, arg1, uiOnionCurrentLayer());
    });
    uiAddFunction("UiDebugShowPointer", uiDebugShowPointer);
    uiAddFunction("UiDebugShowSkeleton", uiDebugShowSkeleton);
    uiAddFunction("UiDebugRelaxedSprites", uiDebugRelaxedSprites);
    uiAddFunction("UiDebugShowNavigation", uiDebugShowNavigation);
    uiAddFunction("UiDebugShowFreeNav", uiDebugShowFreeNav);
    uiAddFunction("UiModAuthorIDIsValid", function(arg0)
    {
        var _folder_path = ugc_get_folder() + "\\" + arg0;
        var _meta_file = _folder_path + "\\" + "meta.ini";
        
        if (file_exists(_meta_file))
        {
            ini_open(_meta_file);
            var _user_id = ini_read_real("leave blank", "author_id", steam_get_user_account_id());
            ini_close();
            return _user_id == steam_get_user_account_id();
        }
        else
        {
            return true;
        }
    });
    uiAddFunction("UiActionToKeyboardString", UiActionToKeyboardString);
    uiAddFunction("UiGunTypeToHumanString", UiGunTypeToHumanString);
    uiAddFunction("UiMouseCheckButtonPressed", UiMouseCheckButtonPressed);
    uiAddFunction("UiMouseOverContext", UiMouseOverContext);
    uiAddFunction("UiGamepadBackPressed", UiGamepadBackPressed);
    uiAddFunction("UiGamepadBackReleased", UiGamepadBackReleased);
    uiAddFunction("UiSkillsMasteryPipCount", UiSkillsMasteryPipCount);
    uiAddFunction("UiSkillsMasteryPipHasSkills", UiSkillsMasteryPipHasSkills);
    uiAddFunction("UiSkillsMasteryPipColour", UiSkillsMasteryPipColour);
    uiAddFunction("UiSkillsMasteryArrayIDs", UiSkillsMasteryArrayIDs);
    uiAddFunction("UiSkillsMasteryArrayIcons", UiSkillsMasteryArrayIcons);
    uiAddFunction("UiSkillsMasteryPipSelectedSkillID", UiSkillsMasteryPipSelectedSkillID);
    uiAddFunction("UiSkillsNameFromID", UiSkillsNameFromID);
    uiAddFunction("UiSkillsDescFromID", UiSkillsDescFromID);
    uiAddFunction("UiSkillsIconFromID", UiSkillsIconFromID);
    uiAddFunction("UiSkillsColourFromID", UiSkillsColourFromID);
    uiAddFunction("UiSkillsCanSelect", UiSkillsCanSelect);
    uiAddFunction("UiSkillsReturnPlacement", UiSkillsReturnPlacement);
    uiAddFunction("UiSkillsAssign", UiSkillsAssign);
    uiAddFunction("UiSkillsReset", UiSkillsReset);
    uiAddFunction("UiSkillsDisplayAllOn", UiSkillsDisplayAllOn);
    uiAddFunction("UiSkillsGunTypeMasteryName", UiSkillsGunTypeMasteryName);
    uiAddFunction("UiSkillsGunTypeMasteryDesc", UiSkillsGunTypeMasteryDesc);
    uiAddFunction("UiSkillsGunTypeMasteryColour", UiSkillsGunTypeMasteryColour);
    uiAddFunction("LanguageDataGetNames", function()
    {
        return variable_struct_get_names(struct_get_from_hash(global.language_data, variable_get_hash("languages")));
    });
    uiAddFunction("LanguageGetData", function(arg0)
    {
        return variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), arg0);
    });
    uiAddFunction("FileExecute", uiFileExecute);
    uiAddFunction("UiStringClip", string_clip);
    uiAddFunction("CallInherited", uiCallInherited);
    uiAddFunction("UiReplace", function(arg0, arg1)
    {
        uiFind(__uiRootStackTop(), arg0).ReplaceFromFile(arg1);
    });
    uiAddFunction("UiOpen", function(arg0)
    {
        __uiGlobal().__defaultOnion.LayerAddTop(arg0);
    });
    uiAddFunction("UiClick", __uiInputButtonClick);
    uiAddFunction("UiConsume", function(arg0)
    {
        uiInputButtonConsume(__uiRootStackTop(), arg0);
    });
    uiAddFunction("DebugBreak", uiDebugBreak);
    uiAddFunction("DebugLog", __uiTrace);
    uiAddFunction("GetPointerX", uiPointerGetX);
    uiAddFunction("GetPointerY", uiPointerGetY);
    uiAddFunction("GetPointerStartX", uiPointerGetStartX);
    uiAddFunction("GetPointerStartY", uiPointerGetStartY);
    uiAddFunction("GetCaptureLocalX", uiPointerGetCaptureX);
    uiAddFunction("GetCaptureLocalY", uiPointerGetCaptureY);
    uiAddFunction("UiFind", function(arg0)
    {
        return uiFind(__uiRootStackTop(), arg0);
    });
    uiAddFunction("UiFindRelaxed", function(arg0)
    {
        return uiFindRelaxed(__uiRootStackTop(), arg0, true);
    });
    uiAddFunction("UiAddBoxType", uiAddBoxType);
    uiAddFunction("UiModGetCount", UiModGetCount);
    uiAddFunction("UiModMapIDtoOrder", UiModMapIDtoOrder);
    uiAddFunction("UiModGetSingleName", UiModGetSingleName);
    uiAddFunction("UiModGetSingleFolder", UiModGetSingleFolder);
    uiAddFunction("UiModGetSingleDescription", UiModGetSingleDescription);
    uiAddFunction("UiModGetSingleCreatorHashed", UiModGetSingleCreatorHashed);
    uiAddFunction("UiNewsCount", UiNewsCount);
    uiAddFunction("UiNewsDisplay", UiNewsDisplay);
    uiAddFunction("UiNewsGetName", UiNewsGetName);
    uiAddFunction("UiNewsGetDesc", UiNewsGetDesc);
    uiAddFunction("UiNewsGetDate", UiNewsGetDate);
    uiAddFunction("UiModGetSingleCreatorName", UiModGetSingleCreatorName);
    uiAddFunction("UiModSetSingleCreatorIsMe", UiModGetSingleCreatorIsMe);
    uiAddFunction("UiModGetSingleVersion", UiModGetSingleVersion);
    uiAddFunction("UiModGetSingleVersionGame", UiModGetSingleVersionGame);
    uiAddFunction("UiModGetSingleVersionModdingSystem", UiModGetSingleVersionModdingSystem);
    uiAddFunction("UiModGetSingleOn", UiModGetSingleOn);
    uiAddFunction("UiModGetSubHeader", UiModGetSubHeader);
    uiAddFunction("UiModGetSubHeaderColour", UiModGetSubHeaderColour);
    uiAddFunction("UiModGetAnyDirty", UiModGetAnyDirty);
    uiAddFunction("UiModSetSingleOrder", UiModSetSingleOrder);
    uiAddFunction("UiModSetSingleOrderUp", UiModSetSingleOrderUp);
    uiAddFunction("UiModSetSingleOrderDown", UiModSetSingleOrderDown);
    uiAddFunction("UiModSetSingleToggle", UiModSetSingleToggle);
    uiAddFunction("UiModCloseUploadWindow", UiModCloseUploadWindow);
    uiAddFunction("UiModOpenWorkshop", UiModOpenWorkshop);
    uiAddFunction("UiModRefresh", UiModRefresh);
    uiAddFunction("UiModDelete", UiModDelete);
}

enum UnknownEnum
{
    Value_0,
    Value_46 = 46,
    Value_48 = 48
}
