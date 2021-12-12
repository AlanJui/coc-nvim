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
過的 coc-nvim 是否會比現行的 LSP Plugins 更好用、更穩定些? 因為生活的經驗教會
我，太新的東西，也許夠潮；但卻未曾被檢驗，證實其可用性及可靠性！

因此有了這個實驗性質的專案：以 Neovim 0.5 為基底，採 coc.nvim
各類插件（extensions），實作 LSP 應用的試驗。

`This configuration uses [coc.nvim](https://github.com/neoclide/coc.nvim) for intellisense, instead of the built-in Neovim LSP. This is because I think it's not quite mature yet, pretty tricky to configure, and doesn't have a quite as many languages and frameworks supported.`

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
git clone git@github.com:AlanJui/coc-nvim.git ~/.config
```

### 2. 安裝插件（Install plugins）

本專案使用 packer.nvim 作為 Neovim 的「插件管理工具」。Neovim 啟動後將自動安裝
packer.nvim 插件；而專案使用到的其它插件，其安裝工作，也會由 packer.nvim 自動
執行。

(1) 首次啟動 Neovim 

啟動 Neovim 時，會將因插件尚未安裝，遭 Neovim 警告某些處理
作業無法完成...，遇此狀況莫慌，請繼續下去直到進入 Neovim。


`Run the following command to start Neovim`

```sh
$ cd ~/.config/coc-nvim
$ mkdir ~/.local/bin
$ cp tools/coc-nvim ~/.local/bin/
$ coc-nvim 
```

(2) 安裝插件

在 Neovim 啟動後，按鍵盤的《：》，進入「指令」模式後，輸入：`PackerSync`，
再按《Enter》鍵，要求 Neovim 執行「PackerSync」指令，以便 nvim.packer 這插件
開始執行其它插件的安裝工作。待插件安裝完成後，即可退出 Neovim 。

```vim
:PackerSync
```

### 3. 操作 Neovim（Start Neovim）

本專案不會佔用 `~/.config/nvim` 這個目錄。其好處為：使用者若想自學 Neovim ，
這個目錄可留給您學習，做實驗用；但有麻煩則為：使用者若直接輸入指令 nvim ，則
無法使用本專案的 Neovim 設定。

請務必記得，需以如下指令啟動：

`Start coc-nvim`

```
$ coc-nvim
```

**【附註】：**

本專案的 Neovim 設定檔存放目錄及插件的存放目錄說明：

 - 設定存放目錄路徑： `~/.config/coc-nvim/`
 - 插件存放目錄路徑： `~/.local/share/coc-nvim/`

## coc.nvim 插件(coc.nvim extensions)

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

`You can install coc extension(plugin) manually if you want to use. For example if you want to use javascript for TypeScript programming, you'll have to install the coc-tsserver extension like this.`

```vim
:CocInstall coc-tsserver
```

## 快捷鍵（Bindings）

【附註】：

**〈leader〉** = `《，》`

| Plugin    | Mapping      | Action                                  |
| --------- | ------------ | --------------------------------------- |
|           | \<Space\>e   | Open file explorer                      |
|           | \<Space\>;   | Open a terminal window                  |
|           | sp           | Split window horizontally               |
|           | vs           | Split window vertically                 |
|           | \<C-H\>      | Move cursor to split left               |
|           | \<C-J\>      | Move cursor to split down               |
|           | \<C-K\>      | Move cursor to split up                 |
|           | \<C-L\>      | Move cursor to split right              |
|           | fr           | Search & replace in current buffer      |
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
