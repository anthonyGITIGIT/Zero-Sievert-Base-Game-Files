function gamedata_trader_calculate_shared_money()
{
    var _max = 50000 * difficulty_get("trade_trader_money") * global.sk_k[UnknownEnum.Value_22];
    global.trader_money_all = db_read_ext("general", "traders", "money", _max);
}

enum UnknownEnum
{
    Value_22 = 22
}
