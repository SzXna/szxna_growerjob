local plate = ''

local createdBlips = {}

Blips = {
	[1] = {
		Coords = { x = Config.dressing_ped_coords.x, y = Config.dressing_ped_coords.y, z = Config.dressing_ped_coords.z },
		Blip = { name = TranslateCap('blip_clothes'), sprite = 73, size = 0.6, color = 0 },
		AllowedJobs = {'grower'},
		DeniedJobs = {},
	},
    [2] = {
		Coords = { x = Config.vehicle_ped_coords.x, y = Config.vehicle_ped_coords.y, z = Config.vehicle_ped_coords.z },
		Blip = { name = TranslateCap('blip_vehicle'), sprite = 225, size = 0.6, color = 0 },
		AllowedJobs = {'grower'},
		DeniedJobs = {},
	},
    [3] = {
		Coords = { x = 355.77, y = 6517.62, z = 31.75 },
		Blip = { name = TranslateCap('blip_pick_fruits'), sprite = 161, size = 1.0, color = 0 },
		AllowedJobs = {'grower'},
		DeniedJobs = {},
	},
}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
    Wait(500)
    loadBlips()
end)

RegisterNetEvent('esx:playerLogout')
AddEventHandler('esx:playerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    for k,v in pairs(createdBlips) do
		RemoveBlip(v)
	end
    Wait(500)
	loadBlips()
end)

function loadBlips()
	print(getJob())
	for k,v in pairs(Blips) do
		local canSee = false
		if #v.AllowedJobs == 0 then
			canSee = true
		elseif #v.DeniedJobs == 0 then
			canSee = false
		end
		for ke,va in pairs(v.DeniedJobs) do
			if va == getJob() then
				canSee = false
			end
		end
		for key,val in pairs(v.AllowedJobs) do
			if val == getJob() then
				canSee = true
			end
		end
		if canSee then
			local blip = AddBlipForCoord(v.Coords.x, v.Coords.y, v.Coords.z)
			SetBlipSprite(blip, v.Blip.sprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, v.Blip.size)
			SetBlipColour(blip, v.Blip.color)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.Blip.name)
			EndTextCommandSetBlipName(blip)
			table.insert(createdBlips, blip)
		end
	end
end

function getJob()
    return ESX.PlayerData.job.name
end

RegisterNetEvent('szxna_growerjob:ox_notification')
AddEventHandler('szxna_growerjob:ox_notification', function(msg)
    lib.notify({
        description = msg,
        type = 'inform'
    })
end)

