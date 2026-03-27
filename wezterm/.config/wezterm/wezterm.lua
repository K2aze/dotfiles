local wezterm = require("wezterm")

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

local config = {
  color_scheme = "Catppuccin Mocha",
  font = wezterm.font("FiraCode Nerd Font"),
  font_size = 14,
  window_background_opacity = 0.9,
  text_background_opacity = 1.0,
  initial_cols = 140,
  initial_rows = 38,
  keys = {
    {
      key = "v",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SplitHorizontal {},
    },
    {
      key = "s",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SplitVertical {},
    },
    {
      key = "h",
      mods = "CTRL",
      action = wezterm.action.ActivatePaneDirection "Left",
    },
    {
      key = "l",
      mods = "CTRL",
      action = wezterm.action.ActivatePaneDirection "Right",
    },
    {
      key = "k",
      mods = "CTRL",
      action = wezterm.action.ActivatePaneDirection "Up",
    },
    {
      key = "j",
      mods = "CTRL",
      action = wezterm.action.ActivatePaneDirection "Down",
    },
    {
      key = "w",
      mods = "CTRL|SHIFT",
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
      key = "Delete",
      mods = "NONE",
      action = wezterm.action.SendString("\x1b[3~"),
    },
    {
      key = "c",
      mods = "CTRL",
      action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
    },
    {
      key = "v",
      mods = "CTRL",
      action = wezterm.action.PasteFrom("Clipboard"),
    },
  },
  colors = {
    tab_bar = {
      background = "#fff"
    }
  }
}


config.allow_win32_input_mode = false
config.enable_kitty_keyboard = true

-- config.window_decorations = "RESIZE"
-- config.hide_tab_bar_if_only_one_tab = true

bar.apply_to_config(
  config, {
    position = "top",
    padding = {
      left = 2,
      right = 2,
      tabs = {
        left = 8,
        right = 8,
      }
    },
  }
)

return config
