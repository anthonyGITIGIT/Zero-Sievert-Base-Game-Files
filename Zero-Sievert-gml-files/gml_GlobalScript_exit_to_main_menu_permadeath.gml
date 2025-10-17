function exit_to_main_menu_permadeath()
{
    db_file_delete("shared");
    __uiGlobal().__defaultOnion.Clear();
    room_goto(r_menu);
}
