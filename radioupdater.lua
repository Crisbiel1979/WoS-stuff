local modem = GetPart("Modem")
local RECmodem = "Comm3000"
local SENmodem = "Comm3000UPDATER"
modem.NetworkID = RECmodem
print("ONLINE")

local update = "update: https://raw.githubusercontent.com/Crisbiel1979/WoS-stuff/refs/heads/main/radio.lua" 



while task.wait(5) do
    modem.SendMessage(RECmodem, update)
end
