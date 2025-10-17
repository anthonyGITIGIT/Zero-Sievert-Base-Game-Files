function scr_save_rep()
{
    db_open("general");
    
    for (var i = 0; i < 10; i++)
    {
        for (var j = 0; j < 10; j++)
            db_write("faction", "rep_" + string(i) + "_" + string(j), ds_grid_get(global.grid_faction, i, j));
    }
    
    db_write("faction", "joined", faction_joined);
    db_close();
}
