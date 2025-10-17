function crafting_go_to_modding(arg0)
{
    if (arg0 == undefined)
        exit;
    
    with (uiGetData())
    {
        modding_loot = arg0;
        modding_mod_pos = undefined;
    }
    
    if (__uiGlobal().__defaultOnion.LayerExists("modding layer"))
        __uiGlobal().__defaultOnion.LayerDelete("modding layer");
    
    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/modding.ui", "modding layer");
}
