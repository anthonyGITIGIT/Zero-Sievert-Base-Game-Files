function stash_load()
{
    db_open("chest");
    global.stash_sprite = undefined;
    global.stash_sprite = db_read("Storage", "stash_sprite", array_create(14, 0));
    db_close();
}
