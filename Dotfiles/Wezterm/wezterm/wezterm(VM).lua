-- https://github.com/linuxmobile/hyprland-dots/blob/Sakura/.config/wezterm/wezterm.lua

local wezterm = require("wezterm")
local home = wezterm.home_dir
wezterm.add_to_config_reload_watch_list(home .. "/.config/wezterm/colors/wezterm-colors.toml")
return {
	font = wezterm.font("IosevkaTerm Nerd Font"),
	font_size = 16.0,
	enable_wayland = true,
	window_background_opacity = 0.95,
	use_fancy_tab_bar = false,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "wezterm-colors",
	automatically_reload_config = true,
	front_end = "Software" -- "Renderiza con CPU en lugar de GPU"
}

-- Pywal
-- https://github.com/wez/wezterm/issues/1036
