function ugc_install_workshop_id(arg0)
{
    show_debug_message("to install");
    show_debug_message(arg0);
    instance_create_depth(0, 0, 0, ugc_steamworks_installer, 
    {
        workshop_id: arg0
    });
}
