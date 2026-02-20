-- ~/.config/nvim/lua/plugins/sidekick.lua
return {
  -- Sidekick
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          backend = "zellij", -- o "tmux" si prefieres
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>"
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        desc = "Select CLI",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        desc = "Sidekick Prompt Picker",
      },
    },
  },

  -- Snacks (recomendado para picker/prompts)
  {
    "folke/snacks.nvim",
    opts = {}, -- usa valores por defecto o personaliza aquí
  },

  -- treesitter textobjects (usa la rama main)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- registra el servidor 'copilot' en la configuración LSP (mergea con la configuración existente)
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.copilot = {
        cmd = { "copilot-language-server", "--stdio" },
        filetypes = { "*" },
      }
    end,
  },

  -- (opcional) copilot helper plugin — facilita autenticación/suggestions
  {
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function()
      require("copilot.api").status = require("copilot.status")
      require("copilot.api").filetypes = {
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
      }
    end,
  },
}
