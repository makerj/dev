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
call vundle#end()

"Basic Setups -----------------------------------------------------------------
set number
set softtabstop=4
set tabstop=4
set shiftwidth=4
"set expandtab " use whitespace for tab character
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
syntax on
"colorscheme solarized

"Shortcuts --------------------------------------------------------------------
"Shortcuts :: Plugin
map <F2> :NERDTreeToggle<CR> :vertical resize 60<CR>
nmap <tab> :tabnext<CR>
nmap <C-e> :CommandTBuffer<CR>
nmap <S-e> :CommandT<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 
let g:airline#extensions#tabline#enabled = 1

"Shortcuts :: Editor
map <F12> :wqa!<CR>
nmap <BS> hx
imap <C-w> <Esc>wwdbi
imap <C-b> <Esc>dbi

"Shortcuts :: External Utilties
map <F10> :!make<CR>
map <C-F10> :!make test<CR>
