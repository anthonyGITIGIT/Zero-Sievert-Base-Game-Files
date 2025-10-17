if (!instance_exists(obj_editor))
    uiGetData().quickmove_menu_wasopen--;

if (!instance_exists(obj_editor) && player_exists_local())
{
    with (player_get_local())
    {
        global.status_state_now[UnknownEnum.Value_0] = scr_get_status_state(UnknownEnum.Value_0, fatigue);
        global.status_state_now[UnknownEnum.Value_1] = scr_get_status_state(UnknownEnum.Value_1, energy);
        global.status_state_now[UnknownEnum.Value_2] = scr_get_status_state(UnknownEnum.Value_1, thirst);
        global.status_state_now[UnknownEnum.Value_3] = scr_get_status_state(UnknownEnum.Value_3, radiation_accumulata);
        ds_list_clear(global.list_status_id);
        
        for (var i = 0; i < array_length(global.status_id); i++)
            ds_list_add(global.list_status_id, i);
        
        lista_skill_factor();
        var oo = UnknownEnum.Value_0;
        
        switch (global.status_state_now[oo])
        {
            case UnknownEnum.Value_0:
                break;
            
            case UnknownEnum.Value_1:
                break;
            
            case UnknownEnum.Value_2:
                global.sk_k[UnknownEnum.Value_6] += global.status_f1[oo][UnknownEnum.Value_2] * global.sk_k[UnknownEnum.Value_73];
                break;
            
            case UnknownEnum.Value_3:
                global.sk_k[UnknownEnum.Value_6] += global.status_f1[oo][UnknownEnum.Value_3] * global.sk_k[UnknownEnum.Value_73];
                break;
            
            case UnknownEnum.Value_4:
                global.sk_k[UnknownEnum.Value_6] += global.status_f1[oo][UnknownEnum.Value_4] * global.sk_k[UnknownEnum.Value_73];
                break;
        }
        
        oo = UnknownEnum.Value_1;
        
        switch (global.status_state_now[oo])
        {
            case UnknownEnum.Value_0:
                global.sk_k[UnknownEnum.Value_1] += global.status_f1[oo][UnknownEnum.Value_0] * global.sk_k[UnknownEnum.Value_72];
                break;
            
            case UnknownEnum.Value_1:
                break;
            
            case UnknownEnum.Value_2:
                global.sk_k[UnknownEnum.Value_1] += global.status_f1[oo][UnknownEnum.Value_2] * global.sk_k[UnknownEnum.Value_73];
                break;
            
            case UnknownEnum.Value_3:
                global.sk_k[UnknownEnum.Value_1] += global.status_f1[oo][UnknownEnum.Value_3] * global.sk_k[UnknownEnum.Value_73];
                break;
            
            case UnknownEnum.Value_4:
                global.sk_k[UnknownEnum.Value_1] += global.status_f1[oo][UnknownEnum.Value_4] * global.sk_k[UnknownEnum.Value_73];
                break;
        }
        
        oo = UnknownEnum.Value_2;
        
        switch (global.status_state_now[oo])
        {
            case UnknownEnum.Value_0:
                global.sk_k[UnknownEnum.Value_7] += global.status_f1[oo][UnknownEnum.Value_0] * global.sk_k[UnknownEnum.Value_72];
                break;
            
            case UnknownEnum.Value_1:
                break;
            
            case UnknownEnum.Value_2:
                global.sk_k[UnknownEnum.Value_7] += global.status_f1[oo][UnknownEnum.Value_2] * global.sk_k[UnknownEnum.Value_73];
                break;
            
            case UnknownEnum.Value_3:
                global.sk_k[UnknownEnum.Value_7] += global.status_f1[oo][UnknownEnum.Value_3] * global.sk_k[UnknownEnum.Value_73];
                break;
            
            case UnknownEnum.Value_4:
                global.sk_k[UnknownEnum.Value_7] += global.status_f1[oo][UnknownEnum.Value_4] * global.sk_k[UnknownEnum.Value_73];
                break;
        }
        
        oo = UnknownEnum.Value_3;
        var chance_bleed = 0.027777777777777776;
        var chance_vomito = 0.009259259259259259;
        var chance_dead = 0.002777777777777778;
        
        switch (global.status_state_now[oo])
        {
            case UnknownEnum.Value_0:
                break;
            
            case UnknownEnum.Value_1:
                break;
            
            case UnknownEnum.Value_2:
                if (scr_chance(chance_bleed))
                {
                    bleed += 1;
                    scr_draw_npc_text(id, UnknownEnum.Value_36);
                }
                
                break;
            
            case UnknownEnum.Value_3:
                if (scr_chance(chance_bleed * 1.5))
                {
                    bleed += 1;
                    scr_draw_npc_text(id, UnknownEnum.Value_36);
                }
                
                if (scr_chance(chance_vomito))
                {
                    energy -= 25;
                    thirst -= 35;
                    scr_draw_npc_text(id, UnknownEnum.Value_35);
                }
                
                break;
            
            case UnknownEnum.Value_4:
                if (scr_chance(chance_bleed * 2))
                    bleed += 1;
                
                if (scr_chance(chance_vomito * 1.5))
                {
                    energy -= 25;
                    thirst -= 35;
                    scr_draw_npc_text(id, UnknownEnum.Value_35);
                }
                
                if (scr_chance(chance_dead))
                {
                    if (is_in_raid())
                        player_damage_local(infinity);
                }
                
                break;
        }
        
        if (player_local_state_is(scr_player_state_move))
        {
            check_max_weight_timer++;
            
            if (check_max_weight_timer >= 30)
            {
                check_max_weight_timer = 0;
                inventory_check_weight();
            }
        }
        else
        {
            check_max_weight_timer = 28;
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6,
    Value_7,
    Value_35 = 35,
    Value_36,
    Value_72 = 72,
    Value_73
}
