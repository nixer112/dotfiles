fastfetch

# 1. P10k Instant Prompt (Mantener siempre arriba)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path a Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Path a .local/bin
export PATH="$HOME/.local/bin:$PATH"

# Java / Android
export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Flutter
export PATH=$PATH:$HOME/development/flutter/bin
export PATH="/home/nico/miniconda/bin:$PATH"

# Conda (esto suele añadirlo el instalador automáticamente, 
# pero asegúrate de que esté en tu .zshrc del repo)

# 2. Configuración del Tema (Solo una vez)
ZSH_THEME="powerlevel10k/powerlevel10k"

# 3. Plugins (Añadí los más útiles para Arch/Dev)
# Nota: git ya viene con OMZ. Los otros dos se instalan vía pacman o git clone.
plugins=(
    git 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    sudo
)

source $ZSH/oh-my-zsh.sh

# 4. Inicialización de herramientas (Zoxide, Atuin, etc.)
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)" # Descomenta si usas atuin

# 5. Tus Aliases Personales (Añadí algunos para gestionar tus dotfiles)
alias dots='cd ~/dotfiles'
alias ls='eza --icons --group-directories-first' # Si tienes 'exa' o 'eza' instalado
alias cat='bat --paging=never'

# >>> conda initialize >>>
__conda_setup="$('/home/nico/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nico/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nico/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nico/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# 6. Carga de configuración de P10k (Mantener siempre al final)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# opencode
export PATH=/home/nico/.opencode/bin:$PATH
