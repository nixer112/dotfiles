-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local vim = vim

-- Disable key mappings in insert mode

vim.api.nvim_set_keymap("i", "<A-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Nop>", { noremap = true, silent = true })

-- Disable key mappings in normal mode
vim.api.nvim_set_keymap("n", "<A-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<Nop>", { noremap = true, silent = true })

-- Disable key mappings in visual block mode
vim.api.nvim_set_keymap("x", "<A-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-k>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "J", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "K", "<Nop>", { noremap = true, silent = true })

-- 1. IMPORTAR TU MÓDULO PERSONALIZADO
-- 'require("custom.cmake_runner")' busca el archivo en:
-- 'lua/custom/cmake_runner.lua-- ~/.config/nvim/lua/config/keymaps.lua

-- 1. IMPORTAR TU MÓDULO INTELIGENTE
-- (Cambiamos 'cmake_runner' por 'smart_runner')
local runner = require("custom.smart_runner")

-- 2. ASIGNAR A F4
-- (Cambiamos la función que se llama a 'runner.run')
vim.keymap.set("n", "<F4>", runner.run, {
  desc = "Ejecutar (Context-Aware)",
})

-- (El resto de tus keymaps...)
