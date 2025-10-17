function uiDestroy(arg0)
{
    if (!is_struct(arg0))
        exit;
    
    arg0.Destroy();
}
