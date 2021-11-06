Citizen.CreateThread(function()
	local isSniper = false
	while true do
		Citizen.Wait(0)

    	local ped = GetPlayerPed(-1)

		local currentWeaponHash = GetSelectedPedWeapon(ped)

		if currentWeaponHash == 100416529 then
			isSniper = true
		elseif currentWeaponHash == 205991906 then
			isSniper = true
		elseif currentWeaponHash == -952879014 then
			isSniper = true
		elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
			isSniper = true
		else
			isSniper = false
		end

		if not isSniper then
			HideHudComponentThisFrame(14)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if muteStockChat then
			local player = PlayerId()
			DisableControlAction(0, 249, true) -- N key

			if NetworkIsPlayerTalking(player) then
				SetPlayerTalkingOverride(player, false)
			end

		end
	end
end)


RegisterCommand("crosshair", function(source, args, rawCommand)
	if args[1] == "off" then
		local isSniper = false
		while true do
			Citizen.Wait(0)

			local ped = GetPlayerPed(-1)
			local currentWeaponHash = GetSelectedPedWeapon(ped)
			

			if currentWeaponHash == 100416529 then
				isSniper = true
			elseif currentWeaponHash == 205991906 then
				isSniper = true
			elseif currentWeaponHash == -952879014 then
				isSniper = true
			elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
				isSniper = true
			
			elseif currentWeaponHash == GetHashKey('WEAPON_stungun') then
				isSniper = true

			else
				isSniper = false
			end

			if not isSniper then
				HideHudComponentThisFrame(14)
			end
		end
	elseif args[1] == "on" then
		local isSniper = nil
		while true do
			Citizen.Wait(0)

			local ped = PlayerPedId()
			local currentWeaponHash = GetSelectedPedWeapon(ped)
			
			if IsPlayerFreeAiming() == false then
				isSniper = false
			elseif currentWeaponHash == GetHashKey("weapon_unarmed") then
				isSniper = true
			else 
				isSniper = false
			end

			if isSniper then
				HideHudComponentThisFrame(14)
			else 
				ShowHudComponentThisFrame(14)
			end
		end
	end
end, false)