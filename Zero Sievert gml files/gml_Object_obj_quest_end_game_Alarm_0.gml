if (quest_is_complete("revelations"))
    scr_draw_npc_text(id, UnknownEnum.Value_212);
else
    scr_draw_npc_text(id, UnknownEnum.Value_227);

enum UnknownEnum
{
    Value_212 = 212,
    Value_227 = 227
}
