# First Neovim config from scratch

Para que todo sea más sencillo y rapido, usar Homebrew como manejador de paquetes.

https://brew.sh/

```bash
# copia & pega para isntalar brew (extraído del enlace anterior)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```bash

nano ~/.profile

```
```bash
# añadimos la siguiente linea al final y guardamos
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

```

```shell
brew install ripgrep fd lua node python3 tree-sitter
```

> [!WARNING]
> Deprecated script

Cuando lo tengamos, lo emplearemos para instalar Node, gcc, ripgrep...
Copiar, pegar y enter para que se ejecute el script de bash de instalación de herramientas que necesitaremos:

```bash
# Primero hacemos ejecutable nuestro script run_setup.sh
chmod +x run_setup.sh
./run_setup.sh
```

### Plugins

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Language Protocol Service](https://github.com/neovim/nvim-lspconfig)
- [Tree](https://github.com/nvim-tree/nvim-tree.lua)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Terminal](https://github.com/akinsho/toggleterm.nvim)
- [Comment](https://github.com/numToStr/Comment.nvim) 
- [Autopairs](https://github.com/windwp/nvim-autopairs)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Web Devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [Surround](https://github.com/kylechui/nvim-surround/tree/main)
