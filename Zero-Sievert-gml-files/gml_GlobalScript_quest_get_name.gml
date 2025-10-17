function quest_get_name(arg0)
{
    return language_get_string(variable_struct_get(global.quest_database, arg0).name);
}
