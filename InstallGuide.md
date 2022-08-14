## Build from source
---

### Install Prerequisites

Build dependencies:

```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

```

> **_Note:_** libtool-bin is only required for Ubuntu 16.04 / Debian 8 and newer.

Copy/paste tools

- On mac `pbcopy` should be builtin
- On Ubuntu

```
sudo apt install xsel  # for X11
sudo apt install wl-clipboard  # for wayland
```

Install python support (node is optinoal)

- Neovim python support
  `pip install pynvim`
- Neovim node support
  `npm i -g neovim`

Install 'ripgrep' for Telescope to work:
`sudo apt install ripgrep`

### Install from source

```
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.7
make CMAKE_BUILD_TYPE=Release
sudo make install

```


### Install the config

`git clone https://github.com/LunarVim/nvim-basic-ide.git ~/.config/nvim`

Run nvim and wait for the plugins to be installed

> **_NOTE_** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

> **_NOTE_** Checkout this file for some predefined keymaps: [keymaps](https://github.com/LunarVim/nvim-basic-ide/blob/master/lua/user/keymaps.lua)


## Configuration
---
### LSP


Install `stylua` for linting `lua`
before install `stylua`, you have to install cargo.
```
sudo apt update && sudo apt install cargo
cargo install stylua
```


To see what LSPs are installed
```
:LspInstallInfo
```
and press `i` on the language server you wish to install, for python, it is recommended to install `pyright`
Next you will need to add the server name to the list in `lsp-installer.lua` under dir `lua/user/lsp/`. 
```
local servers = {
	"sumneko_lua",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
}
```

### Formatters and Linters

Config the `null-ls.lua` file to enable formatters and Linters


### Fonts
It is recommended to use the following repo to get a "Nerd Font" (Font that supports icons)
[getnf](https://github.com/ronniedroid/getnf)


## Update
---

One of the main reason that building neovim from source, is for version control, which makes your nvim ide unbreakable.
Since every plugin is pinned to a specific commit, and tested with a specific version of neovim, You only update neovim when you have a whole new version sets of plugin tested with the new version of neovim.

### Update from source

If you still have the neovim repo for first time manual install, `cd` into that repo, and delete the `.deps` and `build` folder.
Then redo [Install](###-install-from-source)

### Update the plugins

After install neovim with the right version. Clone the new nvim config to `~/.config/` folder

## Issues

### Known problems

With mac m1, there is a upstream problem with install `phpdoc` and `tree-sitter-phpdoc`. For now the only solution is to disable the related module in `treesitter.lua`

```
configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "phpdoc", "tree-sitter-phpdoc" }, -- List of parsers to ignore installing
  ...
})
```
