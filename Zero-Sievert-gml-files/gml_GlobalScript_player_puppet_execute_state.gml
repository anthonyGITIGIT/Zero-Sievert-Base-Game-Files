function player_puppet_execute_state()
{
    var _script = undefined;
    
    switch (state)
    {
        case scr_player_state_move:
            _script = puppet_state_move;
            break;
        
        case scr_player_state_inventory:
            _script = puppet_state_inventory;
            break;
        
        case scr_player_state_dead:
            _script = puppet_state_dead;
            break;
        
        case scr_player_state_start:
            _script = puppet_state_start;
            break;
        
        case scr_player_state_consumable_animation:
            _script = puppet_state_consumable_animation;
            break;
        
        case scr_player_state_sleep:
            _script = puppet_state_sleep;
            break;
        
        case scr_player_state_craft:
            _script = puppet_state_craft;
            break;
        
        case scr_player_state_item_spawn:
            _script = puppet_state_item_spawn;
            break;
        
        case scr_player_state_weapon_look:
            _script = puppet_state_weapon_look;
            break;
        
        case scr_player_state_cristallo_viola:
            _script = puppet_state_cristallo_viola;
            break;
        
        case scr_player_state_free_camera:
            _script = puppet_state_free_camera;
            break;
        
        case scr_player_state_talk:
            _script = puppet_state_talk;
            break;
        
        case scr_player_state_teleport:
            _script = puppet_state_teleport;
            break;
        
        default:
            trace_error("Player state \"", script_get_name(state), "\" unhandled");
            break;
    }
    
    if (_script != undefined)
        script_execute(_script);
}
