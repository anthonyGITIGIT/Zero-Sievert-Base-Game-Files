function player_update_weapon_laser()
{
    if (!item_exists(arma_now))
        laser_on_general = false;
    
    var _laser_container = laser_container_array[weapon_slot_now];
    
    if (item_weapon_get_moddable(arma_now))
    {
        struct_get_from_hash(_laser_container.data, variable_get_hash("att_1")).on = false;
        struct_get_from_hash(_laser_container.data, variable_get_hash("att_2")).on = false;
        struct_get_from_hash(_laser_container.data, variable_get_hash("att_3")).on = false;
        struct_get_from_hash(_laser_container.data, variable_get_hash("att_4")).on = false;
    }
    
    if (item_weapon_get_moddable(arma_now))
    {
        player_update_weapon_laser_specific("att_1");
        player_update_weapon_laser_specific("att_2");
        player_update_weapon_laser_specific("att_3");
        player_update_weapon_laser_specific("att_4");
    }
    
    if (struct_get_from_hash(_laser_container.data, variable_get_hash("att_1")).have)
        struct_get_from_hash(_laser_container.data, variable_get_hash("att_1")).on = laser_on_general;
    
    if (struct_get_from_hash(_laser_container.data, variable_get_hash("att_2")).have)
        struct_get_from_hash(_laser_container.data, variable_get_hash("att_2")).on = laser_on_general;
    
    if (struct_get_from_hash(_laser_container.data, variable_get_hash("att_3")).have)
        struct_get_from_hash(_laser_container.data, variable_get_hash("att_3")).on = laser_on_general;
    
    if (struct_get_from_hash(_laser_container.data, variable_get_hash("att_4")).have)
        struct_get_from_hash(_laser_container.data, variable_get_hash("att_4")).on = laser_on_general;
}
