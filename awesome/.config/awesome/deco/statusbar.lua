-- Standard awesome library
-- local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
-- local logout_popup = require("awesome-wm-widgets.logout-menu-widget.logout-menu")

local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")

-- local spotify = require("awesome.awesome-wm-widgets.spotify-widget.spotify.")
-- /home/robel/.config/awesome/awesome-wm-widgets/logout-menu-widget/logout-menu.lua
-- /home/robel/.config/awesome/awesome-wm-widgets/spotify-widget/spotify.lua
-- /home/robel/.config/awesome/awesome-wm-widgets/spotify-shell/
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local mpdarc_widget = require("awesome-wm-widgets.mpdarc-widget.mpdarc")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
-- local net_widget         = require("awesome-wm-widgets.net-speed-widget.net-speed")
local logout_popup = require("awesome-wm-widgets.logout-popup-widget.logout-popup")
local gears = require("gears")
local awful = require("awful")
--local mpc   = require("mpc-widget")
-- Wibox handling library
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Custom Local Library: Common Functional Decoration
local deco = {
	taglist = require("deco.taglist"),
	tasklist = require("deco.tasklist"),
}

local taglist_buttons = deco.taglist()
local tasklist_buttons = deco.tasklist()

local cw = calendar_widget({
	theme = "nord",
	placment = "bottom_right",
	start_sunday = false,
	radius = 8,
})

