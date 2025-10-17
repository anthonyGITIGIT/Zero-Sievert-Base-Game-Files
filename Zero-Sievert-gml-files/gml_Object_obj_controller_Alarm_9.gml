alarm[9] = 200;

if (db_force_save_soft_needs_save)
{
    var _count = array_length(db_force_save_soft_list);
    
    for (var i = 0; i < _count; i++)
    {
        db_force_save(db_force_save_soft_list[i]);
        show_debug_message("Slow saved: " + string(db_force_save_soft_list[i]));
    }
    
    db_force_save_soft_needs_save = false;
    db_force_save_soft_list = [];
}
