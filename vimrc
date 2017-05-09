"Plugins ----------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim "rtp == RunTimePath

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'wincent/command-t'
call vundle#end()

"Basic Setups -----------------------------------------------------------------
set number
set softtabstop=4
set tabstop=4
set shiftwidth=4
"set expandtab " use whitespace for tab character
set cindent
set hlsearch
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

"Shortcuts :: Editor
map <F12> :wqa!<CR>
nmap <BS> hx
imap <C-w> <Esc>wwdbi
imap <C-b> <Esc>dbi

"Shortcuts :: External Utilties
map <F10> :!make<CR>
map <C-F10> :!make test<CR>
