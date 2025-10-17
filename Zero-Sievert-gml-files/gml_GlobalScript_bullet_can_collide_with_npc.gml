function bullet_can_collide_with_npc(arg0, arg1)
{
    if (!instance_exists(arg1))
        return false;
    
    if (arg1.can_be_damaged)
    {
        if (arg0.shooter_faction != arg1.faction || arg0.shooter_faction == "All Enemy")
        {
            if (arg0.shooter_id != arg1.id)
                return true;
        }
    }
    
    return false;
}
