if (black_overlay_alpha < 0.5)
{
    var _root = uiLayerGetRoot("root");
    uiFind(_root, "mm news").ReplaceFromFile("ZS_vanilla/ui/mm_news.ui");
}
else
{
    alarm[3] = 1;
}
