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
     " Auto pairs for '(' '[' '{'
       Plug 'jiangmiao/auto-pairs'
       
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'liuchengxu/vim-which-key'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	
	Plug 'francoiscabrol/ranger.vim'
	Plug 'rbgrouleff/bclose.vim'
  
  Plug 'justinmk/vim-sneak'

  Plug 'norcalli/nvim-colorizer.lua'
  
  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

call plug#end()
