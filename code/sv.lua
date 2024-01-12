ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- RegisterServerEvent(Config.ServerEventName)
-- AddEventHandler(Config.ServerEventName, function(itemName, count)
-- 	local _source = source
-- 	local xPlayer = ESX.GetPlayerFromId(_source)
--  	xPlayer.addInventoryItem (Config.ItemReward,Config.Count)
-- end)


versionChecker = true -- Set to false to disable version checker

-- ห้ามแตะ
resourcename = "Adam_SafeZone"
version = "1.0.1"
-- rawVersionLink = "https://raw.githubusercontent.com/taxaoch/Adam_Safezone/blob/main/version.txt"
rawVersionLink = "https://raw.githubusercontent.com/taxaoch/Adam_Safezone/main/version.txt"

-- Check for version updates.
if versionChecker then
Wait(5000)

PerformHttpRequest(rawVersionLink, function(errorCode, result, headers)
    if (string.find(tostring(result), version) == nil) then
        print("\n\r[".. GetCurrentResourceName() .."] ^1WARNING: Your version is too old. ".. resourcename .." Please update.\n\r")
-- 
    else
        print("\n\r[".. GetCurrentResourceName() .."] ^2You are running the latest version of ".. resourcename ..".\n\r")
    end
-- end, "GET", "", "")
    end)
    Wait(10000)
    print('^0[^3 Script version = "1.0.1" ]')
    print('^0[^6 Script Modifiedr By Adam^0] ^8Script => ^2ON ')
    print('^0[^6 Script Modifiedr By Adam^0] ^8Script => ^2ON ')
    print('^0[^6 Script Modifiedr By Adam^0] ^8Script => ^2ON ')
    print('^0[^6 Script Modifiedr By Adam^0] ^8Script => ^2ON ')

end



-- -- GET_CURRENT_RESOURCE_NAME
-- local retval --[[ string ]] =
-- 	GetCurrentResourceName()





