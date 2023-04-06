local veh_pulled, tree_1, tree_2, tree_3, tree_4, tree_5, tree_6, tree_7, tree_8, tree_9, tree_10, tree_11, tree_12, tree_13, tree_14, tree_15, tree_16, tree_17, tree_18, tree_19, tree_20, tree_21, tree_22, tree_23 = true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true

local dressed_up = false

AddEventHandler('szxna_growerjob:veh_pulled', function()
    veh_pulled = true
end)

AddEventHandler('szxna_growerjob:veh_pulled_false', function()
    veh_pulled = false
end)

AddEventHandler('szxna_growerjob:dressed_up_true', function()
    dressed_up = true
end)

AddEventHandler('szxna_growerjob:dressed_up_false', function()
    dressed_up = false
end)

AddEventHandler('szxna_growerjob:pick_fruit', function()
    if Config.ox_skillcheck then
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
        lib.requestAnimDict('amb@prop_human_movie_bulb@base')
        TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_movie_bulb@base', 'base', 8.0, 8.0, 1.0, 1, 1, 0, 0, 0)
        local success = lib.skillCheck({'easy', 'easy', {areaSize = 90, speedMultiplier = 1}, 'easy'}, {'1', '2', '3', '4'})
        if success then
            ClearPedTasks(GetPlayerPed(-1))
            TriggerServerEvent('szxna_growerjob:give_fruit', source)
        else
            ClearPedTasks(GetPlayerPed(-1))
            if Config.ox_notification then
                lib.notify({
                    description = TranslateCap('failed_pick_fruit'),
                    type = 'error'
                })
            else
                ESX.ShowNotification(TranslateCap('failed_pick_fruit'))
            end
        end
    else
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
        if lib.progressBar({
            duration = Config.ox_progressbar_duration,
            label = TranslateCap('picking_fruit'),
            canCancel = false,
            disable = {
                car = true,
                move = true,
            },
            anim = {
                dict = 'amb@prop_human_movie_bulb@base',
                clip = 'base'
            },
        }) then 
            TriggerServerEvent('szxna_growerjob:give_fruit', source)
        else ClearPedTasks(GetPlayerPed(-1)) end
    end
end)

