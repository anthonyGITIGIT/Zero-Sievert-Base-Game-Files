function quest_log_remove(arg0)
{
    var _true_index = __quest_log_get_true_index(arg0);
    
    if (_true_index == undefined)
        exit;
    
    if (!quest_log_get_removable(arg0))
    {
        scr_draw_text_with_box("You cannot remove this quest");
        exit;
    }
    
    if (!is_in_hub())
    {
        scr_draw_text_with_box("You can only remove quests in the bunker");
        exit;
    }
    
    global.quest_state[_true_index] = new class_quest_state();
    item_tracking_reset();
    uiFind(__uiRootStackTop(), "pda frame").ReplaceFromFile("ZS_vanilla/ui/pda_quest.ui");
}
