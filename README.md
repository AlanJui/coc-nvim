# coc-nvim

搭配 coc.nvim 的 Neovim 0.5 。

- [專案簡介](#what-is-this)
- [Plugins](#plugins)
- [Prerequisites](#prerequisites)
- [Setup](#setup-quicknvim)
  - [Download cofiguration](#1-download-configuration)
    - [Releases](#releases)
  - [Install plugins](#2-install-plugins)
- [coc.nvim](#cocnvim)
- [Bindings](#bindings)
- [Maintainers](#maintainers)

## 專案簡介

Neovim 0.5 提供了 LSP 的支援，但我無法確認目前可用的 Plugins 是否已完全支援?
可用性是否週全? 穩定性是否已驗證?

因為同意 quick-nvim 作者的觀點；想要親自驗證一下：早已發行於世，廣被世人使用
過的 coc-nvim 是否會比現行的 LSP Plugins 更好用、更穩定?

因此有了這個實驗性質的專案。

## 插件（Plugins）

- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Packer](https://github.com/wbthomason/packer.nvim)
- [Plenary](https://github.com/nvim-lua/plenary.nvim)
- [Surround](https://github.com/blackCauldron7/surround.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [coc](https://github.com/neoclide/coc.nvim)
- [git-worktree](https://github.com/ThePrimeagen/git-worktree.nvim)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [vim-commentary](https://github.com/tpope/vim-commentary/)

## 先決條件（Prerequisites）

- [Neovim 0.5 or above](https://neovim.io)
- [Node.js](https://nodejs.org)

## 安裝與設定作業（Setup process）

### 1. 下載（Download）

```sh
git clone git@github.com:AlanJui/coc-nvim.git ~/.config/nvim
```

### 2. 安裝插件（Install plugins）

本專案使用 packer.nvim 作為 Neovim 的「插件管理工具」。本身具自動安裝
packer.nvim 插件，與其它專案會使用到的 Neovim 插件。安裝插件的工作，
應能於 Neovim 啟動後自動執行。若遇有異常狀況，可透過以下兩步驟手動執行。

To install the plugins used by quick.nvim, you need to do so using Packer.

（1）啟動 Neovim 。

```
nvim ~/.config/nvim/init.lua
```

（2）在 Neovim 執行安裝指令。

```
:PackerInstall
```

## coc.nvim

在 Neovim 0.5 尚未推出前，coc.nvim 是 Neovim 使用者的良伴。可令 Neovim
的操作，宛若使用 VS Code 一般。因為發行已久，且廣為軟體開發者推崇及使用
，所以其可用性及穩定性，毋庸置疑。

This configuration uses [coc.nvim](https://github.com/neoclide/coc.nvim) for
intellisense, instead of the built-in Neovim LSP. This is because I think it's
not quite mature yet, pretty tricky to configure, and doesn't have a quite as
many languages and frameworks supported.

本專案透過 coc.nvim 提供的功能，可依「設定檔」進行：「COC 插件」的自動安裝作業。

```vim
let g:coc_global_extensions = [
\ 'coc-pyright',
\ 'coc-htmldjango',
\ 'coc-emmet',
\ 'coc-html',
\ 'coc-css',
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-syntax',
\ 'coc-diagnostic',
\ 'coc-prettier',
\ 'coc-snippets',
\ 'coc-tslint-plugin',
\ 'coc-highlight',
\ 'coc-smartf',
\ 'coc-git',
\ 'coc-docker',
\ 'coc-yaml',
\ 'coc-sh',
\ 'coc-xml',
\ 'coc-yank',
\ ]
```

若使用者欲自行安裝某項 COC 插件，如：TypeScript Language Server 插件，可於
進入 Neovim 後，在「指令列」以「CocInstall」自行安裝。

quick.nvim doesn't ship with any default coc plugins though, so you have to
install the ones you want to use. For example if you want to use quick.nvim for
TypeScript programming, you'll have to install the coc-tsserver plugin like
this.

```
:CocInstall coc-tsserver
```

## 快捷鍵（Bindings）

【附註】：

**〈leader〉** = `《，》`

| Plugin    | Mapping      | Action                                  |
| --------- | ------------ | --------------------------------------- |
|           | sp           | Split window horizontally               |
|           | vs           | Split window vertically                 |
|           | \<C-H\>      | Move cursor to split left               |
|           | \<C-J\>      | Move cursor to split down               |
|           | \<C-K\>      | Move cursor to split up                 |
|           | \<C-L\>      | Move cursor to split right              |
|           | \<leader\>f  | Open file explorer                      |
|           | \<C-S\>      | Open search & replace                   |
|           | \<leader-t\> | Open a terminal buffer                  |
|           | tj           | Move one tab left                       |
|           | tk           | Move one tab right                      |
|           | tn           | Create a new tab                        |
|           | to           | Close all other tabs                    |
|           | gt           | Go to next tabline                      |
|           | gT           | Go to prettier tabline                  |
| coc       | \<C-@\>      | Open autocompletion                     |
| coc       | \<Enter\>    | Select autocompletion                   |
| coc       | \<S-Tab\>    | Browse previous autocompletion          |
| coc       | \<Tab\>      | Browse next autocompletion              |
| coc       | \<C-S\>      | Selections ranges                       |
| coc       | \<leader\>a  | Applying code action to selected region |
| coc       | \<leader\>ac | Applying code action for current buffer |
| coc       | \<leader\>qf | Apply AutoFix on current line           |
| coc       | \<leader\>l  | Execute code autofix                    |
| coc       | \<leader\>rn | Rename                                  |
| coc       | K            | Show document in pop up window          |
| coc       | gd           | Go to definition                        |
| coc       | gy           | Go to type definition                   |
| coc       | gi           | Go to implementation                    |
| coc       | gr           | Go to references                        |
| coc       | gr           | Go to references                        |
| coc       | [g           | Go to prettier diagnostic               |
| coc       | ]g           | Go to next diagnostic                   |
| coc       | \<Space\>a   | List all diagnostics                    |
| coc       | \<Space\>x   | List all coc extensions installed       |
| coc       | \<Space\>c   | Search command available in coc.nvim    |
| coc       | \<Space\>o   | Search symbol within outline view       |
| Telescope | ;b           | Switch opened files                     |
| Telescope | ;f           | Find file by file name                  |
| Telescope | ;g           | Find file by keyword(Live Grep)         |
| Telescope | ;t           | Open Git worktree picker                |
| Telescope | ;h           | Search help by tags                     |

## 維護者（Maintainers）

<a href="https://github.com/albingroen"> 
  <img src="https://avatars.githubusercontent.com/u/2138279?v=4" width="80" height="80" />
</a>
