local wezterm = require("wezterm")

-- wezterm default config
local config = wezterm.config_builder()

-- initial gemetry for new windows
config.initial_cols = 120
config.initial_rows = 28

-- fonts
config.font = wezterm.font_with_fallback{
  "BlexMono Nerd Font Mono",
  "Fira Code Nerd Font",
  "Fira Code",
}
config.font_size = 14

-- color scheme Catppuccin Mocha
config.color_scheme = 'Catppuccin Mocha'

-- wezterm tabs
local wezterm_tabs_config = {
  tabs = {
    tab_bar_at_bottom = true
  },
  ui = {
    separators = {
      -- Powerline-style solid arrow pointing left
      arrow_solid_left = '\u{e0b0}',

      -- Powerline-style solid arrow pointing right
      arrow_solid_right = '\u{e0b2}',

      -- Powerline-style thin arrow pointing left
      arrow_thin_left = '\u{e0b1}',

      -- Powerline-style thin arrow pointing right
      arrow_thin_right = '\u{e0b3}',
    }
  },
  -- NOTE: don't work, idk why?
  icons = {
    -- Development Tools
    ['debug'] = wezterm.nerdfonts.cod_debug_console,
    ['cargo'] = wezterm.nerdfonts.dev_rust,
    ['git'] = wezterm.nerdfonts.dev_git,
    ['go'] = wezterm.nerdfonts.seti_go,
    ['lua'] = wezterm.nerdfonts.seti_lua,
    ['node'] = wezterm.nerdfonts.md_hexagon,

    -- Shells and Terminals
    ['bash'] = wezterm.nerdfonts.cod_terminal_bash,
    ['zsh'] = wezterm.nerdfonts.dev_terminal,

    -- Text Editors
    ['nvim'] = wezterm.nerdfonts.custom_vim,
    ['vim'] = wezterm.nerdfonts.dev_vim,

    -- Container and Cloud Tools
    ['docker'] = wezterm.nerdfonts.linux_docker,
    ['docker-compose'] = wezterm.nerdfonts.linux_docker,
    ['kubectl'] = wezterm.nerdfonts.linux_docker,

    -- Utilities
    ['curl'] = wezterm.nerdfonts.md_waves,
    ['gh'] = wezterm.nerdfonts.dev_github_badge,
    ['make'] = wezterm.nerdfonts.seti_makefile,
    ['sudo'] = wezterm.nerdfonts.fa_hashtag,
    ['wget'] = wezterm.nerdfonts.md_arrow_down_box,
    ['lazygit'] = wezterm.nerdfonts.dev_github_alt,
  }
}

wezterm.plugin
  .require('https://github.com/yriveiro/wezterm-tabs')
  .apply_to_config(config, wezterm_tabs_config)

return config

