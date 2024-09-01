require("gears")
--[[
#BmaF616A
#D08770
#EBCB8B
#A3BE8C
#B48EAD


#8FBCBB
#88C0D0
#81A1C1
#5E81AC

#D8DEE9
#E5E9F0
#ECEFF4

#2E3440
#3B4252
#434C5E
#4C566A
--]]
---------------------------
-- Default awesome theme --
---------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}
theme.font = "FiraCode Nerd Font Mono"
theme.taglist_font = "FiraCodeMono Nerd Font Mono 12"
theme.tasklist_font = "FiraCodeMono Nerd Font Mono 12"
theme.bg_active_tag = "#BF616A"
theme.bg_normal = "#2E3440BB"
theme.bg_focus = "#EBCB8B"
theme.bg_urgent = "#D08770"
theme.bg_minimize = "#2E344000"
theme.bg_systray = theme.bg_normal

theme.tasklist_bg_focus = "#88C0D000"
theme.tasklist_fg_focus = "#D8DEE9"

theme.tasklist_bg_normal = "#45858800"
theme.tasklist_fg_normal = "#4C566A"

theme.taglist_bg_focus = "#88C0D0DD"
theme.taglist_fg_focus = "#88C0D0DD"

theme.taglist_fg_empty = "#5E81AC95"
-- theme.taglist_bg_empty =  "#f9f5d744"

theme.taglist_fg_occupied = "#ECEFF4"

theme.menu_bg_focus = "#ECEFF4"
theme.menu_bg_normal = "#4C566AEE"

theme.menu_fg_focus = "#4C566A"
theme.menu_fg_normal = "#ECEFF4EE"

theme.taglist_shape = function(cr, width, height)
	gears.shape.partially_rounded_rect(cr, 45, 2, false, false, false, false, 5)
end

theme.taglist_spacing = 3

theme.fg_normal = "#f9f5d7"
theme.fg_focus = "#ffd700"

theme.fg_urgent = "#f9f5d7"
theme.fg_minimize = "#fbf1c7"

theme.useless_gap = dpi(5)
theme.border_width = dpi(2)
theme.border_margin = dpi(0)
theme.border_normal = "#434c5e"
theme.border_focus = "#7aadbb"
theme.border_marked = "#ff241d00"

-- notification
theme.notification_font = "FiraCode Nerd Font Mono 9"
theme.notification_fg = "#fbf1c7"
theme.notification_bg = "#434c5e"
theme.notification_border_color = "#7aadbb"
theme.notification_opacity = 0.8
theme.notification_shape = gears.shape.rounded_rect

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = "/usr/share/icons/breeze-dark/actions/24/go-next.svg"
theme.menu_height = dpi(25)
theme.menu_width = dpi(150)
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path .. "default/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
