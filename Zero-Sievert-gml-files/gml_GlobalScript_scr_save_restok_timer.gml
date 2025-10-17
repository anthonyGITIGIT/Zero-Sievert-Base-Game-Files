function scr_save_restok_timer()
{
    db_open("general");
    db_write("Trader restok", "trader_restok_timer", global.trader_restok_timer);
    db_close();
}
