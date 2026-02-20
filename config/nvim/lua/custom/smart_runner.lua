-- ~/.config/nvim/lua/custom/smart_runner.lua

local M = {}

---
-- Helper para ejecutar comandos en un terminal flotante.
-- (Sin cambios)
---
local function run_in_terminal(command_str)
  local Terminal = require("lazy.core.config").spec.plugins["toggleterm.nvim"]
  if Terminal and Terminal.loaded then
    require("toggleterm").toggle(0, nil, nil, "float", command_str)
  else
    vim.cmd("vsplit | terminal " .. command_str)
  end
end

---
-- Función principal "Smart Runner"
---
function M.run()
  local file_ext = vim.fn.expand("%:e")  -- ej: "py"
  local file_path = vim.fn.expand("%:p") -- ej: /home/nico/proy/main.py
  local command_to_run = ""

  -- ==========================
  -- LÓGICA DE DECISIÓN
  -- ==========================
  
  if file_ext == "py" then
    command_to_run = "python3 " .. file_path
    run_in_terminal(command_to_run)

  elseif file_ext == "js" then
    command_to_run = "node " .. file_path
    run_in_terminal(command_to_run)

  -- ======================================================
  -- INICIO: NUEVA LÓGICA MEJORADA PARA C++
  -- ======================================================
  elseif file_ext == "cpp" or file_ext == "h" or file_ext == "hpp" then
    
    -- Verificamos si existe un CMakeLists.txt en el directorio
    -- raíz desde donde se lanzó Neovim.
    if vim.fn.filereadable("CMakeLists.txt") == 1 then
      
      -- Opción 1: SÍ HAY CMakeLists.txt (Es un PROYECTO)
      -- Usamos el script de proyecto que ya teníamos.
      print("Proyecto CMake detectado. Ejecutando script de proyecto...")
      vim.ui.input({ prompt = "Argumentos C++ (opcional): " }, function(args)
        args = args or ""
        local home = vim.fn.expand("~")
        local script_path = home .. "/.local/bin/compile_and_run"
        command_to_run = script_path .. " " .. args
        run_in_terminal(command_to_run)
      end)
      
    else
      
      -- Opción 2: NO HAY CMakeLists.txt (Es un ARCHIVO SIMPLE)
      -- Compilamos y ejecutamos directamente con g++.
      print("Archivo C++ simple detectado. Compilando y ejecutando...")
      
      -- Usamos /tmp/ para no ensuciar el directorio actual
      -- Usamos el PID de Neovim para un nombre de binario único
      local tmp_binary = "/tmp/nvim_runner_" .. vim.fn.getpid()
      
      -- Compilamos con g++, y si tiene éxito (&&), lo ejecutamos.
      command_to_run = string.format(
        "g++ -std=c++20 -Wall -Wextra -o %s %s && %s",
        tmp_binary, -- El binario de salida
        file_path,  -- El archivo .cpp de entrada
        tmp_binary  -- El comando a ejecutar
      )
      run_in_terminal(command_to_run)
    end
  -- ======================================================
  -- FIN: NUEVA LÓGICA MEJORADA PARA C++
  -- ======================================================

  else
    -- Comportamiento por defecto (si estás en un README.md, etc.)
    -- Sigue siendo útil que el 'else' lance el runner de proyecto.
    print("Tipo de archivo no gestionado. Asumiendo acción de proyecto C++...")
    vim.ui.input({ prompt = "Argumentos C++ (opcional): " }, function(args)
      args = args or ""
      local home = vim.fn.expand("~")
      local script_path = home .. "/.local/bin/compile_and_run"
      command_to_run = script_path .. " " .. args
      run_in_terminal(command_to_run)
    end)
  end
end

return M
