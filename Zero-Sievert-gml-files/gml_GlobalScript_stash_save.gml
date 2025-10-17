function stash_save()
{
    db_open("chest");
    db_write("Storage", "stash_sprite", global.stash_sprite);
    db_close();
}
