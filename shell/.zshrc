if [[ -t 1 && -z "$FASTFETCH_DONE" ]]; then
  export FASTFETCH_DONE=1
  fastfetch
fi

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
# Añadir herramientas al PATH
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
# Flutter
export PATH=$PATH:$HOME/development/flutter/bin
# export PATH="/home/nico/miniconda/bin:$PATH"  # commented out by conda initialize

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
[[ $- == *i* ]] && eval "$(atuin init zsh)"

# 5. Tus Aliases Personales (Añadí algunos para gestionar tus dotfiles)
alias dots='cd ~/dotfiles'
alias ls='eza --icons --group-directories-first' # Si tienes 'exa' o 'eza' instalado
alias cat='bat --paging=never'

# Lazy load conda (rápido)
conda() {
  unset -f conda
  source /home/nico/miniconda/etc/profile.d/conda.sh
  conda "$@"
}

# 6. Carga de configuración de P10k (Mantener siempre al final)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# opencode
export PATH=/home/nico/.opencode/bin:$PATH
