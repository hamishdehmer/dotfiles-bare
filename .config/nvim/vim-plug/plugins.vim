" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 "autocmd VimEnter * PlugInstall
 "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'

  " File Explorer
  Plug 'scrooloose/NERDTree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
  Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree

  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'

  " Automatic suggestions
  Plug 'neoclide/coc.nvim',            {'branch': 'release'}

  " Show Keybindings
  Plug 'liuchengxu/vim-which-key'

  " Fzf integration
	Plug 'junegunn/fzf',                 { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

  " Adds ranger support
	Plug 'francoiscabrol/ranger.vim'
	Plug 'rbgrouleff/bclose.vim'

  " Sneak around the window
  Plug 'justinmk/vim-sneak'

  " Colorzer for css
  Plug 'norcalli/nvim-colorizer.lua'

  " Dracula theme
  Plug 'dracula/vim',                  { 'as': 'dracula' }

  " Mirmare Theme
  Plug 'franbach/miramare'

  " Airline Bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Floaterm
  Plug 'voldikss/vim-floaterm'

  " Css Colors
  Plug 'skammer/vim-css-color'

  " Markdown Preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

  " LanguageTool plugin
  Plug 'dpelle/vim-LanguageTool'

  " Easy Align
  Plug 'junegunn/vim-easy-align'

  " Rainbow Parentheses
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/limelight.vim'

  " Prettier
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  
  Plug 'kovetskiy/sxhkd-vim'

  Plug 'junegunn/goyo.vim'                           " Distraction-free viewing

  Plug 'junegunn/vim-emoji'                          " Vim needs emojis!

  call plug#end()

