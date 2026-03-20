local wezterm = require("wezterm")

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

local config = {
  default_cwd = "D:\\",
  color_scheme = "Catppuccin Mocha",
  font = wezterm.font("FiraCode Nerd Font"),
  font_size = 14,
  use_fancy_tab_bar = true,
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
  }
}


config.default_prog = {
  -- for PowerShell 7 preview
  [[C:\Program Files\PowerShell\7-preview\pwsh.exe]],
  '-NoExit',
  '-NoLogo',
  '-Command',
  [[& {
        Import-Module "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\Microsoft.VisualStudio.DevShell.dll";
        Enter-VsDevShell c615014b -SkipAutomaticLocation -DevCmdArguments "-arch=x64 -host_arch=x64"
    }]]
}

config.allow_win32_input_mode = false
config.enable_kitty_keyboard = true

config.window_decorations = "RESIZE"
-- config.hide_tab_bar_if_only_one_tab = true

-- example enable spotify module

-- example enable spotify module
bar.apply_to_config(
  config,
  {
    position = "top",
    padding = {
      left = 2,
      right = 2,
      tabs = {
        left = 8,
        right = 8,
      }
    }
  }
)

return config
