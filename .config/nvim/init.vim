call plug#begin()
Plug 'tpope/vim-sensible'           " sets some normal standards
Plug 'tpope/vim-surround'           " for surrounding text with quotes, parentheses, etc
Plug 'tpope/vim-repeat'             " for using '.' to repeate non-native commands
Plug 'tpope/vim-commentary'         " for commenting
Plug 'morhetz/gruvbox'              " color scheme
Plug 'ctrlpvim/ctrlp.vim'           " file finder
Plug 'tpope/vim-abolish'            " search/replace plug-in
Plug 'vim-airline/vim-airline'      " airline status line
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'AndrewRadev/tagalong.vim'
Plug 'mattn/emmet-vim'
"Plug 'steven-liou/console-puts'    " comment plugin
call plug#end()

" ==================================================
" Display
" ==================================================
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme gruvbox

" ==================================================
" Key Remaps
" ==================================================

let mapleader = " "
set mouse=a

" Window commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" System clipboard cut and paste
nnoremap <leader>p "+p  
nnoremap <leader>y "+y
vnoremap <leader>y "+y
inoremap <A-p> <ESC>"+pa


" Press escape to clear search highlighting
nnoremap <silent><esc> <esc>:nohlsearch<CR>

" Rapid editing of vimrc
nmap <leader>vi :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" Reasonable line jumping
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Toggle relative number
nnoremap <leader>n :setlocal rnu!<CR>

" Remap to avoid conflict with terminal C-v
nnoremap vv <C-v>

" Exit Terminal
tnoremap <C-n> <C-\><C-n>

" Fix indentation for whole document
nnoremap <leader>= gg=G<C-o>

" ====================================================
" Snippets
" ====================================================
nnoremap ,html :-1read $HOME/vim/snippets/skeleton.html<CR>/<\/title><CR><ESC><ESC>i

" ====================================================
" Behavior
" ====================================================

" Enable line numbers
set number relativenumber
" !!! idea for my first function:
" map leader-something to a function that will temporarily display fixed
" line numbers and then go back to relative after a certain number of seconds

" Keep context while scrolling
set scrolloff=2
set sidescroll=1
set sidescrolloff=15
nnoremap <expr> zl v:count ? 'zl' : '10zl'
nnoremap <expr> zh v:count ? 'zh' : '10zh'

" Remove trailing whitespace on save
" !!! more general version of this
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.rb :%s/\s\+$//e

" All new windows pop up at the bottom and right
set splitbelow
set splitright

" Search
set ignorecase
set smartcase

" Set python directories
" !!! Is this necessary?
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

" Persistent undo
" !!! Learn more about this
set undodir=~/.config/nvim/undodir
set undofile

" Set tab as 4 spaces
" !!! Look into tpope plugin
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set smartindent
set nowrap
set textwidth=80

" Run ruby code using leader-r only when inside a .rb file
autocmd! FileType ruby nnoremap <leader>r :!ruby %:p<CR>

" Switch between buffers
" !!! Learn more about this
set hidden
set autowrite

"============================================================
" VimWiki
"============================================================

let g:vimwiki_list = [{'path': '~/Notes/LS/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