exports.ox_target:addSphereZone({
    name = "tree_1",
    coords = vec3(369.55, 6532.02, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_1',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_1 then
                    tree_1 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_1 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_1 and veh_pulled == false then
                    return true
                end
            end
        }
    },
})    
exports.ox_target:addSphereZone({
    name = "tree_2",
    coords = vec3(361.46, 6531.52, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_2',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_2 then
                    tree_2 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_2 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_2 and veh_pulled == false then
                    return true
                end
            end
        }
    },
})  
exports.ox_target:addSphereZone({
    name = "tree_3",
    coords = vec3(353.68, 6530.87, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_3',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_3 then
                    tree_3 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_3 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_3 and veh_pulled == false then
                    return true
                end
            end
        }
    },
})  
exports.ox_target:addSphereZone({
    name = "tree_4",
    coords = vec3(346.05, 6531.43, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_4',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_4 then
                    tree_4 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_4 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_4 and veh_pulled == false then
                    return true
                end
            end
        }
    },
})
exports.ox_target:addSphereZone({
    name = "tree_5",
    coords = vec3(338.59, 6531.26, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_5',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_5 then
                    tree_5 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_5 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_5 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_6",
    coords = vec3(329.72, 6531.05, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_6',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_6 then
                    tree_6 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_6 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_6 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_7",
    coords = vec3(321.77, 6531.28, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_7',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_7 then
                    tree_7 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_7 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_7 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_8",
    coords = vec3(378.21, 6517.44, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_8',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_8 then
                    tree_8 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_8 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_8 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_9",
    coords = vec3(369.87, 6517.63, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_9',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_9 then
                    tree_9 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_9 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_9 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_10",
    coords = vec3(362.84, 6517.66, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_10',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_10 then
                    tree_10 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_10 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_10 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_11",
    coords = vec3(355.32, 6517.39, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_11',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_11 then
                    tree_11 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_11 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_11 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_12",
    coords = vec3(347.46, 6517.48, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_12',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_12 then
                    tree_12 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_12 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_12 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_13",
    coords = vec3(338.82, 6517.21, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_13',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_13 then
                    tree_13 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_13 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_13 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_14",
    coords = vec3(330.43, 6517.56, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_14',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_14 then
                    tree_14 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_14 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_14 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_15",
    coords = vec3(321.78, 6517.37, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_15',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),

            distance = 1.8,
            onSelect = function()
                if tree_15 then
                    tree_15 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_15 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_15 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_16",
    coords = vec3(378.13, 6505.81, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_16',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_16 then
                    tree_16 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_16 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_16 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_17",
    coords = vec3(370.18, 6506.02, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_17',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_17 then
                    tree_17 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_17 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_17 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_18",
    coords = vec3(363.24, 6505.71, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_18',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_18 then
                    tree_18 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_18 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_18 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_19",
    coords = vec3(355.19, 6505.01, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_19',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_19 then
                    tree_19 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_19 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_19 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_20",
    coords = vec3(347.86, 6505.24, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_20',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_20 then
                    tree_20 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_20 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_20 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_21",
    coords = vec3(339.89, 6505.47, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_21',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_21 then
                    tree_21 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_21 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_21 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_22",
    coords = vec3(330.84, 6505.65, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_22',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_22 then
                    tree_22 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_22 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_22 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 
exports.ox_target:addSphereZone({
    name = "tree_23",
    coords = vec3(321.91, 6505.33, 30.95),
    radius = 3.0,
    options = {
        {
            name = 'tree_23',
            icon = 'fa-solid fa-apple-whole',
            label = TranslateCap('pick_fruit'),
            distance = 1.8,
            onSelect = function()
                if tree_23 then
                    tree_23 = false
                    TriggerEvent('szxna_growerjob:pick_fruit')
                    Wait(Config.grow_time*1000)
                    tree_23 = true
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and tree_23 and veh_pulled == false then
                    return true
                end
            end
        }
    },
}) 

exports.ox_target:addSphereZone({
    name = "veh",
    coords = Config.vehicle_ped_coords,
    radius = 1.0,
    options = {
        {
            name = 'veh',
            icon = 'fa-solid fa-car',
            label = TranslateCap('pull_out_veh'),
            distance = 1.5,
            onSelect = function()
                if veh_pulled then
                    TriggerEvent('szxna_growerjob:pull_veh')
                end
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and veh_pulled and dressed_up then
                    return true
                end
            end
        }
    },
}) 

exports.ox_target:addGlobalVehicle({
    {
        name = 'veh_2',
        icon = 'fa-solid fa-parking',
        label = TranslateCap('return_veh'),
        event = 'szxna_growerjob:return_veh',
        canInteract = function(entity, vehicle)
            entityCoords = GetEntityCoords(entity)
            local dist = #(Config.vehicle_spawn_coords-entityCoords)
            if dist < 15 and ESX.PlayerData.job.name == 'grower' and veh_pulled == false then
                return true
            end
        end,
        distance = 1.5
    }
})
exports.ox_target:addGlobalVehicle({
    {
        name = 'veh_3',
        icon = 'fa-solid fa-apple-whole',
        label = TranslateCap('throw_oranges'),
        event = 'szxna_growerjob:throw_oranges',
        canInteract = function(entity)
            entityCoords = GetEntityCoords(entity)
            local dist = #(vector3(355.34, 6517.35, 28.94)-entityCoords)
            local model = GetEntityModel(entity)
            local displaytext = GetDisplayNameFromVehicleModel(model)
            local count = exports.ox_inventory:Search('count', 'orange')
            if dist < 50 and ESX.PlayerData.job.name == 'grower' and displaytext == 'KALAHARI' and count > 0 and veh_pulled == false then
                return true
            end
        end,
        distance = 1.5
    }
})

exports.ox_target:addSphereZone({
    name = "dressing",
    coords = Config.dressing_ped_coords,
    radius = 1.0,
    options = {
        {
            name = 'dressing',
            icon = 'fa-solid fa-shirt',
            label = TranslateCap('change_your_clothes'),
            distance = 1.5,
            onSelect = function()
                dressed_up = true
                TriggerEvent('szxna_growerjob:dressing')
            end,
            canInteract = function(entity)
                if ESX.PlayerData.job.name == 'grower' and veh_pulled then
                    return true
                end
            end
        }
    },
}) 