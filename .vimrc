call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

:set expandtab
:set shiftwidth=4
:set autoindent
:set smartindent
:set tabstop=4

let g:lightline = {'colorscheme': 'catppuccin_macchiato'}

set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
set number

map <C-o> :NERDTreeToggle<CR>