#!/bin/bash

# Metemos unos colorines para destacar los avisos
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Función que usa command para comprobar si lo que vamos a instalar existe ya
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Función de printeo de frase de instalación
print_message() {
    echo -e "${GREEN}$1${NC}"
}

print_message "Actualizando Homebrew..."
brew update

# Instalación de neovim (si aun no lo tenemos, usar la ver. más reciente)
if command_exists nvim; then
    echo -e "${YELLOW}Neovim ya está instalado${NC}"
else
    print_message "Instalando Neovim..."
    brew install neovim
fi

# Instalamos Node
if command_exists node; then
    echo -e "${YELLOW}Node ya está instalado${NC}"
else
    print_message "Instalando Node..."
    brew install node
fi

# Instalamos ripgrep y fd, super útil para buscador luego dentro de archivos
if command_exists rg; then
    echo -e "${YELLOW}ripgrep ya está instalado${NC}"
else
    print_message "Instalando ripgrep..."
    brew install ripgrep
fi

if command_exists fd; then
    echo -e "${YELLOW}fd ya está instalado${NC}"
else
    print_message "Instalando fd..."
    brew install fd
fi

# (Para WSL y también alguna distro) Instalamos cosas para el compilador de GNU...
if command_exists gcc; then
    echo -e "${YELLOW}GNU Compiler ya está instalado${NC}"
else
    print_message "Instalando GNU Compiler..."
    sudo apt install build-essential -y
fi

# Instalamos Python y pip para los plugins de Neovim
if command_exists python3; then
    echo -e "${YELLOW}Python ya está instalado${NC}"
else
    print_message "Instalando Python..."
    brew install python
fi

# Instalamos pynvim con pip
if command_exists pip3; then
    print_message "Instalando pynvim para Python3..."
    pip3 install --user pynvim
else
    echo -e "${RED}pip3 no está instalado, algo ha ido mal.${NC}"
fi

# Instalamos Lua y LuaRocks para plugins que lo requieran
if command_exists lua; then
    echo -e "${YELLOW}Lua ya está instalado${NC}"
else
    print_message "Instalando Lua..."
    brew install lua
fi

if command_exists luarocks; then
    echo -e "${YELLOW}LuaRocks ya está instalado${NC}"
else
    print_message "Instalando LuaRocks..."
    brew install luarocks
fi

# Instalar jsregexp necesario para LuaSnip
print_message "Instalando jsregexp con LuaRocks..."
luarocks install --lua-version=5.1 jsregexp --force

# Instalamos Rust (para ciertos plugins de Neovim)
if command_exists rustc; then
    echo -e "${YELLOW}Rust ya está instalado${NC}"
else
    print_message "Instalando Rust..."
    brew install rust
fi

# Instalar Yarn (para el plugin de Markdown)
if command_exists yarn; then
    echo -e "${YELLOW}Yarn ya está instalado${NC}"
else
    print_message "Instalando Yarn..."
    sudo apt install yarn -y
fi

# Instalamos wl-clipboard para el soporte de portapapeles en Wayland (en caso de necesitarlo)
if command_exists wl-copy; then
    echo -e "${YELLOW}wl-clipboard ya está instalado${NC}"
else
    print_message "Instalando wl-clipboard..."
    sudo apt install wl-clipboard -y
fi

print_message "${RED}Perfecto, en principio todo ya está preparado :D${NC}"

