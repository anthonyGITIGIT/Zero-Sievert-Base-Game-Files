game_in_focus();

function game_in_focus()
{
    static _in_focus = true;
    static _surface = undefined;
    
    return window_has_focus();
}
