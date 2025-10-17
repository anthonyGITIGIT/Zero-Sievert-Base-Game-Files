function scr_gamepad_scripts_quickslot3()
{
    with (player_get_local())
    {
        inventory_use_quick_slot("quick slot 3");
        global.last_quick_slot_pressed = "quick slot 3";
    }
}
