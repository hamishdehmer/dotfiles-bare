" SET TERMGUICOLORS
set termguicolors
" SOURCES
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
lua require'plug-colorizer'
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
" RESET MODIFIERS
set wrap
set termguicolors
set number
set relativenumber
set spell spelllang=en_us
set linebreak
set autoread
set confirm
set spellcapcheck=[1.?1]\_[\])'"^I ]\+
" KEYBINDINGS
nmap <C-n> :NERDTreeToggle<CR>
" NERDTREE CONFIGURATION
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
