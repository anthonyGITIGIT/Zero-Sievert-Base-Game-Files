event_inherited();

if (radiation_voice != undefined)
{
    audio_stop_sound(radiation_voice);
    radiation_voice = undefined;
}

mods_object_perform_event("cleanup_event");
