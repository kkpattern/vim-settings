set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()

syntax on

filetype plugin indent on    " required

" If golang is installed, enable golang-vim plugin
if ($GOROOT!="")
    " Clear filetype flags before changing runtimepath to force Vim to
    " reload them.
    if exists("g:did_load_filetypes")
        filetype off
        filetype plugin indent off
    endif
    set runtimepath+=$GOROOT/misc/vim
    filetype plugin indent on
    syntax on
endif

autocmd filetype go set et
autocmd filetype go set sw=4

" Python settings

autocmd filetype python set textwidth=79
autocmd filetype python set colorcolumn=80

" HTML settings
autocmd filetype html set et
autocmd filetype html set sw=4

" Toggle NERDTree.
map <F3> :NERDTreeToggle<CR>

" Ignore pyc files.
let NERDTreeIgnore=['\.pyc$', '\~$']

let g:ycm_autoclose_preview_window_after_insertion = 1

colorscheme seoul256
