db_open("general");
prologue = db_read("prologue", "play", false);
prologue_map_done = db_read("prologue", "map_done", false);
db_close();

if (prologue && !prologue_map_done)
    alarm[0] = 30;
else
    instance_destroy();
