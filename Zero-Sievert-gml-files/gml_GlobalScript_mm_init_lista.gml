function mm_init_lista()
{
    static _first_run = true;
    
    if (!_first_run)
    {
        trace("Destroying old lists");
        ds_list_destroy(global.lista_repair_id);
        ds_list_destroy(global.lista_repair_dur);
        ds_list_destroy(global.lista_repair_qnt);
        ds_list_destroy(global.lista_mod_id);
        ds_list_destroy(global.lista_mod_dur);
        ds_list_destroy(global.lista_mod_stock);
        ds_list_destroy(global.lista_mod_grip);
        ds_list_destroy(global.lista_mod_barrel);
        ds_list_destroy(global.lista_mod_handguard);
        ds_list_destroy(global.lista_mod_brake);
        ds_list_destroy(global.lista_mod_scope);
        ds_list_destroy(global.lista_mod_magazine);
        ds_list_destroy(global.lista_mod_att_1);
        ds_list_destroy(global.lista_mod_att_2);
        ds_list_destroy(global.lista_mod_att_3);
        ds_list_destroy(global.lista_mod_att_4);
        ds_list_destroy(global.lista_mod_file_x);
        ds_list_destroy(global.lista_mod_file_y);
        ds_list_destroy(global.lista_mod_file_inv);
    }
    
    _first_run = false;
    trace("Creating new lists");
    global.lista_repair_id = ds_list_create();
    global.lista_repair_dur = ds_list_create();
    global.lista_repair_qnt = ds_list_create();
    global.lista_mod_id = ds_list_create();
    global.lista_mod_dur = ds_list_create();
    global.lista_mod_stock = ds_list_create();
    global.lista_mod_grip = ds_list_create();
    global.lista_mod_barrel = ds_list_create();
    global.lista_mod_handguard = ds_list_create();
    global.lista_mod_brake = ds_list_create();
    global.lista_mod_scope = ds_list_create();
    global.lista_mod_magazine = ds_list_create();
    global.lista_mod_att_1 = ds_list_create();
    global.lista_mod_att_2 = ds_list_create();
    global.lista_mod_att_3 = ds_list_create();
    global.lista_mod_att_4 = ds_list_create();
    global.lista_mod_file_x = ds_list_create();
    global.lista_mod_file_y = ds_list_create();
    global.lista_mod_file_inv = ds_list_create();
}
