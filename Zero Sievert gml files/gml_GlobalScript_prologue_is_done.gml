function prologue_is_done()
{
    db_open("shared settings");
    var _done = db_read("prologue", "at least one completed", false);
    db_close();
    return _done;
}
