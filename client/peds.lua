Config.Dist = 25.0
Config.List = {
	{
		model = "s_m_y_airworker",
		coords = Config.vehicle_ped_coords,
		heading = Config.vehicle_ped_coords_heading,
		gender = "male",
	    isRendered = false,
        ped = nil,
    },
	{
		model = "a_m_m_hillbilly_01",
		coords = Config.dressing_ped_coords,
		heading = Config.dressing_ped_coords_heading,
		gender = "male",
	    isRendered = false,
        ped = nil,
    },
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k = 1, #Config.List, 1 do
			v = Config.List[k]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)
			if dist < Config.Dist and not v.isRendered then
				local ped = near(v.model, v.coords, v.heading, v.gender, v.animDict, v.animName, v.scenario)
				v.ped = ped
				v.isRendered = true
			end
			if dist >= Config.Dist and v.isRendered then
				if Config.Fade then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(v.ped, i, false)
					end
				end
				DeletePed(v.ped)
				v.ped = nil
				v.isRendered = false
			end
		end
	end
end)
function near(model, coords, heading, gender, animDict, animName, scenario)
	local genderNum = 0
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(1)
	end
	if gender == 'male' then
		genderNum = 4
	elseif gender == 'female' then 
		genderNum = 5
	end	
	local x, y, z = table.unpack(coords)
	ped = CreatePed(genderNum, GetHashKey(model), x, y, z - 1, heading, false, true)
	SetEntityAlpha(ped, 0, false)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	for i = 0, 255, 51 do
		Citizen.Wait(50)
		SetEntityAlpha(ped, i, false)
	end
	return ped
end