AddEventHandler('szxna_growerjob:pull_veh', function()
    if ESX.Game.IsSpawnPointClear(Config.vehicle_spawn_coords, 1.5) then
        if Config.vehilce_advance_payment then
            local count = exports.ox_inventory:Search('count', 'money')
            if count >= Config.vehilce_advance_price then
                TriggerServerEvent('szxna_growerjob:advance_payment', Config.vehilce_advance_price)
                if Config.ox_notification then
                    lib.notify({
                        description = TranslateCap('advance_payment', Config.vehilce_advance_price),
                        type = 'inform'
                    })
                else
                    ESX.ShowNotification(TranslateCap('advance_payment', Config.vehilce_advance_price))
                end
                ESX.Game.SpawnVehicle('kalahari', Config.vehicle_spawn_coords, Config.vehicle_spawn_coords_heading, function(vehicle)
                    ESX.Game.SetVehicleProperties(vehicle, {
                        dirtLevel = 0,
                    })
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1),  vehicle,  -1)
                    if Config.ox_fuel then
                        Entity(vehicle).state.fuel = 100
                    end
                    SetVehicleExtra(vehicle, 0, true)
                    SetVehicleExtra(vehicle, 1, true)
                    SetVehicleExtra(vehicle, 2, true)
                    SetVehicleExtra(vehicle, 3, true)
                    SetVehicleExtra(vehicle, 4, true)
                    SetVehicleExtra(vehicle, 5, true)
                    SetVehicleExtra(vehicle, 6, true)
                    SetVehicleExtra(vehicle, 7, true)
                    SetVehicleExtra(vehicle, 8, true)
                    SetVehicleExtra(vehicle, 9, true)
                    SetVehicleExtra(vehicle, 10, true)
                    SetVehicleExtra(vehicle, 11, true)
                    SetVehicleExtra(vehicle, 12, true)
                    SetVehicleExtra(vehicle, 13, true)
                    SetVehicleExtra(vehicle, 14, true)
                    SetVehicleExtra(vehicle, 15, true)
                    SetVehicleColours(vehicle, 38, 38)
                    TriggerEvent('szxna_growerjob:veh_pulled_false')
                    plate = GetVehicleNumberPlateText(vehicle)
                    if Config.sy_carkeys then
                        TriggerServerEvent('sy_carkeys:CreateKey', GetVehicleNumberPlateText(vehicle), 'KALAHARI')  
                    end
                end)
            else
                if Config.ox_notification then
                    lib.notify({
                        description = TranslateCap('no_advance_payment', Config.vehilce_advance_price),
                        type = 'error'
                    })
                else
                    ESX.ShowNotification(TranslateCap('no_advance_payment', Config.vehilce_advance_price))
                end
                Wait(100)
                TriggerEvent('szxna_growerjob:veh_pulled')
            end
        else
            ESX.Game.SpawnVehicle('kalahari', Config.vehicle_spawn_coords, Config.vehicle_spawn_coords_heading, function(vehicle)
                ESX.Game.SetVehicleProperties(vehicle, {
                    dirtLevel = 0,
                })
                TaskWarpPedIntoVehicle(GetPlayerPed(-1),  vehicle,  -1)
                if Config.ox_fuel then
                    Entity(vehicle).state.fuel = 100
                end
                SetVehicleExtra(vehicle, 0, true)
                SetVehicleExtra(vehicle, 1, true)
                SetVehicleExtra(vehicle, 2, true)
                SetVehicleExtra(vehicle, 3, true)
                SetVehicleExtra(vehicle, 4, true)
                SetVehicleExtra(vehicle, 5, true)
                SetVehicleExtra(vehicle, 6, true)
                SetVehicleExtra(vehicle, 7, true)
                SetVehicleExtra(vehicle, 8, true)
                SetVehicleExtra(vehicle, 9, true)
                SetVehicleExtra(vehicle, 10, true)
                SetVehicleExtra(vehicle, 11, true)
                SetVehicleExtra(vehicle, 12, true)
                SetVehicleExtra(vehicle, 13, true)
                SetVehicleExtra(vehicle, 14, true)
                SetVehicleExtra(vehicle, 15, true)
                SetVehicleColours(vehicle, 38, 38)
                TriggerEvent('szxna_growerjob:veh_pulled_false')
                plate = GetVehicleNumberPlateText(vehicle)
                if Config.sy_carkeys then
                    TriggerServerEvent('sy_carkeys:CreateKey', GetVehicleNumberPlateText(vehicle), 'KALAHARI')  
                end
                if Config.ox_notification then
                    lib.notify({
                        description = TranslateCap('pulled_out'),
                        type = 'inform'
                    })
                else
                    ESX.ShowNotification(TranslateCap('pulled_out'))
                end
            end)
        end
    else
        if Config.ox_notification then
            lib.notify({
                description = TranslateCap('blocked_pace'),
                type = 'error'
            })
        else
            ESX.ShowNotification(TranslateCap('blocked_pace'))
        end
    end
end)

local orange_in_veh = 0

RegisterNetEvent('szxna_growerjob:oranges_count')
AddEventHandler('szxna_growerjob:oranges_count', function(count)
    orange_in_veh = orange_in_veh + count
    if Config.ox_textui then
        lib.showTextUI(TranslateCap('fruit_in_vehicle_textui', orange_in_veh, Config.orange_vehicle_max), {
            position = "top-center",
            icon = 'fa-solid fa-apple-whole',
            style = {
                borderRadius = 0,
                backgroundColor = '#48BB78',
                color = 'white'
            }
        })
    end
    if Config.ox_notification then
        lib.notify({
            description = TranslateCap('fruit_in_vehicle', orange_in_veh),
        })
    else
        ESX.ShowNotification(TranslateCap('fruit_in_vehicle', orange_in_veh))
    end
end)

