uiAddBoxType("UiMinimap", class_ui_minimap);

function class_ui_minimap() : __uiClassCommon() constructor
{
    color = 16777215;
    alpha = 1;
    scr_draw_surface_cover();
    
    if (instance_exists(obj_minimap))
    {
        var _surface = obj_minimap.surface_map;
        Set("size", [4 * surface_get_width(_surface), 4 * surface_get_height(_surface)]);
    }
    
    CallbackSetStep(function()
    {
        uiCallInherited();
        
        if (Get("width") == 0 || Get("height") == 0)
        {
            var _surface = obj_minimap.surface_map;
            Set("size", [4 * surface_get_width(_surface), 4 * surface_get_height(_surface)]);
        }
    });
    CallbackSetDraw(function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        
        if (surface_exists(obj_minimap.surface_map) && surface_exists(obj_minimap.surface_cover))
        {
            gpu_set_blendenable(false);
            draw_surface_ext(obj_minimap.surface_map, __drawLeft, __drawTop, 4, 4, 0, _color, _alpha);
            gpu_set_blendenable(true);
            draw_surface_ext(obj_minimap.surface_cover, __drawLeft, __drawTop, 4, 4, 0, _color, _alpha);
        }
        
        if (global.general_debug)
        {
            var _size = array_length(global.list_n_id);
            
            if (_size > 0)
            {
                for (var i = 0; i < _size; i++)
                {
                    var _x = global.list_n_x[i] div 16;
                    var _y = global.list_n_y[i] div 16;
                    var _col = 16777215;
                    
                    if (global.list_n_follow_path[i])
                        _col = 65535;
                    
                    if (global.list_n_hp[i] <= 0)
                        _col = 255;
                    
                    if (global.list_n_npc_id[i] == "arman")
                        _col = 16776960;
                    
                    draw_sprite_ext(s_1pixel, 0, __drawLeft + (4 * (_x - 1)), __drawTop + (4 * (_y - 1)), 4, 4, 0, _col, 1);
                }
            }
            
            if (global.show_dynamic_npc_path && _size > 0)
            {
                for (var i = 0; i < _size; i++)
                {
                    language_set_font(UnknownEnum.Value_0);
                    draw_set_halign(fa_center);
                    
                    if (global.list_n_id[i] != -4)
                    {
                        var _path_amount_max = ds_list_size(global.list_n_id[i].lista_path_x) - 1;
                        
                        if (_path_amount_max > 1)
                        {
                            for (var j = 0; j < _path_amount_max; j++)
                            {
                                var _x1 = ds_list_find_value(global.list_n_id[i].lista_path_x, j) div 16;
                                var _y1 = ds_list_find_value(global.list_n_id[i].lista_path_y, j) div 16;
                                var _x2 = ds_list_find_value(global.list_n_id[i].lista_path_x, j + 1) div 16;
                                var _y2 = ds_list_find_value(global.list_n_id[i].lista_path_y, j + 1) div 16;
                                draw_line_width_color(__drawLeft + (4 * _x1), __drawTop + (4 * _y1), __drawLeft + (4 * _x2), __drawTop + (4 * _y2), 1, global.list_n_id[i].path_color, global.list_n_id[i].path_color);
                            }
                        }
                    }
                }
            }
        }
    });
}

enum UnknownEnum
{
    Value_0
}
