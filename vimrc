"Plugins ----------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim "rtp == RunTimePath

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'wincent/command-t'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'morhetz/gruvbox'
Plugin 'benmills/vimux'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()

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
set noswapfile
set cursorline
syntax on
colorscheme gruvbox
set bg=dark

"Remember last buffer position
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"Shortcuts --------------------------------------------------------------------
let mapleader=","
"Shortcuts :: Plugin
map <F2> :NERDTreeToggle<CR> :vertical resize 50<CR>
nmap <tab> :tabnext<CR>
nmap <C-e> :CommandTBuffer<CR>
nmap <S-e> :CommandT<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.pyyyy'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:airline#extensions#tabline#enabled = 1

"Shortcuts :: Editor
nnoremap <leader>e :bn<CR>
nnoremap <leader>q :bp<CR>
nnoremap <leader>z :bd<CR>
nnoremap <C-i> :YcmCompleter GoToImprecise<CR>
nnoremap <C-o> <C-o>zz
map <F12> :wqa!<CR>
nmap <BS> hx
imap <C-w> <Esc>dwi
imap <C-b> <Esc>dbi

"Shortcuts :: External Utilties
map <F10> :!make<CR>
map <C-F10> :!make test<CR>
