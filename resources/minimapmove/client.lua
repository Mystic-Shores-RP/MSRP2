local dragging = false
local minimap = { x = -0.05, y = -0.05, w = 0.20, h = 0.25 }

-- Apply minimap continuously
CreateThread(function()
    while true do
        SetMinimapComponentPosition('minimap', 'C', 'B', minimap.x, minimap.y, minimap.w, minimap.h)
        SetMinimapComponentPosition('minimap_mask', 'C', 'B', minimap.x + 0.20, minimap.y + 0.20, 0.20, 0.20)
        SetMinimapComponentPosition('minimap_blur', 'C', 'B', minimap.x, minimap.y, minimap.w + 0.06, minimap.h + 0.05)
        Wait(0)
    end
end)

-- Command to enable drag mode
RegisterCommand('movemap', function()
    if not dragging then
        dragging = true
        SetNuiFocus(true, true)
        SendNUIMessage({ action = "startDrag", x = minimap.x, y = minimap.y })
    end
end, false)

-- NUI callback when finished dragging
RegisterNUICallback("finishDrag", function(data, cb)
    dragging = false
    SetNuiFocus(false, false)

    minimap.x = tonumber(data.x)
    minimap.y = tonumber(data.y)

    print(("[Minimap] New position: x=%.2f y=%.2f"):format(minimap.x, minimap.y))
    cb("ok")
end)
