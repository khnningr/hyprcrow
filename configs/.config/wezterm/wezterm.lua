-- https://github.com/linuxmobile/hyprland-dots/blob/Sakura/.config/wezterm/wezterm.lua

local wezterm = require("wezterm")
local home = wezterm.home_dir
--wezterm.add_to_config_reload_watch_list("/tmp/issue1036/colors/wezterm-wal.toml")
--wezterm.add_to_config_reload_watch_list(home .. "/.cache/wal/wezterm-wal.toml")
wezterm.add_to_config_reload_watch_list(home .. "/.config/wezterm/colors/wezterm-wal.toml")
return {
	font = wezterm.font("Mononoki Nerd Font"),
	font_size = 16.0,
	--color_scheme = "batman",
	enable_wayland = true,
	window_background_opacity = 0.95,
	use_fancy_tab_bar = false,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	--color_scheme_dirs = { home .. "/.cache/wal" },
	--color_scheme_dirs = { "/tmp/issue1036/colors" },
	color_scheme = "wezterm-wal",
	automatically_reload_config = true,
}

-- Pywal
-- https://github.com/wez/wezterm/issues/1036
