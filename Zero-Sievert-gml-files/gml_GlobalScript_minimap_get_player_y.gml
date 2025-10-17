function minimap_get_player_y()
{
    if (!player_exists_local())
        return -infinity;
    
    return (4 * global.player_y) div 16;
}
