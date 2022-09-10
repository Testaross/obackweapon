# obackweapon
I stole this from Kallocks Discord 
https://discord.gg/CUKzxyYvyt

https://kallock.tebex.io/
He is a great dev, buy his stuff. I took this from his discord so it was easier to share. I converted it to ox_core
per his instructions, here is what you need.

In Ox_inventory > data > weapons.lua ANY weapon you want to show on your back you need to add this to
```
-- add = function()
--  exports['obackweapon']:putOnBack(`WEAPONNAME`)
-- end,
-- remove = function()
--     exports['obackweapon']:removeFromInv(`WEAPONNAME`)
-- end

```
Edit your weapons to follow the structure shown here
```
        ['WEAPON_HEAVYSHOTGUN'] = {
            label = 'Heavy Shotgun',
            weight = 7000,
            durability = 0.1,
            ammoname = 'ammo-shotgun',
            client = {
                add = function()
                    exports['obackweapon']:putOnBack(`WEAPON_HEAVYSHOTGUN`)
                end,
                remove = function()
                    exports['obackweapon']:removeFromInv(`WEAPON_HEAVYSHOTGUN`)
                end
            }
        },

        ['WEAPON_HEAVYSNIPER'] = {
            label = 'Heavy Sniper',
            weight = 7000,
            durability = 0.5,
            ammoname = 'ammo-rifle',
            client = {
                add = function()
                    exports['obackweapon']:putOnBack(`WEAPON_HEAVYSNIPER`)
                end,
                remove = function()
                    exports['obackweapon']:removeFromInv(`WEAPON_HEAVYSNIPER`)
                end
            }
        },


        ['WEAPON_RPG'] = {
            label = 'RPG Launcher',
            weight = 7000,
            durability = 0.5,
            ammoname = 'ammo-rpg',
            client = {
                add = function()
                    exports['obackweapon']:putOnBack(`WEAPON_RPG`)
                end,
                remove = function()
                    exports['obackweapon']:removeFromInv(`WEAPON_RPG`)
                end
            }
        },
