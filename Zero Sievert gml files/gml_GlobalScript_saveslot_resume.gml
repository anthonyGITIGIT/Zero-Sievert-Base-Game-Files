function saveslot_resume()
{
    if (uiGetData().most_recent_save != undefined)
    {
        return saveslot_load(uiGetData().most_recent_save);
    }
    else
    {
        scr_draw_text_with_box("No file found");
        return false;
    }
}
