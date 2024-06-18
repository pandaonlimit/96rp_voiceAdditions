RegisterNetEvent('muteButton:toggleMutePlayerServer', function(isMuted)
    MumbleSetPlayerMuted(source, isMuted)
end)