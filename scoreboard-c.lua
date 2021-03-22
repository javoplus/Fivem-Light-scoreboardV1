local boollist = false

Citizen.CreateThread(function ()
    while true do
        Wait(0)
        boollist = false
        --(arrow up) for open scoreboard
        if IsControlJustReleased(0, 27) then
            if not boollist then 
            SetNuiFocus(true, true)    
                local plist = {}
                local playert = GetActivePlayers()
                for _, i in ipairs(playert) do
                    local p_ped = GetPlayerPed(i)
                    --(get player info) from all active players
                    local p_name = GetPlayerName(i)
                    local p_id = GetPlayerServerId(i)
                    local p_money = GetPedMoney(p_ped)
                    --insert data players in table
                    table.insert(plist, '<div id=\"bplayers\"> ' .. p_name .. '<span id=\"tiptext\"><i class=\"fas fa-file-signature\"></i>' .. p_name .. '<br><i class=\"fas fa-id-card\"></i> ' .. p_id .. '<br><i class=\"fas fa-money-check-alt\"></i> $' .. p_money .. '</span></div>')
                end     
                --send info players to html
                SendNUIMessage({ info = table.concat(plist) })
                boollist = true
            end
        end
    end
end)

--get data back from html (js)
RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    SendNUIMessage({ casemenue = 'closeit' })
end)