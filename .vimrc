call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
call plug#end()

set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
set number

map <C-o> :NERDTreeToggle<CR>
