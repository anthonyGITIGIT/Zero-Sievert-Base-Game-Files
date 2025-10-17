function ui_pda_close()
{
    if (global.ui_close_flag)
        __uiGlobal().__defaultOnion.Clear();
    
    global.ui_close_flag = false;
}
