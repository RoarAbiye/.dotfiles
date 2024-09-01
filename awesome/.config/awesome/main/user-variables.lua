local beautiful = require("beautiful")
local theme = require("themes.mytheme.theme")

local _M = {
    beautiful.init(theme),
    terminal = "kitty",
    modkey = "Mod4",
}

beautiful.widget_main_color  = "#88C0D0"
return _M
