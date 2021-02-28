local isFarmer = false
local finished = 0

local gather1 = false
local gather2 = false
local gather3 = false
local gather4 = false
local task1 = false
local task2 = false
local task3 = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
    	if isFarmer == false then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.FarmerJob.x, Config.FarmerJob.y, Config.FarmerJob.z, true)
			if betweencoords <= 2.2 then
			DrawTxt(Config.StartWorking, 0.50, 0.90, 0.5, 0.5, true, 161, 3, 0, 255, true)
				if IsControlJustPressed(0, 0xC7B5340A) and not pressing and not started then
					pressing = true
					isFarmer = true
					startMission()
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
    Wait(100)
    local blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, Config.FarmerJob.x, Config.FarmerJob.y, Config.FarmerJob.z)
    SetBlipSprite(blip, 2107754879)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Construction Work")
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

function startMission()
started = true
if Config.ShowBlips then
	blip1 = Citizen.InvokeNative(0x554d9d53f696d002, Config.PointSprite, Config.Point1.x, Config.Point1.y, Config.Point1.z)
	blip2 = Citizen.InvokeNative(0x554d9d53f696d002, Config.PointSprite, Config.Point2.x, Config.Point2.y, Config.Point2.z)
	blip3 = Citizen.InvokeNative(0x554d9d53f696d002, Config.PointSprite, Config.Point3.x, Config.Point3.y, Config.Point3.z)
	blip4 = Citizen.InvokeNative(0x554d9d53f696d002, Config.PointSprite, Config.Point4.x, Config.Point4.y, Config.Point4.z)
	blip5 = Citizen.InvokeNative(0x554d9d53f696d002, Config.PointSprite, Config.Point5.x, Config.Point5.y, Config.Point5.z)	
	SetBlipSprite(blip1, -570710357, 1)
	SetBlipSprite(blip2, -570710357, 1)
	SetBlipSprite(blip3, -570710357, 1)
	SetBlipSprite(blip4, -570710357, 1)
	SetBlipSprite(blip5, -570710357, 1)	
else end
Citizen.CreateThread(function()
while true do
	Wait(0)
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Point1.x, Config.Point1.y, Config.Point1.z, true)
	local betweencoords2 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Point2.x, Config.Point2.y, Config.Point2.z, true)
	local betweencoords3 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Point3.x, Config.Point3.y, Config.Point3.z, true)
	local betweencoords4 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Point4.x, Config.Point4.y, Config.Point4.z, true)
	local betweencoords5 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Point5.x, Config.Point5.y, Config.Point5.z, true)	
	if betweencoords <= 1.0 and not gathering and isFarmer then
		if gather1 == false then
			DrawTxt(Config.StartGather, 0.50, 0.90, 0.5, 0.5, true, 161, 3, 0, 255, true)
			if IsControlJustPressed(0, 0xC7B5340A) and not gathering and not gather1 then
				task1 = true
				startGathering(1)
				gather1 = true
				RemoveBlip(blip1)
			end
		end
	elseif betweencoords2 <= 1.0 and not gathering and isFarmer then
		if gather2 == false then
			DrawTxt(Config.StartGather, 0.50, 0.90, 0.5, 0.5, true, 161, 3, 0, 255, true)
			if IsControlJustPressed(0, 0xC7B5340A) and not gathering and not gather2 then
				task1 = true
				startGathering(1)
				gather2 = true
				RemoveBlip(blip2)
			end
		end
	elseif betweencoords3 <= 1.0 and not gathering and isFarmer then
		if gather3 == false then
			DrawTxt(Config.StartWatering, 0.50, 0.90, 0.5, 0.5, true, 161, 3, 0, 255, true)
			if IsControlJustPressed(0, 0xC7B5340A) and not gathering and not gather3 then
				task3 = true
				startGathering(1)
				gather3 = true
				RemoveBlip(blip3)
			end
		end		
	elseif betweencoords4 <= 1.0 and not gathering and isFarmer then
		if gather4 == false then
			DrawTxt(Config.StartFeeding, 0.50, 0.90, 0.5, 0.5, true, 161, 3, 0, 255, true)
			if IsControlJustPressed(0, 0xC7B5340A) and not gathering and not gather4 then
				task2 = true
				startGathering(1)
				gather4 = true
				RemoveBlip(blip4)
			end
		end
	else end
	end
end)
end
  	function modelrequest( model )
    Citizen.CreateThread(function()
        RequestModel( model )
    end)
end
function startGathering(count)
local playerPed = PlayerPedId()
local coords = GetEntityCoords(playerPed)
local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Center.x, Config.Center.y, Config.Center.z, true)
if betweencoords <= Config.DistanceFromCenter and not gathering and isFarmer and started then -- SECURITY
	pressing = false
	FreezeEntityPosition(playerPed, true)
	if task1 == true then
	  RequestAnimDict("amb_work@world_human_hammer@wall@male_a@trans")
    while not HasAnimDictLoaded("amb_work@world_human_hammer@wall@male_a@trans") do
        Wait(100)
    end
		TaskPlayAnim(playerPed, "amb_work@world_human_hammer@wall@male_a@trans", Config.GatheringAnim, 8.0, -8.0, Config.GatheringTime, 1, 0, true, 0, false, 0, false)
	elseif task2 == true then
		  RequestAnimDict("amb_work@world_human_hammer@wall@male_a@trans")
    while not HasAnimDictLoaded("amb_work@world_human_hammer@wall@male_a@trans") do
        Wait(100)
    end
		TaskPlayAnim(playerPed, "amb_work@world_human_hammer@wall@male_a@trans", Config.GatheringAnim2, 8.0, -8.0, Config.GatheringTime, 1, 0, true, 0, false, 0, false)
	elseif task3 == true then
		  RequestAnimDict("amb_work@world_human_hammer@ground@male_a@idle_c")
    while not HasAnimDictLoaded("amb_work@world_human_hammer@ground@male_a@idle_c") do
        Wait(100)
    end
		TaskPlayAnim(playerPed, "amb_work@world_human_hammer@ground@male_a@idle_c", Config.GatheringAnim3, 8.0, -8.0, Config.GatheringTime, 1, 0, true, 0, false, 0, false)
	end
	local timer = GetGameTimer()+Config.GatheringTime
	if isFarmer and started then
		TriggerEvent("redemrp_notification:start", Config.TimerMsg, 9.5)
	Citizen.CreateThread(function()
		while timer >= GetGameTimer() do
		Wait(0)
		gathering = true
		--DrawTxt(Config.TimerMsg .. " " .. tonumber(string.format("%.0f", (((GetGameTimer() - timer) * -1)/1000))), 0.50, 0.90, 0.5, 0.5, true, 161, 3, 0, 255, true)
			end
		ClearPedTasksImmediately(PlayerPedId())
		FreezeEntityPosition(playerPed, false)
		gathering = false
		task1 = false
		task2 = false
		finished = finished + count
		--print(finished)
		if isFarmer and started and finished < Config.NeededPoints then
		elseif isFarmer and started and finished >= Config.NeededPoints then
		math.randomseed(GetGameTimer())
		local payout = math.random(Config.MinCash,Config.MaxCash)
        local xp = math.random(Config.MinExp,Config.MaxExp)
		TriggerServerEvent('redmscrp_communityservice:addMoney', payout, xp)
		TriggerEvent("redemrp_notification:start", "You have earned $" .. payout .. ' & ' .. xp .. 'xp', 5)
			finished = 0
			isFarmer = false
			started = false
			gather1 = false
			gather2 = false
			gather3 = false
			gather4 = false
		else end
		end)
	else end
else end
end