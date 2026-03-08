local status_ok, theme_bridge = pcall(require, "theme_bridge")
local current_theme = status_ok and theme_bridge or "kanagawa-wave"

return {
  -- 1. CATPPUCCIN
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      term_colors = true,
    },
  },

  -- 2. GRUVBOX (¡Este era el que te faltaba!)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true, -- Mantiene la transparencia de tu setup
      })
    end,
  },

  -- 3. KANAGAWA BLUR
  {
    "Gentleman-Programming/gentleman-kanagawa-blur",
    name = "gentleman-kanagawa-blur",
    priority = 1000,
  },

  -- 4. OLDWORLD
  {
    "Alan-TheGentleman/oldworld.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- 5. KANAGAWA (Tu configuración detallada)
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    lazy = true,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none",
                bg_sidebar = "none",
                bg_float = "none",
              },
            },
          },
        },
        overrides = function(colors)
          return {
            LineNr = { bg = "none" },
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            TelescopeNormal = { bg = "none" },
            TelescopeBorder = { bg = "none" },
            LspInfoBorder = { bg = "none" },
          }
        end,
        theme = "wave",
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
    end,
  },

  -- 6. LAZYVIM OVERRIDE (Aplica el tema de forma dinámica)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = current_theme,
    },
  },
}
