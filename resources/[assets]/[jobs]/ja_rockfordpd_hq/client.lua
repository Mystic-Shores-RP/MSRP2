--[[ 

    /$$$$$  /$$$$$$        /$$$$$$$                      /$$                              
   |__  $$ /$$__  $$      | $$__  $$                    |__/                              
      | $$| $$  \ $$      | $$  \ $$  /$$$$$$   /$$$$$$$ /$$  /$$$$$$  /$$$$$$$   /$$$$$$$
      | $$| $$$$$$$$      | $$  | $$ /$$__  $$ /$$_____/| $$ /$$__  $$| $$__  $$ /$$_____/
 /$$  | $$| $$__  $$      | $$  | $$| $$$$$$$$|  $$$$$$ | $$| $$  \ $$| $$  \ $$|  $$$$$$ 
| $$  | $$| $$  | $$      | $$  | $$| $$_____/ \____  $$| $$| $$  | $$| $$  | $$ \____  $$
|  $$$$$$/| $$  | $$      | $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$|  $$$$$$$| $$  | $$ /$$$$$$$/
 \______/ |__/  |__/      |_______/  \_______/|_______/ |__/ \____  $$|__/  |__/|_______/ 
                                                             /$$  \ $$                    
                                                            |  $$$$$$/                    
                                                             \______/                        

Author: Luthous
Discord: discord.gg/jadesigns
Website: https://jadesignsfivem.com/ ]]


-- DO NOT EDIT THIS SCRIPT, KEYBINDS AND DESTINATIONS CAN BE CHANGED IN THE CONFIG FILE --
-- IF YOU SPOT A BUG OR AN ERROR, PLEASE RAISE WITH THE JA DESIGNS SUPPORT TEAM! --

local MenuPool = NativeUI.CreatePool()
local elevatorMenus = {}
local currentElevator = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local nearElevator = false

        for _, elevator in pairs(Config.Elevators) do
            for _, access in pairs(elevator.accessPoints) do
                local distance = #(playerCoords - vector3(access.x, access.y, access.z))
                
                if distance < 1.5 then
                    nearElevator = true
                    currentElevator = elevator
                    DrawText3D(access.x, access.y, access.z + 1.0, "~g~Press E to use the elevator")
                    
                    if IsControlJustReleased(0, 38) then -- 'E' key
                        OpenElevatorMenu(elevator)
                    end
                end
            end
        end

        if not nearElevator then
            currentElevator = nil
        end

        MenuPool:ProcessMenus()
    end
end)

function OpenElevatorMenu(elevator)
    local menu = NativeUI.CreateMenu("Elevator", "Select a floor")
    MenuPool:Add(menu)

    for _, floor in pairs(elevator.floors) do
        local button = NativeUI.CreateItem(floor.label, "Go to " .. floor.label)
        menu:AddItem(button)

        button.Activated = function(_, selectedItem)
            if selectedItem == button then
                TeleportPlayer(floor.coords)
                MenuPool:CloseAllMenus()
            end
        end
    end

    menu:Visible(true)
end

function TeleportPlayer(coords)
    DoScreenFadeOut(500)
    Citizen.Wait(500)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, false)
    Citizen.Wait(500)
    DoScreenFadeIn(500)
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
