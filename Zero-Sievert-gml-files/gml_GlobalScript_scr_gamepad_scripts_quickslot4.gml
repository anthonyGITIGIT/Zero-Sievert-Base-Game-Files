function scr_gamepad_scripts_quickslot4()
{
    with (player_get_local())
    {
        inventory_use_quick_slot("quick slot 4");
        global.last_quick_slot_pressed = "quick slot 4";
    }
}
