function hotfix_move_npc_to_pre_raid()
{
    var _move_npc_section = false;
    db_open("general");
    var _npc_section;
    
    if (db_section_exists("NPC"))
    {
        _move_npc_section = true;
        trace("Legacy (0.31.16) NPC section found in \"general\" db, moving to \"pre_raid\"");
        _npc_section = db_section_read("NPC");
        db_section_delete("NPC");
    }
    
    db_close();
    
    if (_move_npc_section)
    {
        db_open("pre_raid");
        db_section_write("NPC", _npc_section);
        db_close(true);
    }
}
