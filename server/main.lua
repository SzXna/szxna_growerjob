RegisterServerEvent('szxna_growerjob:give_fruit', function()
    count = math.random(Config.orange_give_min,Config.orange_give_max)
    if exports.ox_inventory:CanCarryItem(source, 'orange', count) then
        exports.ox_inventory:AddItem(source, 'orange', count)
        if Config.ox_notification then
            TriggerClientEvent('szxna_growerjob:ox_notification', source, TranslateCap('plucked_fruit'))
        else
            TriggerClientEvent('esx:showNotification', source, TranslateCap('plucked_fruit'))
        end
    end
end)

RegisterServerEvent('szxna_growerjob:throw_oranges_count', function()
    local count = exports.ox_inventory:Search(source, 'count', 'orange')
    exports.ox_inventory:RemoveItem(source, 'orange', count)
    TriggerClientEvent('szxna_growerjob:oranges_count', source, count)
end)

RegisterServerEvent('szxna_growerjob:give_fee', function(money)
    exports.ox_inventory:AddItem(source, 'money', math.floor(money * Config.orange_fee / 100))
    if Config.ox_notification then
        TriggerClientEvent('szxna_growerjob:ox_notification', source, TranslateCap('check_fee'))
    else
        TriggerClientEvent('esx:showNotification', source, TranslateCap('check_fee'))
    end
end)

RegisterServerEvent('szxna_growerjob:advance_payment', function(count)
    exports.ox_inventory:RemoveItem(source, 'money', count)
end)

RegisterServerEvent('szxna_growerjob:advance_payment_return', function(count)
    exports.ox_inventory:AddItem(source, 'money', count)
end)