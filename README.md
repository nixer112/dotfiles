# 🏯 Kanagawa Dotfiles | Arch Linux + Hyprland

<div align="center">
  <img src="screenshots/desktop.png" alt="Desktop Preview" width="100%">
  
  <p align="center">
    <img src="https://img.shields.io/badge/OS-Arch_Linux-blue?logo=arch-linux&logoColor=white" alt="Arch Linux">
    <img src="https://img.shields.io/badge/WM-Hyprland-33ccff?logo=hyprland&logoColor=white" alt="Hyprland">
    <img src="https://img.shields.io/badge/Terminal-Ghostty-white?logo=ghostty&logoColor=black" alt="Ghostty">
    <img src="https://img.shields.io/badge/Editor-Neovim-548439?logo=neovim&logoColor=white" alt="Neovim">
    <img src="https://img.shields.io/badge/Editor-Vscodium-f2f2f2?logo=vscodium&logoColor=black" alt="VSCodium">
    <img src="https://img.shields.io/badge/Shell-Zsh-f2f2f2?logo=gnuzsh&logoColor=white" alt="Zsh">
  </p>

  **Configuración minimalista, productiva y centrada en el esquema de colores Kanagawa.**
</div>

---

## 🎨 Galería
Aquí puedes ver cómo luce el sistema con diferentes aplicaciones abiertas:

<div align="center">
  <table>
    <tr>
      <td><img src="screenshots/codium_brave.png" width="400"><br align="center">Codium + Brave</td>
      <td><img src="screenshots/desktop.png" width="400"><br align="center">Escritorio limpio</td>
    </tr>
    <tr>
      <td><img src="screenshots/terminal_stuff.png" width="400"><br align="center">TUI Apps</td>
      <td><img src="screenshots/swaync.png" width="400"><br align="center">Swaync Details</td>
    </tr>
  </table>
</div>

---

## 🛠️ Stack Tecnológico

| Componente | Herramienta |
| :--- | :--- |
| **OS** | [Arch Linux](https://archlinux.org/) |
| **WM** | [Hyprland](https://hyprland.org/) (Wayland) |
| **Terminal** | [Ghostty](https://ghostty.org/) |
| **Barra** | [Waybar](https://github.com/Alexays/Waybar) |
| **Lanzador** | [Wofi](https://hg.sr.ht/~scoopta/wofi) |
| **Editor** | [Neovim](https://github.com/neovim/neovim) (Lua config) / [VSCodium](https://vscodium.com/) |
| **Shell** | Zsh + Oh My Zsh + Powerlevel10k |
| **Utilidades** | Bat, Eza, Zoxide, Fzf, Atuin |

---

## 📂 Estructura del Repositorio
El repositorio está organizado para ser gestionado fácilmente con **GNU Stow**:

* `config/`: Contiene las configuraciones para Hyprland, Waybar, Ghostty y Wofi.
* `scripts/`: Scripts personalizados para automatización y ricing.
* `shell/`: Configuración de Zsh, alias y plugins.
* `screenshots/`: Capturas de pantalla del sistema.

---

## 🚀 Instalación

> [!CAUTION]
> Antes de ejecutar el instalador, asegúrate de hacer un respaldo de tus configuraciones actuales.

### 1. Clonar el repositorio
```bash
git clone [https://github.com/nixer112/dotfiles.git](https://github.com/nixer112/dotfiles.git) ~/dotfiles
cd ~/dotfiles
