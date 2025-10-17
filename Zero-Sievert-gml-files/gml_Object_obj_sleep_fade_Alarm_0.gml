a = -a;
var _minutes = minutes;
time_increment_minutes(_minutes);

with (player_get_local())
{
    var k1 = 1;
    var k2 = 1;
    var k3 = 1;
    var k4 = 1;
    var k5 = 1;
    var k6 = 1;
    
    if (x < 340 && y > 846)
    {
        k1 = global.sk_k[UnknownEnum.Value_54];
        k2 = global.sk_k[UnknownEnum.Value_55];
        k3 = global.sk_k[UnknownEnum.Value_48];
        k4 = global.sk_k[UnknownEnum.Value_49];
        k5 = global.sk_k[UnknownEnum.Value_50];
        k6 = global.sk_k[UnknownEnum.Value_51];
    }
    
    fatigue += (_minutes * 0.27 * k1);
    wound -= (_minutes * 0.05 * k2);
    hp += (_minutes * 0.1 * k3);
    bleed = 0;
    radiation_accumulata -= (_minutes * 0.01 * k4);
    energy -= (_minutes * 0.04 * k5);
    thirst -= (_minutes * 0.05 * k6);
}

enum UnknownEnum
{
    Value_48 = 48,
    Value_49,
    Value_50,
    Value_51,
    Value_54 = 54,
    Value_55
}
