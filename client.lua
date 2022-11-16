local curWeapon = nil
local ox_inventory = exports.ox_inventory
local ped = cache.ped
local playerLoaded = false
local Weapons = {
    [`weapon_assaultshotgun`] = { object = `w_sg_assaultshotgun`, item = 'WEAPON_ASSAULTSHOTGUN', rot = vector3(0,0,0)},
    [`weapon_combatpdw`] = { object = `w_sb_pdw`, item = 'WEAPON_COMBATPDW', rot = vector3(0,0,0)},
    [`weapon_pumpshotgun`] = {object = `w_sg_pumpshotgun`, item = 'WEAPON_PUMPSHOTGUN', rot = vector3(0,0,0)},
    [`weapon_assaultrifle`] = {object = `w_ar_assaultrifle`, item = 'WEAPON_ASSAULTRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_590`] = {object = `w_sg_590`, item = 'WEAPON_590', rot = vector3(0,0,0)},
    [`WEAPON_SWEEPERSHOTGUN`] = {object = `w_sg_sweeper`, item = 'WEAPON_SWEEPERSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_SPECIALCARBINE_MK2`] = {object = `w_ar_specialcarbinemk2`, item = 'WEAPON_SPECIALCARBINE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_M4`] = {object = `w_ar_m4`, item = 'WEAPON_M4', rot = vector3(0,0,0)},
    [`WEAPON_M16`] = {object = `w_ar_m16`, item = 'WEAPON_M16', rot = vector3(0,0,0)},
    [`WEAPON_AR15`] = {object = `w_ar_ar15`, item = 'WEAPON_AR15', rot = vector3(0,0,0)},
    [`WEAPON_SPECIALCARBINE`] = {object = `w_ar_specialcarbine`, item = 'WEAPON_SPECIALCARBINE', rot = vector3(0,0,0)},
    [`WEAPON_SNIPERRIFLE`] = {object = `w_sr_sniperrifle`, item = 'WEAPON_SNIPERRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_SMG_MK2`] = {object = `w_sb_smgmk2`, item = 'WEAPON_SMG_MK2', rot = vector3(0,0,0)},
    [`WEAPON_SMG`] = {object = `w_sb_smg`, item = 'WEAPON_SMG', rot = vector3(0,0,0)},
    [`WEAPON_PUMPSHOTGUN_MK2`] = {object = `w_sg_pumpshotgunmk2`, item = 'WEAPON_PUMPSHOTGUN_MK2', rot = vector3(0,0,0)},
    [`WEAPON_POOLCUE`] = {object = `w_me_poolcue`, item = 'WEAPON_POOLCUE', rot = vector3(0,92.5,0)},
    [`WEAPON_MUSKET`] = {object = `w_ar_musket`, item = 'WEAPON_MUSKET', rot = vector3(0,0,0)},
    [`WEAPON_MILITARYRIFLE`] = {object = `w_ar_specialcarbine`, item = 'WEAPON_MILITARYRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_MG`] = {object = `w_mg_mg`, item = 'WEAPON_MG', rot = vector3(0,0,0)},
    [`WEAPON_MARKSMANRIFLE_MK2`] = {object = `w_sr_marksmanriflemk2`, item = 'WEAPON_MARKSMANRIFLE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_MARKSMANRIFLE`] = {object = `w_sr_marksmanrifle`, item = 'WEAPON_MARKSMANRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_HEAVYSNIPER`] = {object = `w_sr_heavysniper`, item = 'WEAPON_HEAVYSNIPER', rot = vector3(0,0,0)},
    [`WEAPON_HEAVYSHOTGUN`] = {object = `w_sg_heavyshotgun`, item = 'WEAPON_HEAVYSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_GOLFCLUB`] = {object = `w_me_golfclub`, item = 'WEAPON_GOLFCLUB', rot = vector3(0,92.5,0)},
    [`WEAPON_FIREEXTINGUISHER`] = {object = `w_am_fire_exting`, item = 'WEAPON_FIREEXTINGUISHER', rot = vector3(0,92.5,0)}, 
    [`WEAPON_CROWBAR`] = {object = `w_me_crowbar`, item = 'WEAPON_CROWBAR', rot = vector3(0,92.5,0)},
    [`WEAPON_COMPACTRIFLE`] = {object = `w_ar_assaultrifle_smg`, item = 'WEAPON_COMPACTRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_COMBATSHOTGUN`] = {object = `w_sg_pumpshotgunh4`, item = 'WEAPON_COMBATSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_MPX`] = {object = `w_ar_mpx`, item = 'WEAPON_MPX', rot = vector3(0,0,0)},
    [`WEAPON_UZI`] = {object = `w_sb_uzi`, item = 'WEAPON_UZI', rot = vector3(0,0,0)},
    [`WEAPON_MP7`] = {object = `w_sb_mp7`, item = 'WEAPON_MP7', rot = vector3(0,0,0)},
    [`WEAPON_COMBATMG_MK2`] = {object = `w_mg_combatmgmk2`, item = 'WEAPON_COMBATMG_MK2', rot = vector3(0,0,0)},
    [`WEAPON_COMBATMG`] = {object = `w_mg_combatmg`, item = 'WEAPON_COMBATMG', rot = vector3(0,0,0)},
    [`WEAPON_CARBINERIFLE_MK2`] = {object = `w_ar_carbineriflemk2`, item = 'WEAPON_CARBINERIFLE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_CARBINERIFLE`] = {object = `w_ar_carbinerifle`, item = 'WEAPON_CARBINERIFLE', rot = vector3(0,0,0)},
    [`WEAPON_BULLPUPSHOTGUN`] = {object = `w_sg_bullpupshotgun`, item = 'WEAPON_BULLPUPSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_BULLPUPRIFLE_MK2`] = {object = `w_ar_bullpupriflemk2`, item = 'WEAPON_BULLPUPRIFLE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_BULLPUPRIFLE`] = {object = `w_ar_bullpuprifle`, item = 'WEAPON_BULLPUPRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_BATTLEAXE`] = {object = `w_me_battleaxe`, item = 'WEAPON_BATTLEAXE', rot = vector3(0,92.5,0)},
    [`WEAPON_BAT`] = {object = `w_me_bat`, item = 'WEAPON_BAT', rot = vector3(0,92.5,0)},
    [`WEAPON_ASSAULTSMG`] = {object = `w_sb_assaultsmg`, item = 'WEAPON_ASSAULTSMG', rot = vector3(0,0,0)},
    [`WEAPON_ASSAULTRIFLE_MK2`] = {object = `w_ar_assaultriflemk2`, item = 'WEAPON_ASSAULTRIFLE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_ADVANCEDRIFLE`] = {object = `w_ar_advancedrifle`, item = 'WEAPON_ADVANCEDRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_RPG`] = {object = `w_lr_rpg`, item = 'WEAPON_RPG', rot = vector3(0,0,0)}
}

local slots = {
    [1] = {
        pos = vec3(0.13, -0.19, -0.04), -- Center Of Back
        entity = nil,
        hash = nil,
        wep = nil
    },
    [2] = {
        pos = vec3(0.13, -0.15, -0.16), -- Center-Right
        entity = nil,
        hash = nil,
        wep = nil
    },
    [3] = {
        pos = vec3(0.13, -0.15, 0.07), -- Center-Left
        entity = nil,
        hash = nil,
        wep = nil
    },
}

local function clearSlot(i)
    DetachEntity(slots[i].entity)
    DeleteEntity(slots[i].entity)
    slots[i].entity = nil
    slots[i].hash = nil
    slots[i].wep = nil
end

local function removeFromSlot(hash)
    if Weapons[hash] == nil then return end
    local whatItem = Weapons[hash].item
    local count = ox_inventory:Search(2, whatItem)
    for i = 1, #slots do
        if slots[i].hash == hash then
            if not count or count <= 0 or hash == curWeapon then
                clearSlot(i)
            end
        end
    end
end

local function removeWeapon(hash)
    if Weapons[hash] then
        removeFromSlot(hash)
    end
end

local function removeFromInv(hash)
    removeFromSlot(hash)
end

local function checkForSlot(hash)
    for i = 1, #slots do
        if slots[i].hash == hash then return false end
    end
    for i = 1, #slots do
        local slot = slots[i]
        if not slot.entity then
            return i
        end
    end
    return false
end


local function putOnBack(hash)
    local whatSlot = checkForSlot(hash)
    if whatSlot then
        curWeapon = nil
        local object = Weapons[hash].object
        local item = Weapons[hash].item
        lib.requestModel(object, 500)
        local coords = GetEntityCoords(ped)
        local prop = CreateObject(object, coords.x, coords.y, coords.z,  true,  true, true)
        slots[whatSlot].entity = prop
        slots[whatSlot].hash = hash
        slots[whatSlot].wep = item
        AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 24816), slots[whatSlot].pos.x, slots[whatSlot].pos.y, slots[whatSlot].pos.z, Weapons[hash].rot.x, Weapons[hash].rot.y, Weapons[hash].rot.z, true, true, false, true, 2, true)
    end
end

local function respawningCheckWeapon()
    for i = 1, #slots do
        local slot = slots[i]
        if slot.entity ~= nil then
            if DoesEntityExist(slot.entity) then
                DeleteEntity(slot.entity)
            end
            local whatItem = Weapons[slot.hash].item
            local count = ox_inventory:Search(2, whatItem)
            local oldHash = slot.hash
            slots[i].entity = nil
            slots[i].hash = nil
            if count > 0 then
                putOnBack(oldHash)
            end
        end
    end
end

AddEventHandler('ox_inventory:currentWeapon', function(data)
    if data then
        if Weapons[data.hash] then
            putOnBack(curWeapon)
            curWeapon = data.hash
            removeWeapon(data.hash)
        end
    else
        if curWeapon then
            putOnBack(curWeapon)
        end
    end
end)



AddEventHandler('ox_inventory:updateInventory', function(changes)
    playerLoaded = true
    for k, v in pairs(changes) do
        if type(v) == 'table' then
            local hash = joaat(v.name)
            if Weapons[hash] then
                if curWeapon ~= hash then
                    putOnBack(hash)
                else
                    removeFromInv(hash)
                end
            end
        end
        if type(v) == 'boolean' then
            for i = 1, #slots do
                local count = ox_inventory:Search(2, slots[i].wep)
                if not count or count <= 0 then
                    removeFromInv(slots[i].hash)
                end
            end
        end
    end
end)

lib.onCache('vehicle', function(value)
    if value then
        for i = 1, #slots do
            clearSlot(i)
        end
    else
        if GetResourceState('ox_inventory') ~= 'started' or not playerLoaded then return end
        for k, v in pairs(Weapons) do
            local count = ox_inventory:Search(2, v.item)
            if count and count >= 1 then
                putOnBack(k)
            end
        end
    end
end)

lib.onCache('ped', function(value)
    ped = value
end)



