-- The following code was made by Varatros. Please don't reupload this or edit it.
-- If you have any suggestions, open an issue at my github: https://github.com/Varatros/Scripts

local function centerText(text, y)
    local x,_ = term.getSize()
    term.setCursorPos(math.ceil((x/2) - (text:len()/2)), y)
    write(text)
end

local function writePos(text, x, y)
    term.setCursorPos(x, y)
    write(text)
end

local numbers = {
    one = "1",
    two = "2",
    three = "3",
    four = "4",
    five = "5",
    six = "6",
    seven = "7",
    eight = "8",
    nine = "9",
    zero = "0"
}

term.clear()
centerText("Please enter your 4 digit pin:", 7)
centerText("- - - -", 11)

local inputCount = 0
local input = ""
local comboCount = 0
local timer = os.startTimer(15)

while true do
    local event, param1, param2, param3 = os.pullEventRaw()
    -- if event == 'key_up' then
    --     local key = keys.getName(param1)
    --     if (key == 'leftCtrl') or (key == 'leftAlt') or (key == 'g') then
    --         comboCount = comboCount - 1
    --     end
    -- end

    if event == 'timer' then
        local completed = param1
        if completed == timer then
            os.shutdown()
        end
    end

    if event == 'key' then
        timer = os.startTimer(15)
        local key = keys.getName(param1)
        if numbers[key] then
            input = input .. numbers[key]
            inputCount = inputCount + 1
        -- elseif (key == 'leftCtrl') or (key == 'leftAlt') or (key == 'g') then
        --     comboCount = comboCount + 1
        end
        
        if inputCount == 1 then
            tools.centerText("X      ", 10)
        elseif inputCount == 2 then
            tools.centerText("X X    ", 10)
        elseif inputCount == 3 then
            tools.centerText("X X X  ", 10)
        elseif inputCount == 4 then
            tools.centerText("X X X X", 10)
            if input == "0122" then
                tools.centerText("Password correct, opening door...", 13)
                redstone.setOutput("left", true)
                pcall(sleep, 3)
                redstone.setOutput("left", false)
                os.shutdown()
            -- elseif input == "0000" then
            --     tools.centerText("Password correct, logging in...", 13)
            -- redstone.setOutput("left", true)
            -- pcall(sleep, 3)
            -- redstone.setOutput("left", false)
            else
                tools.centerText("Password incorrect, try again!", 13)
                pcall(sleep, 1)
                input = ""
                inputCount = 0
                tools.centerText("       ", 10)
                term.setCursorPos(1, 13)
                term.clearLine()
            end
        end
    end

    -- if comboCount == 3 then
    --     sleep(3)
    --     if comboCount == 3 then
    --         term.clear()
    --         term.setTextColor(colors.red)
    --         tools.centerText("Program Terminated", 2)
    --         term.setTextColor(colors.white)
    --         term.setCursorPos(1, 4)
    --         return
    --     end
    -- end
end
