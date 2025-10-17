db_open("raid");
db_write("Map", "Map id", UnknownEnum.Value_10);
db_close();
db_open(inventory_target_db());
var _loadout = db_read("loadout", "id", 0);
db_close();
inventory_handle_pre_raid_backup(true);
inventory_set_target_db_to_raid();
db_open(inventory_target_db());
db_write("loadout", "id", _loadout);
db_close();
room_goto(room1);

enum UnknownEnum
{
    Value_10 = 10
}
