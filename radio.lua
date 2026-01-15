local speaker = GetPart("Speaker")
local microphone = GetPart("Microphone")
local players = require("players")
local modem = GetPart("Modem")
local microc = GetPartFromPort(1, "Microcontroller")
local hardware = microc.Code


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
        check = 1
        modem.NetworkID = "Comm3000"
        modem.MessageSent:Connect(function(txt)
            print(txt)
            local table = txt:split(" && ")
            for i, lines in table do
	    	    local tokens = string.split(lines, " ")
	    	    local confirmation = tokens[1]
	    	    local update = { unpack(tokens, 2) }
                print(update)
                if confirmation == "update" then
                    if hardware == microc.Code then
                        

                        if upd == 0 then
                            print("A update request got sent but you are already on the latest. Nice!")
                            upd = 1
                        end

                    else
                        print("[System]: Update is ready! please restart the radio/communicator when you are ready!")
                        speaker:Chat("[System]: Update is ready! please restart the radio/communicator when you are ready!")
                        Beep(2)
                        task.wait(0.1)
                        hardware = update
                    end
                    

                    
                end

            end

        end)
    end

    if check == 0 then
        print("Please connect this device to a modem to recieve further updates!")
        check = 1
    end

end

