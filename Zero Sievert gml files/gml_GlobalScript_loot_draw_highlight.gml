function loot_draw_highlight(arg0, arg1, arg2, arg3 = undefined, arg4 = undefined, arg5 = undefined, arg6 = 1)
{
    if (!is_struct(arg0))
        exit;
    
    uiGetData().quest_reward_hover = true;
    var _d = arg4;
    loot_draw_precache(arg0);
    gpu_set_fog(true, arg5, 0, 0);
    loot_draw(arg0, arg1 - _d, arg2, arg3, arg4, undefined, arg6);
    loot_draw(arg0, arg1, arg2 - _d, arg3, arg4, undefined, arg6);
    loot_draw(arg0, arg1 + _d, arg2, arg3, arg4, undefined, arg6);
    loot_draw(arg0, arg1, arg2 + _d, arg3, arg4, undefined, arg6);
    gpu_set_fog(false, c_fuchsia, 0, 0);
    loot_draw(arg0, arg1, arg2, arg3, arg4, undefined, arg6);
    gpu_set_fog(true, arg5, 0, 0);
    loot_draw(arg0, arg1, arg2, arg3, arg4, undefined, 0.4 * arg6);
    gpu_set_fog(false, arg5, 0, 0);
}
