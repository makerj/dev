"Plugins ----------------------------------------------------------------------
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'rdnetto/YCM-Generator'
Plug 'morhetz/gruvbox'
Plug 'benmills/vimux'
Plug 'ntpeters/vim-better-whitespace'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim', {'on': 'Ack', 'do': 'sudo apt-get install ack-grep -y'}
Plug 'tpope/vim-fugitive', {'on': 'Git'}
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'matze/vim-move'
Plug 'vim-scripts/DoxygenToolkit.vim', {'on': 'Dox'}
call plug#end()

"Basic Setups -----------------------------------------------------------------
set number
set softtabstop=4
set tabstop=4
set shiftwidth=4 "set expandtab " use whitespace for tab character
set cindent
set incsearch
set hlsearch
set ignorecase
set smartcase
set laststatus=2
set title
set textwidth=120
set smartindent
set autoindent
set autoread
set noswapfile
set cursorline
set clipboard=unnamedplus
syntax on
if filereadable(expand("$HOME/.vim/plugged/gruvbox/colors/gruvbox.vim"))
    colorscheme gruvbox
endif
set bg=dark

"Remember last buffer position
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"Shortcuts --------------------------------------------------------------------
let mapleader=","
"Shortcuts :: Plugin
noremap <F2> :NERDTreeToggle<CR> :vertical resize 50<CR>

nnoremap <C-e> :Buffers<CR>
nnoremap <S-e> :Files<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>q :YcmCompleter GetDoc<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <C-i> :YcmCompleter GoToDeclaration<CR>
nnoremap <C-o> <C-o>zz

let g:airline#extensions#tabline#enabled = 1

let g:UltiSnipsExpandTrigger="<C-right>"

let g:move_key_modifier = 'C'

let g:DoxygenToolkit_briefTag_pre=""

nnoremap <leader>d :Dox<CR>

"Shortcuts :: Editor
nnoremap <leader>e :bn<CR>
nnoremap <leader>w :bp<CR>
nnoremap <leader>z :bd<CR>
noremap <F12> <ESC>:wqa!<CR>
nnoremap <BS> hx
inoremap <C-w> <C-o>de
inoremap <C-b> <C-o>db

"Shortcuts :: External Utilties
nnoremap <F9> :!zsh<CR>
nnoremap <F10> :wa<CR><ESC> :!make<CR>
nnoremap <C-F10> :wa<CR><ESC> :!make test<CR>

call feedkeys("\<F2>")
call feedkeys("\<C-w>w")

