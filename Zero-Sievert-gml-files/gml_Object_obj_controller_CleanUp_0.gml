debris_splat_map.Destroy();
mp_grid_destroy(global.grid_move);

if (ds_exists(grid_motion, ds_type_grid))
    ds_grid_destroy(grid_motion);

if (ds_exists(grid_quest, ds_type_grid))
    ds_grid_destroy(grid_quest);

var _func_destroy_list = function(arg0)
{
    if (variable_global_exists(arg0))
    {
        var _list = variable_global_get(arg0);
        
        if (ds_exists(_list, ds_type_list))
            ds_list_destroy(_list);
    }
};

_func_destroy_list("list_interact");
_func_destroy_list("list_interact_id");
_func_destroy_list("list_interact_task_pos");
_func_destroy_list("list_ammo_id");
_func_destroy_list("list_ammo_qnt");
_func_destroy_list("list_status_id");
_func_destroy_list("list_mod_avaible");
_func_destroy_list("list_mod_avaible_x");
_func_destroy_list("list_mod_avaible_y");
_func_destroy_list("list_dynamic_npc");
_func_destroy_list("list_dynamic_npc_x");
_func_destroy_list("list_dynamic_npc_y");
_func_destroy_list("list_status_id");
_func_destroy_list("list_quest_before_map_npc_name");
_func_destroy_list("list_quest_before_map_quest_id");
_func_destroy_list("list_quest_before_map_quest_premio");

var _func_destroy_grid = function(arg0)
{
    if (variable_global_exists(arg0))
    {
        var _grid = variable_global_get(arg0);
        
        if (ds_exists(_grid, ds_type_grid))
            ds_grid_destroy(_grid);
    }
};

_func_destroy_grid("grid_faction");
surface_free(surface_testo);
surface_testo = -1;
