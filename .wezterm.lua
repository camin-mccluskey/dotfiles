-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "rose-pine-moon"
config.font = wezterm.font({ family = "FiraCode Nerd Font Mono", weight = "Medium" })
config.font_size = 11
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.show_tabs_in_tab_bar = true
config.use_fancy_tab_bar = true
config.window_padding = {
	top = "2cell",
	bottom = "0cell",
	left = "0cell",
	right = "0cell",
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- and finally, return the configuration to wezterm
return config
