RegisterNetEvent('pixel-fountain:removeCoin', function ()
    exports.ox_inventory:RemoveItem(source, 'money', 1)
end)