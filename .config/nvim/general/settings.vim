" set leader key
let mapleader = "\<Space>"

set termguicolors
syntax enable

" Miramare settings
" let g:miramare_enable_italic = 1
" let g:miramare_disable_italic_comment = 1

" Theme
colorscheme onedark

" Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set wrap                                " Wraps Text
set relativenumber                      " Sets relative number in relation to your current line
set spell spelllang=en_us               " Sets spelling language
set linebreak                           " Breaks line
set autoread                            " Automatically sets lists to read
set confirm                             " Forces confirmation upon leaving
set spellcapcheck=[1.?1]\_[\])'"^I ]\+
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set cursorcolumn
set conceallevel=0                      " So that I can see `` in markdown files
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continuation of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory
set thesaurus+=/home/ziox/thesaurus/thesaurii.txt
"set scrolloff=18

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

" Key bindings
nmap <C-n> :NERDTreeToggle<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" Limelight Configuration
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 0

" NERDTree Config 
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

hi Normal guibg=NONE ctermbg=NONE
