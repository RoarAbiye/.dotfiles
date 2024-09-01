pcall(require, "luarocks.loader")
local awful = require("awful")
require("awful.autofocus")
local menubar = require("menubar")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
RC = {}
require("awful.hotkeys_popup.keys")

-- Libraries from config folder
require("main.error-handling")
require("main.user-variables")

-- local t = awful.screen.focused().selected_tag.name
-- naughty.notify({ title = "Achtung!", text = t, timeout = 10 })

RC.vars = require("main.user-variables")
modkey = RC.vars.modkey
terminal = RC.vars.terminal

local main = {
	layouts = require("main.layouts"),
	tags = require("main.tags"),
	menu = require("main.menu"),
	rules = require("main.rules"),
}
local binding = {
	globalbuttons = require("bindings.globalbuttons"),
	clientbuttons = require("bindings.clientbuttons"),
	globalkeys = require("bindings.globalkeys"),
	bindtotags = require("bindings.bindtotags"),
	clientkeys = require("bindings.clientkeys"),
}

--Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

--{image = beautiful.awesome_icon, menu = RC.mainmenu }

RC.mainmenu = awful.menu({ items = main.menu() })
RC.launcher = awful.widget.launcher({ image = "/home/robel/.config/awesome/images/724557.png", menu = RC.mainmenu })
menubar.utils.terminal = RC.vars.terminal

--{{{
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)
--}}}

root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

require("main.signals")

-- Wibar
require("deco.statusbar")
-- require("deco.titlebar")

-- Auto-Run
local autorun = true

local autorunApps = {
	"feh --bg-fill ./Pictures/wallpaper/* -z",
	"ibus-daemon -drxR",
	"udiskie",
	"pgrep -x sxhkd > /dev/null || sxhkd -c $HOME/.config/sxhkd/sxhkdrc.awesome",
	"pgrep -x kmix > /dev/null || kmix",
	"pgrep -x picom > /dev/null || picom",
	"pgrep -x emacs > /dev/null || emacs --daemon",
	"pgrep -x nm-applet > /dev/null || nm-applet --daemon",
	"pgrep -x mpd > /dev/null || mpd /home/robel/.config/mpd/mpd.conf",
	"pgrep -x syncthing > /dev/null ||  syncthing --no-browser",
}
if autorun then
	for app = 1, #autorunApps do
		-- awful.util.spawn(autorunApps[app])
		awful.spawn.with_shell(autorunApps[app])
	end
end
