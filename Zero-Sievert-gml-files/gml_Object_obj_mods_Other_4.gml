if (global.__Mods_Room_To_Load != "" && room == r_mod_empty)
{
    variable_struct_get(global.Mods_Rooms, global.__Mods_Room_To_Load)();
    global.__Mods_Room_To_Load = "";
}
