mods_init();

try
{
    mods_perform_event_file("init");
}
catch (_error)
{
    global.__Mods_Context_Current.failed_to_compile = true;
    global.__Mods_Context_Current.compile_error = _error;
    global.Mods_Failed_To_Compile = true;
    trace(_error);
}
