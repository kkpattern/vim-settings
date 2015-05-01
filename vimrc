if has("win32") || has("win16")
    language messages en
endif

set nocompatible              " be iMproved, required

set encoding=utf-8
set fileencodings=utf-8,chinese,gbk,gb2312,cp936,cp950,gb18030,ucs-bom,utf-16,latin1

set backspace=indent,eol,start

filetype off                  " required

execute pathogen#infect()

syntax on

filetype plugin indent on    " required

set number
set tabstop=4

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

autocmd BufEnter,BufNewFile,BufRead *.h,*.c setfiletype cpp
autocmd BufEnter,BufNewFile,BufRead *.py, setfiletype python

autocmd filetype go set et
autocmd filetype go set sw=4

" Python settings

autocmd filetype python set textwidth=79
autocmd filetype python set colorcolumn=80
autocmd filetype python set foldmethod=indent
autocmd filetype python nnoremap <space> za
autocmd filetype python set foldnestmax=2
autocmd filetype python let g:syntastic_quiet_messages = { "type": "style" }
autocmd filetype python set et!

" HTML settings
autocmd filetype html set et
autocmd filetype html set sw=4

" HTML django settings.
autocmd filetype htmldjango set et
autocmd filetype htmldjango set sw=4

" Cpp settings
autocmd filetype cpp set et
autocmd filetype cpp set sw=2
autocmd filetype cpp set number
autocmd filetype cpp set textwidth=80
autocmd filetype cpp set colorcolumn=81

" Toggle NERDTree.
map <F3> :NERDTreeToggle<CR>
" Disable directory arrows so nerdtree works on (almost) every terminal.
let g:NERDTreeDirArrows=0


" Ignore pyc files.
let NERDTreeIgnore=['\.pyc$', '\~$']

let g:ycm_autoclose_preview_window_after_insertion = 1

set t_Co=256
colorscheme seoul256

match Error /[\t ]\+$/
2match TabLineFill /\t/

set incsearch

let g:ctrlp_working_path_mode = 'a'

nmap <c-t> :Ag! ""<left>

:set laststatus=2

nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
