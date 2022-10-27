-- The following code was made by Varatros. Please don't reupload this or edit it.
-- If you have any suggestions, open an issue at my github: https://github.com/Varatros/Scripts

-- Warning, this script is highly vulnerable because it can allow users to run any code on a computer.
-- If you have a custom os that limits user permissions and such, don't use this script as it bypasses any security.

local input = read()
local eval, err = loadstring("return " .. input) 
if err then print("Could not evaluate. " .. err) end
print("="..eval().."\n")
shell.run("calculator.lua")
