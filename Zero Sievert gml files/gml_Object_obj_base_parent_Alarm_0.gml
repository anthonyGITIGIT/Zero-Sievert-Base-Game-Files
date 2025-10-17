for (var i = 0; i < array_length_1d(global.sl_id); i++)
{
    if (slot == global.sl_id[i])
    {
        if (global.sl_base_id[i] != -1)
            id_base = global.sl_base_id[i];
    }
}

if (id_base != -1 && global.sl_free[slot] == 2)
{
    lvl_now = global.base_lvl[id_base];
    
    if (lvl_now != lvl_before)
    {
        lvl_before = lvl_now;
        scr_destroy_base_decor();
        
        switch (id_base)
        {
            case UnknownEnum.Value_2:
                if (lvl_now == 1)
                {
                }
                
                if (lvl_now == 2)
                {
                }
                
                break;
            
            case UnknownEnum.Value_3:
                if (lvl_now == 1)
                    building_deserialize(r_base_bed_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_bed_2, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_4:
                if (lvl_now == 1)
                    building_deserialize(r_base_kitchen_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_kitchen_2, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_1:
                if (lvl_now == 1)
                    building_deserialize(r_base_infirmary_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_infirmary_2, x div 16, y div 16);
                
                if (lvl_now == 3)
                    building_deserialize(r_base_infirmary_3, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_5:
                if (lvl_now == 1)
                    building_deserialize(r_base_recycling_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_recycling_2, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_6:
                if (lvl_now == 1)
                    building_deserialize(r_base_gym_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_gym_2, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_7:
                if (lvl_now == 1)
                    building_deserialize(r_base_shooting_range_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_shooting_range_2, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_8:
                if (lvl_now == 1)
                    building_deserialize(r_base_forge_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_forge_2, x div 16, y div 16);
                
                if (lvl_now == 3)
                    building_deserialize(r_base_forge_3, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_9:
                if (lvl_now == 1)
                    building_deserialize(r_base_general_scavenger_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_general_scavenger_2, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_10:
                if (lvl_now == 1)
                    building_deserialize(r_base_garden_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_garden_2, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_11:
                if (lvl_now == 1)
                    building_deserialize(r_base_ammo_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_ammo_2, x div 16, y div 16);
                
                if (lvl_now == 3)
                    building_deserialize(r_base_ammo_3, x div 16, y div 16);
                
                if (lvl_now == 4)
                    building_deserialize(r_base_ammo_4, x div 16, y div 16);
                
                break;
            
            case UnknownEnum.Value_12:
                if (lvl_now == 1)
                    building_deserialize(r_base_workshop_1, x div 16, y div 16);
                
                if (lvl_now == 2)
                    building_deserialize(r_base_workshop_2, x div 16, y div 16);
                
                break;
        }
    }
}
else
{
    scr_destroy_base_decor();
    lvl_now = 0;
    lvl_before = 0;
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12
}
