function trader_transfer_money(arg0, arg1, arg2)
{
    arg1 = max(0, arg1);
    arg2 = max(0, arg2);
    var _net_value_for_trader = arg2 - arg1;
    global.player_money -= _net_value_for_trader;
    
    if (arg0 == undefined || is_in_hub())
    {
        global.trader_money_all += _net_value_for_trader;
        db_open("general");
        db_write("traders", "money", global.trader_money_all);
        db_close();
        arg0 = global.speaker_nearest;
    }
    else
    {
        arg0.money_trader += _net_value_for_trader;
        db_open("general");
        db_write(global.speaker_nearest.npc_id + "_trader", "money", arg0.money_trader);
        db_close();
    }
    
    stat_add_value("tot_money", arg1);
    faction_add_rep("Player", npc_get_faction(arg0.npc_id), 0.0002 * (arg1 + arg2));
}
