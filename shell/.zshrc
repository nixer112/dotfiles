fastfetch

# 1. P10k Instant Prompt (Mantener siempre arriba)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path a Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

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

# 6. Carga de configuración de P10k (Mantener siempre al final)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
