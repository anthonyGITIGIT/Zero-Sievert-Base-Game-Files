function catspeak_collect()
{
    var pool = global.__catspeakAllocPool;
    var poolSize = array_length(pool);
    
    for (var i = 0; i < poolSize; i += 1)
    {
        var weakRef = pool[i];
        
        if (weak_ref_alive(weakRef))
            continue;
        
        weakRef.adapter.destroy(weakRef.ds);
        array_delete(pool, i, 1);
    }
}

function __catspeak_alloc(arg0, arg1)
{
    var pool = global.__catspeakAllocPool;
    var poolMax = array_length(pool) - 1;
    
    if (poolMax >= 0)
    {
        repeat (3)
        {
            var i = irandom(poolMax);
            weakRef = pool[i];
            
            if (weak_ref_alive(weakRef))
                continue;
            
            weakRef.adapter.destroy(weakRef.ds);
            var newWeakRef = weak_ref_create(arg0);
            resource = arg1.create();
            newWeakRef.adapter = arg1;
            newWeakRef.ds = resource;
            pool[i] = newWeakRef;
            return resource;
        }
    }
    
    var weakRef = weak_ref_create(arg0);
    var resource = arg1.create();
    weakRef.adapter = arg1;
    weakRef.ds = resource;
    array_push(pool, weakRef);
    return resource;
}

function __catspeak_alloc_ds_map(arg0)
{
    return __catspeak_alloc(arg0, global.__catspeakAllocDSMapAdapter);
}

function __catspeak_alloc_ds_list(arg0)
{
    return __catspeak_alloc(arg0, global.__catspeakAllocDSListAdapter);
}

function __catspeak_alloc_ds_stack(arg0)
{
    return __catspeak_alloc(arg0, global.__catspeakAllocDSStackAdapter);
}

function __catspeak_alloc_ds_priority(arg0)
{
    return __catspeak_alloc(arg0, global.__catspeakAllocDSPriorityAdapter);
}

function __catspeak_init_alloc()
{
    global.__catspeakAllocPool = [];
    global.__catspeakAllocDSMapAdapter = 
    {
        create: ds_map_create,
        destroy: ds_map_destroy
    };
    global.__catspeakAllocDSListAdapter = 
    {
        create: ds_list_create,
        destroy: ds_list_destroy
    };
    global.__catspeakAllocDSStackAdapter = 
    {
        create: ds_stack_create,
        destroy: ds_stack_destroy
    };
    global.__catspeakAllocDSPriorityAdapter = 
    {
        create: ds_priority_create,
        destroy: ds_priority_destroy
    };
}
