screenshot_handle();
surface_cache_prune();
achievement_step();

if ((keyboard_check_pressed(vk_escape) || obj_gamepad.input_value[UnknownEnum.Value_13]) && !__uiGlobal().__defaultOnion.HasInputReceiver())
{
    uiGetData().reward_item = undefined;
    
    if (__uiGlobal().__defaultOnion.HasInputReceiver())
        ui_inventory_close_all();
    
    game_pause();
}

for (var i = 0; i < array_length(function_queue_end_step); i++)
    function_queue_end_step[i]();

function_queue_end_step = [];
global.UI_Item_Drag_Skip_Placement_Assignment = false;

if (__uiGlobal().__defaultOnion.HasInputReceiver())
    ui_pda_close();

if (can_pause == false)
    can_pause = true;

enum UnknownEnum
{
    Value_13 = 13
}
