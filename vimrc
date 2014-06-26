set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" python pep8 indentation
Plugin 'hynek/vim-python-pep8-indent'
" auto-complete engine
Plugin 'Valloric/YouCompleteMe'
" NERDTree
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

autocmd filetype python set textwidth=79
autocmd filetype python set colorcolumn=80

" Toggle NERDTree.
map <F3> :NERDTreeToggle<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1
