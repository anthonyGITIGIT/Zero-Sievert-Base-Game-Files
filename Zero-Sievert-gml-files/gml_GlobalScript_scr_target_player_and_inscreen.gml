function scr_target_player_and_inscreen()
{
    var _struct = 
    {
        player: false,
        inscreen: false,
        both: false
    };
    
    if (instance_exists(target))
    {
        if (target.faction == "Player")
        {
            _struct.player = true;
            
            if (inside_screen(x, y, 5))
            {
                _struct.inscreen = true;
                _struct.both = true;
            }
        }
    }
    
    return _struct;
}
