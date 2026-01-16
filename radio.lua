local speaker = GetPart("Speaker")
local microphone = GetPart("Microphone")
local players = require("players")
local modem = GetPart("Modem")
local microc = GetPartFromPort(1, "Microcontroller")
local hardware = microc.Code
local check
local Version = "V2.6"
local UpdateLog = "Made the speaker bigger so it can stand, Made cool music when connecting to the modem"

print("Version: "..Version)
print("Update log: "..UpdateLog)

speaker:Chat("[Loading communicator. this takes up to 5 seconds!]")
Beep(2)
task.wait(math.random(3,5))

speaker:Chat("[COMMUNICATOR LOADED.]")
Beep(2)
task.wait(0.5)
speaker:Chat("[DO NOT SPAM. THANK YOU.]")
Beep(2)
task.wait(0.7)
speaker:Chat("[OBS: Please look into your console for tagged messages (it prints every single message)]")
print("[OBS: Please look into your console for tagged messages (it prints every single message)")
Beep(2)
task.wait(0.5)
speaker:Chat("[PLEASE LINK THE ©Communicator 3000 TO A MODEM TO RECEIVE UPDATES. THANK YOU.]")
print("[PLEASE LINK THE ©Communicator 3000 TO A MODEM TO RECEIVE UPDATES. THANK YOU.]")
Beep(2)

local function Modem()
    local updt = 0
    local upd = 0
    if modem then
        check = 1
        modem.NetworkID = "Comm3000"
        modem.MessageSent:Connect(function(txt)
            txt = tostring(txt:gsub("\n", ""))
            local table = txt:split(" && ")
            for i, lines in table do
	    	    local tokens = string.split(lines, " ")
	    	    local confirmation = tokens[1]
	    	    local update = { unpack(tokens, 2) }
                if confirmation == "update:" then
                    if microc.Code == update then
                        

                        if upd == 0 then
                            print("A update request got sent but you are already on the latest. Nice!")
                            upd = 1
                        end

                    else
                        if updt == 0 then
                            print(txt)
                            print("[System]: Update is ready! please restart the radio/communicator when you are ready!")
                            speaker:Chat("[System]: Update is ready! please restart the radio/communicator when you are ready!")
                            Beep(2)
                            task.wait(0.1)
                            microc.Code = tostring(tokens[2])
                            updt = 1
                        end
                    end
                    

                    
                end

            end

        end)
    end
end


microphone.Chatted:Connect(function(plr, text)
    local usern = players:GetUsername(plr)

    local message = "["..usern.."]: "..text

    speaker:Chat(message)
    print("~~~~~~~~~~~~~~~~")
    print(plr)
    print(message)
    print("~~~~~~~~~~~~~~~~")
    Beep(1)
end)
local upd = 0 
local check = 0
while task.wait(1) do 
    modem = GetPart("Modem")
    
    if modem then
        if upd == 0 then
            upd = 1
            print("Modem connected!")
            Beep(1)
            task.wait(0.1)
            Beep(2)
            task.wait(0.1)
            Beep(3)
            task.wait(0.1)
            Beep(5)
            task.wait(0.2)
            Beep(3)
            task.wait(0.1)
            Beep(5)
            Modem()
        end
    else
        if upd == 1 then
            upd = 0
            print("Modem disconnected!")
            Beep(1)
            task.wait(0.1)
            Beep(0.8)
            task.wait(0.1)
            Beep(0.6)
        end
    end
    if check == 0 then
        print("Please connect this device to a modem to recieve further updates! (EXTRA: Reset the device when connected to Modem)")
        check = 1
    end

end

