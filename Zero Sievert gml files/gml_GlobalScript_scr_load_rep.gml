function scr_load_rep()
{
    db_open("general");
    
    for (var i = 0; i < 10; i++)
    {
        for (var j = 0; j < 10; j++)
            ds_grid_set(global.grid_faction, i, j, db_read("faction", "rep_" + string(i) + "_" + string(j), 0));
    }
    
    faction_joined = db_read("faction", "joined", -1);
    db_close();
}
