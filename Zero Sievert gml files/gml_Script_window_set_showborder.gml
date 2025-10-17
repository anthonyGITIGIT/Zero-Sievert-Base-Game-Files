var showborder = argument0;
var ww, wh;

if (showborder)
{
    ww = window_get_width();
    wh = window_get_height();
}

_window_set_showborder(window_handle(), showborder);

if (showborder)
    window_set_size(ww, wh);
