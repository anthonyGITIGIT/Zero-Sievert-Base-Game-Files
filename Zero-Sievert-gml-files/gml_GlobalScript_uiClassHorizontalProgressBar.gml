uiAddBoxType("UiHorizontalProgressBar", uiClassHorizontalProgressBar, false);

function uiClassHorizontalProgressBar() : uiClassSprite() constructor
{
    value = 0;
    colour_inside = 16777215;
    colour_outside = 0;
    border = 4;
    CallbackSetDraw(scr_draw_ui_horizontal_progress_bar);
}
