function catspeak_force_init()
{
    static initialised = false;
    
    if (initialised)
        return false;
    
    initialised = true;
    global.__catspeakConfig = {};
    __catspeak_init_alloc();
    __catspeak_init_operators();
    __catspeak_init_presets();
    __catspeak_init_lexer();
    __catspeak_init_codegen();
    __catspeak_init_engine();
    var motd = "you are now using Catspeak v3.0.0 by @katsaii";
    show_debug_message(motd);
    return true;
}

catspeak_force_init();
