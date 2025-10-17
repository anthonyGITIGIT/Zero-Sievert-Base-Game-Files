function minimap_get_player_x()
{
    if (!player_exists_local())
        return -infinity;
    
    return (4 * global.player_x) div 16;
}
