function player_update_weapon_torch()
{
    if (!item_exists(arma_now))
        torch_on_general = false;
    
    var _torch_container = torch_container_array[weapon_slot_now];
    
    if (item_weapon_get_moddable(arma_now))
    {
        struct_get_from_hash(_torch_container.data, variable_get_hash("att_1")).on = false;
        struct_get_from_hash(_torch_container.data, variable_get_hash("att_2")).on = false;
        struct_get_from_hash(_torch_container.data, variable_get_hash("att_3")).on = false;
        struct_get_from_hash(_torch_container.data, variable_get_hash("att_4")).on = false;
    }
    
    if (!is_undefined(arms_holder))
        exit;
    
    if (item_weapon_get_moddable(arma_now))
    {
        player_update_weapon_torch_specific("att_1");
        player_update_weapon_torch_specific("att_2");
        player_update_weapon_torch_specific("att_3");
        player_update_weapon_torch_specific("att_4");
    }
    
    if (struct_get_from_hash(_torch_container.data, variable_get_hash("att_1")).have)
        struct_get_from_hash(_torch_container.data, variable_get_hash("att_1")).on = torch_on_general;
    
    if (struct_get_from_hash(_torch_container.data, variable_get_hash("att_2")).have)
        struct_get_from_hash(_torch_container.data, variable_get_hash("att_2")).on = torch_on_general;
    
    if (struct_get_from_hash(_torch_container.data, variable_get_hash("att_3")).have)
        struct_get_from_hash(_torch_container.data, variable_get_hash("att_3")).on = torch_on_general;
    
    if (struct_get_from_hash(_torch_container.data, variable_get_hash("att_4")).have)
        struct_get_from_hash(_torch_container.data, variable_get_hash("att_4")).on = torch_on_general;
}
