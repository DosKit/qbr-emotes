local menuLocation, menuSize = 'topright', 'size-125'

local mainMenu = MenuV:CreateMenu(false, 'Emote Menu', menuLocation, 220, 20, 60, menuSize, 'qbcore', 'menuv', 'test1')
CreateThread(function()
    local commands = {}
    for k in pairs(Config.EmoteList) do
        local label = k..'Options'
        local label = MenuV:CreateMenu(false, k, menuLocation, 220, 20, 60, menuSize, 'qbcore', 'menuv', k)
        mainMenu:AddButton({label = k, value = label, description = k..' Emotes'})
        label:On('open', function(menu)
            menu:ClearItems()
            for l, n in pairs(Config.EmoteList[k]) do
                menu:AddButton({
                    label = l,
                    description = ('/e %s'):format(string.gsub(l, "%s", "-"):lower()),
                    select = function()
                        ExecuteCommand(('e %s'):format(string.gsub(l, "%s", "-"):lower()))
                    end
                })
                local anim = string.gsub(l, "%s", "-")
                commands[anim:lower()] = n
            end
        end)
    end
    RegisterCommand('e', function(source, args)
        if not args[1] or not commands[args[1]] then return end
        Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(),1,2,joaat(commands[args[1]]),0,1,1,0,0)
    end)
end)

RegisterCommand('em', function()
    MenuV:OpenMenu(mainMenu)
end)
