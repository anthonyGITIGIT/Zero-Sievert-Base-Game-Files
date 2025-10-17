function ui_stash_unlocked(arg0)
{
    if (arg0 < global.storage_slot_unlocked)
        return true;
    
    return false;
}