AddEventHandler('szxna_growerjob:return_veh', function(data)
    if Config.ox_textui then
        lib.hideTextUI()
    end
    if Config.vehilce_advance_payment then
        local model = GetEntityModel(data.entity)
        local displaytext = GetDisplayNameFromVehicleModel(model)
        if displaytext == 'KALAHARI' then
            ESX.Game.DeleteVehicle(data.entity)
            if Config.sy_carkeys then
                TriggerServerEvent('sy_carkeys:DeleteKey', 1, plate, 'KALAHARI') 
            end
            if orange_in_veh > 0 then
                TriggerEvent('szxna_growerjob:veh_pulled')
                TriggerServerEvent('szxna_growerjob:give_fee', orange_in_veh)
                Wait(10)
                orange_in_veh = 0
            else
                TriggerEvent('szxna_growerjob:veh_pulled')
            end
        end
        if Config.ox_notification then
            lib.notify({
                description = TranslateCap('advance_payment_return'),
                type = 'inform'
            })
        else
            ESX.ShowNotification(TranslateCap('advance_payment_return'))
        end
        TriggerServerEvent('szxna_growerjob:advance_payment_return', Config.vehilce_advance_price)
    else
        local model = GetEntityModel(data.entity)
        local displaytext = GetDisplayNameFromVehicleModel(model)
        if displaytext == 'KALAHARI' then
            ESX.Game.DeleteVehicle(data.entity)
            if Config.sy_carkeys then
                TriggerServerEvent('sy_carkeys:DeleteKey', 1, plate, 'KALAHARI') 
            end
            if Config.ox_notification then
                lib.notify({
                    description = TranslateCap('returned_veh'),
                    type = 'inform'
                })
            else
                ESX.ShowNotification(TranslateCap('returned_veh'))
            end
            if orange_in_veh > 0 then
                TriggerEvent('szxna_growerjob:veh_pulled')
                TriggerServerEvent('szxna_growerjob:give_fee', orange_in_veh)
                Wait(100)
                orange_in_veh = 0
            else
                TriggerEvent('szxna_growerjob:veh_pulled')
            end
        end
    end
end)

AddEventHandler('szxna_growerjob:throw_oranges', function(data)
	if orange_in_veh < Config.orange_vehicle_max then
        if lib.progressBar({
            duration = 2500,
            label = TranslateCap('throwing_oranges'),
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
                move = true,
            },
            anim = {
                dict = 'amb@prop_human_bum_bin@idle_a',
                clip = 'idle_a'
            },
        }) then TriggerServerEvent('szxna_growerjob:throw_oranges_count', source)
        end
    else
        if Config.ox_notification then
            lib.notify({
                description = TranslateCap('max_oranges'),
            })
        else
            ESX.ShowNotification(TranslateCap('max_oranges'))
        end
    end
end)

AddEventHandler('szxna_growerjob:dressing', function()
    if dressed_up then
        lib.requestAnimDict('clothingtie')
        TaskPlayAnim(GetPlayerPed(-1), 'clothingtie', 'try_tie_negative_a', 8.0, 8.0, 1.0, 1, 1, 0, 0, 0)
        Wait(2000)
        ClearPedTasks(GetPlayerPed(-1))
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
        dressed_up = false
        TriggerEvent('szxna_growerjob:dressed_up_false')
    else
        lib.requestAnimDict('clothingtie')
        TaskPlayAnim(GetPlayerPed(-1), 'clothingtie', 'try_tie_negative_a', 8.0, 8.0, 1.0, 1, 1, 0, 0, 0)
        Wait(2000)
        ClearPedTasks(GetPlayerPed(-1))
        TriggerEvent('skinchanger:getSkin', function(skin)
            local clothes

            if skin.sex == 0 then
                clothes = Config.clothes.male
            else
                clothes = Config.clothes.female
            end

            if clothes then
                TriggerEvent('skinchanger:loadClothes', skin, clothes)
            end
        end)
        dressed_up = true
        TriggerEvent('szxna_growerjob:dressed_up_true')
    end
end)