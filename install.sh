#!/bin/bash

# Colores para la terminal
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Iniciando instalación de dotfiles... ${NC}"

# Crear carpeta .config si no existe
mkdir -p ~/.config

# stow -v (verbose) -R (recursive) -t (target)
# Linkeamos lo que hay dentro de la carpeta 'config' a ~/.config
stow -v -R -t ~/.config config

# Linkeamos lo que hay en 'shell' al HOME
# stow -v -R -t ~ shell

echo -e "${GREEN}¡Todo listo! Enlaces creados.${NC}"
