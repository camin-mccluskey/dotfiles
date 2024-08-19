-- Pull in the wezterm API
local wezterm = require("wezterm")
local theme = require("lua/rose-pine").moon

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- config.color_scheme = "rose-pine-moon"
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.window_background_opacity = 0.5
config.macos_window_background_blur = 25
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
-- config.enable_tab_bar = false
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.colors = theme.colors()
config.window_frame = theme.window_frame()
config.window_frame.font = wezterm.font("FiraCode Nerd Font Mono")
-- config.window_frame.active_titlebar_bg = "rgba(35, 33, 55, 0.5)"
-- config.colors.tab_bar.background = "rgba(35,33,55,0.5)"

-- and finally, return the configuration to wezterm
return config
