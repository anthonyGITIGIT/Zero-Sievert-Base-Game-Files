function time_restock_traders()
{
    with (obj_controller)
    {
        db_open("general");
        global.trader_money_all = 50000 * difficulty_get("trade_trader_money") * global.sk_k[UnknownEnum.Value_22];
        db_write("traders", "money", global.trader_money_all);
        var _struct = npc_get_full_struct();
        var _names = variable_struct_get_names(_struct);
        var _i = 0;
        
        repeat (array_length(_names))
        {
            db_section_delete(_names[_i] + "_trader");
            _i++;
        }
        
        db_section_delete("Module preso");
        db_close();
        
        if (is_in_hub())
        {
            db_open("general");
            db_write("quest", "daily generated", false);
            db_close();
            global.daily_quest_generated = false;
            generate_dailies();
            quest_line_update(true);
            
            with (obj_npc_parent)
            {
                alarm[10] = 1;
                alarm[11] = 1;
                gamedata_trader_calculate_shared_money();
                lista_quest();
                lista_text();
            }
            
            with (obj_base_parent)
                alarm[1] = 1;
        }
        else
        {
            db_open("general");
            db_write("restock", "force", true);
            db_close();
        }
    }
}

enum UnknownEnum
{
    Value_22 = 22
}
