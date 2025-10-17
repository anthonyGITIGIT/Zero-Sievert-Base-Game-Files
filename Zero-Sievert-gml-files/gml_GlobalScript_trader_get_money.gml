function trader_get_money(arg0)
{
    var _struct = variable_struct_get(global.trader_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Trader \"", arg0, "\" not recognised");
    
    var _value = _struct.money;
    
    if (_value == "{shared}")
        _value = db_read_ext("general", "traders", "money", 50000 * difficulty_get("trade_trader_money"));
    
    return _value;
}
