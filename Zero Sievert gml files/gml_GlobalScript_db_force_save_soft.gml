function db_force_save_soft(arg0)
{
    with (obj_controller)
    {
        db_force_save_soft_needs_save = true;
        array_push_unique(db_force_save_soft_list, arg0);
    }
}
