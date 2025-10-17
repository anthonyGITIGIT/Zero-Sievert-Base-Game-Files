db_open("general");
preso = db_read("Module preso", "slot_" + string(slot), false);
db_close();
