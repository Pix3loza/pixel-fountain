
Citizen.CreateThread(function ()
    for i = 1, #Config.fountain do
        local fountain = Config.fountain[i]
        exports.ox_target:addSphereZone({
            coords = fountain.coords,
            name = 'fountain',
            radius = fountain.radius,
            debug = fountain.debug,
            options = {
                {
                    label = Translate['target_label'],
                    icon = 'fa-solid fa-coins',
                    onSelect = function ()
                        CoinInsert()
                    end
                }
            }
        }) 
    end
end) 


function CoinInsert()
    local count = exports.ox_inventory:Search('count', 'money')
    local omen = math.random(1, #Config.fortunetelling) 
    if count >= 1 then
        lib.playAnim(cache.ped, "anim_heist@hs3f@ig13_fortune_teller_door@male@", "coin_drop") 
        TriggerServerEvent('pixel-fountain:removeCoin')
        lib.notify({
            title = Translate['omen'],
            description = Config.fortunetelling[omen],
            type = 'error'
        })
    else
        lib.playAnim(cache.ped, "mp_missheist_countrybank@nervous", "nervous_idle")
        lib.notify({
            title = Translate['not_enough_cash_title'],
            description = Translate['not_enough_cash_description'],
            type = 'error'
        })
    end
end




