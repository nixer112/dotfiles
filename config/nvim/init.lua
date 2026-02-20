-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Activa el modo de auto-guardado global de Neovim
vim.o.autowriteall = true

-- Crea un AutoComando para guardar silenciosamente el archivo
-- al salir del modo insertar o al modificar texto.
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedP" }, {
  pattern = "*", -- Aplica a todos los archivos
  callback = function()
    -- Guarda el buffer actual silenciosamente
    vim.cmd("silent! write")
  end,
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "angularls", "ts_ls" } -- ts_ls es necesario para que Angular funcione bien
})

local lspconfig = require('lspconfig')

-- Configuración específica para Angular
lspconfig.angularls.setup({
  -- Esto ayuda a Neovim a encontrar la raíz del proyecto Angular
  root_dir = lspconfig.util.root_pattern("angular.json", "nx.json", "package.json"),
})

-- Es vital tener configurado también TypeScript para que se comuniquen
lspconfig.ts_ls.setup({})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.component.html"},
  callback = function()
    vim.opt.filetype = "html.angular" -- Ayuda al LSP a identificar plantillas de Angular
  end,
})
