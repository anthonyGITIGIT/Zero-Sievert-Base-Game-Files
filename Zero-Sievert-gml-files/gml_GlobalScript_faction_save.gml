function faction_save()
{
    db_open("general");
    db_write("factions", "relationships", -1);
    db_write("factions", "joined", SnapDeepCopy(global.faction_joined));
    db_write("factions", "struct", SnapDeepCopy(global.struct_faction));
    db_close();
}
