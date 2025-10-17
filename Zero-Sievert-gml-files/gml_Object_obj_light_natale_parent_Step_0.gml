light_color = colore_luce[colore_now];
luci_natale_timer_alternato_max = luci_natale_timer_alternato_max_array[global.luci_natale_timer];
luci_natale_timer_alternato_diffuso_max = luci_natale_timer_alternato_diffuso_max_array[global.luci_natale_timer];

if (global.luci_natale_built == true)
{
    if (global.luci_natale_on == false)
        scale = 0;
    
    if (global.luci_natale_on == true)
    {
        if (global.luci_natale_mode == UnknownEnum.Value_0)
            scale = scale_start;
        
        if (global.luci_natale_mode == UnknownEnum.Value_1)
        {
            luci_natale_timer_alternato++;
            
            if (luci_natale_timer_alternato < luci_natale_timer_alternato_max)
            {
                if (luce_natale_numero == 1)
                    scale = scale_start;
                
                if (luce_natale_numero == 2)
                    scale = 0;
            }
            
            if (luci_natale_timer_alternato >= luci_natale_timer_alternato_max)
            {
                if (luce_natale_numero == 1)
                    scale = 0;
                
                if (luce_natale_numero == 2)
                    scale = scale_start;
            }
            
            if (luci_natale_timer_alternato >= (luci_natale_timer_alternato_max * 2))
                luci_natale_timer_alternato = 0;
        }
        
        if (global.luci_natale_mode == UnknownEnum.Value_2)
        {
            luci_natale_timer_alternato++;
            var _now = luci_natale_timer_alternato;
            var _max = luci_natale_timer_alternato_diffuso_max;
            
            if (_now < _max)
            {
                if (luce_natale_numero == 1)
                    scale = (scale_start * _now) / _max;
                
                if (luce_natale_numero == 2)
                    scale = scale_start - ((scale_start * _now) / _max);
            }
            
            if (_now >= _max)
            {
                if (luce_natale_numero == 1)
                    scale = scale_start - ((scale_start * (_now - _max)) / _max);
                
                if (luce_natale_numero == 2)
                    scale = (scale_start * (_now - _max)) / _max;
            }
            
            if (_now >= (luci_natale_timer_alternato_diffuso_max * 2))
                luci_natale_timer_alternato = 0;
        }
    }
}
else
{
    scale = 0;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