-- local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
-- volLevel = awful.widget.watch('bash -c "pulsemixer --get-volume"', 15)
--awful.spawn.easy_async_with_shell(command, function()
local function run(command)
	local prog = io.popen(command)
	local result = prog:read("*all")
	prog:close()
	return result
end

-- volLevel = awful.spawn.shell("pulsemixer --get-mute")
local volLevel = run("pulsemixer --get-volume | awk '{ print substr($0, 0, 2) }'")
-- volLevel = 'text'
local myBar = wibox.widget({
	{
		-- max_value = 1,
		value = 0.9,
		forced_height = 20,
		forced_width = 100,
		padding = 1,
		boarder_width = 1,
		color = "#ffeeee",
		bg_color = "#ffeeee",
		shape = gears.shape.rounded_bar,
		progressbar_bg = beautiful.progressbar_bg,
		fontSize = 18,
		-- bar_corder_color = '#83a598aa',
		background_color = "#83a598aa",
		-- beautiful.progressbar_bg = '#ff7788',
		-- fg_color= "#ffff77",
		widget = wibox.widget.progressbar,
	},
	-- {
	--   text = (string.match(volLevel, "%d+").. '%'),
	--   color = '#f9f5d7',
	--   -- fg_color = '#f9f5d7 ',
	--   valign = "center",
	--   align = 'center',
	--   widget = wibox.widget.textbox,
	-- },
	layout = wibox.layout.stack,
})
local mpc_wg = awful.widget.watch('bash -c "mpc current --format="[%title%]""', 1)
local vol_wg = awful.widget.watch('bash -c "pulsemixer --get-volume| cut -c1-2"', 0.1)
local mytextclock = wibox.widget.textclock()

mytextclock:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		cw.toggle()
	end
end)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		-- filter  = awful.widget.tasklist.filter.currenttags,
		filter = awful.widget.tasklist.filter.focused,
		buttons = tasklist_buttons,
		layout = {
			spacing = 10,
			spacing_widget = {
				{
					forced_width = 2,
					shape = gears.shape.rectangle,
					widget = wibox.widget.separator,
				},
				valign = "center",
				halign = "center",
				widget = wibox.container.place,
			},
			layout = wibox.layout.flex.horizontal,
		},
		widget_template = {
			{
				{
					{
						{
							id = "icon_role",
							widget = wibox.widget.imagebox,
						},
						margins = 4,
						widget = wibox.container.margin,
					},
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = 5,
				right = 20,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
		},
	})

	-- s.tasklist_minimized = awful.widget.tasklist({
	-- 	screen = s,
	-- 	filter = awful.widget.tasklist.filter.minimizedcurrenttags,
	-- 	buttons = tasklist_buttons,
	-- 	layout = {
	-- 		spacing = 2,
	-- 		spacing_widget = {
	-- 			{
	-- 				forced_width = 2,
	-- 				shape = gears.shape.rectangle,
	-- 				widget = wibox.widget.separator,
	-- 			},
	-- 			valign = "center",
	-- 			halign = "center",
	-- 			widget = wibox.container.place,
	-- 		},
	-- 		layout = wibox.layout.flex.horizontal,
	-- 	},
	-- 	widget_template = {
	-- 		{
	-- 			{
	-- 				{
	-- 					{
	-- 						id = "icon_role",
	-- 						widget = wibox.widget.imagebox,
	-- 					},
	-- 					margins = 1,
	-- 					widget = wibox.container.margin,
	-- 				},
	-- 				layout = wibox.layout.fixed.horizontal,
	-- 			},
	-- 			widget = wibox.container.margin,
	-- 		},
	-- 		id = "background_role",
	-- 		widget = wibox.container.background,
	-- 	},
	-- })

	-- text = " Minimized Tasks",
	-- Create a button widget
	local task_button = wibox.widget({
		{
			text = " Minimized",
			widget = wibox.widget.textbox,
		},
		widget = wibox.container.background,
	})

	-- Create a popup widget
	local task_popup = awful.popup({
		widget = {},
		border_color = beautiful.border_color,
		border_width = beautiful.border_width,
		ontop = true,
		visible = false,
		shape = gears.shape.rounded_rect,
		maximum_width = 300,
	})

	-- Function to update the popup with minimized tasks
	local function update_task_popup()
		local minimized_clients = {}
		for _, c in ipairs(client.get()) do
			if c.minimized then
				table.insert(minimized_clients, c)
			end
		end

		local task_widgets = {
			layout = wibox.layout.fixed.vertical,
			{
				text = " Minimized Tasks",
				widget = wibox.widget.textbox,
			},
		}

		for _, c in ipairs(minimized_clients) do
			local task_item = wibox.widget({
				{
					{
						image = c.icon,
						resize = true,
						widget = wibox.widget.imagebox,
						maximum_width = 20,
					},
					{
						text = c.name,
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.align.horizontal,
				},
				widget = wibox.container.background,
				bg = beautiful.bg_normal,
				shape = gears.shape.rounded_rect,
				forced_height = 20, -- Set the height of the list item
				-- forced_width = 180, -- Set the width of the list item
			})

			task_item:connect_signal("mouse::enter", function()
				task_item.bg = "#5E81AC"
			end)

			task_item:connect_signal("mouse::leave", function()
				task_item.bg = beautiful.bg_normal
			end)

			task_item:buttons(awful.button({}, 1, function()
				c.minimized = false
				c:raise()
				task_popup.visible = false
			end))

			table.insert(task_widgets, task_item)
		end
		task_popup:setup(task_widgets)
	end

	-- Show the popup when the button is clicked
	task_button:buttons(awful.button({}, 1, function()
		update_task_popup()
		if task_popup.visible then
			task_popup.visible = not task_popup.visible
		else
			task_popup.visible = not task_popup.visible
			task_popup:move_next_to(mouse.current_widget_geometry)
		end
	end))
	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			-- RC.launcher,
			s.mypromptbox,
			s.mytaglist,
		},
		-- layout = wibox.layout.align.horizontal("left"),
		s.mytasklist, -- Middle widget

		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			-- myBar,
			task_button,
			s.tasklist_minimized,
			mpdarc_widget,
			spotify_widget({
				font = "sans 9",
				play_icon = "/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg",
				pause_icon = "/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg",
			}),
			-- cpu_widget(),
			volume_widget({ widget_type = "icon_and_text" }),
			-- volume_widget{widget_type = 'horizontal_bar'},
			-- fs_widget({mounts = {'/', '/home/robel'}}),
			fs_widget(),
			-- mykeyboardlayout,
			wibox.widget.systray(),
			-- net_widget(),
			mytextclock,
			s.mylayoutbox,
			-- logout_menu_widget(),
			-- logout_menu_widget {
			--   font = 'Play 10',
			--   onlock = function() awful.spawn.with_shell('i3lock-fancy') end
			-- },
			logout_popup.widget(),
			-- logout_popup.widget{
			--  phrases = {"exit(0)", "Don't forget to be awesome.", "Yippee ki yay!"},
			-- },
		},
	})
end)
-- }}}
