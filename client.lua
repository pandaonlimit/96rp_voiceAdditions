local isMuted = false
LocalPlayer.state.isMuted = isMuted

RegisterCommand('toggleMuteButton', function()
    isMuted = not isMuted
    TriggerServerEvent('muteButton:toggleMutePlayerServer', isMuted)
    SendNUIMessage({isMuted = isMuted})
    LocalPlayer.state.isMuted = isMuted
end, false)

RegisterKeyMapping('toggleMuteButton', 'Mute button', 'keyboard', Config.MuteKey)

CreateThread(function()
    local lastRadius = -1
    local lastPlayerVehicleState = false
    while true do
        local radius = LocalPlayer.state.proximity.distance
        local playerPedId = PlayerPedId()
        if lastRadius ~= radius then
            lastRadius = radius
            if Config.NativeAudioActivated then
                radius = radius * 7.5
            end
            if Config.Marker.show then
                CreateThread(function()
                    local timeLeft = Config.Marker.showTime * 100
                    while timeLeft >= 0 and lastRadius == radius do
                        local pedCoords = GetEntityCoords(playerPedId)
                        DrawMarker(Config.Marker.type, pedCoords.x, pedCoords.y, pedCoords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, radius, radius, 0.5, Config.Marker.r, Config.Marker.g, Config.Marker.b, 50, false, false, 2, nil, nil, false)
                        timeLeft = timeLeft - 1
                        Wait(0)
                    end
                end)
            end

            if Config.RangeText.show then
                SendNUIMessage({range = radius})
            end
        end
        if Config.RangeText.changePositionInsideVehicle then
            local vehicle = GetVehiclePedIsIn(playerPedId, false)
            local currentPlayerVehicleState = IsPedInVehicle(playerPedId, vehicle, false)
            local sendNUI = true
            if lastPlayerVehicleState ~= currentPlayerVehicleState then
                lastPlayerVehicleState = currentPlayerVehicleState
                if Config.RangeText.changePositionOnlyForDriver and GetPedInVehicleSeat(vehicle, -1) ~= playerPedId and currentPlayerVehicleState == 1  then
                    sendNUI = false
                end
                if sendNUI then
                    SendNUIMessage({playerIsInVehicle = currentPlayerVehicleState})
                end
            end
        end
        Wait(100)
    end
end)