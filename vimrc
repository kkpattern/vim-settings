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

" set tab visible.
autocmd WinEnter,BufEnter,BufNewFile,BufRead * 2match TabLineFill /\t/

autocmd BufEnter,BufNewFile,BufRead *.h,*.c setfiletype cpp
autocmd BufEnter,BufNewFile,BufRead *.py, setfiletype python

autocmd filetype go set et
autocmd filetype go set sw=4

" HTML settings
autocmd filetype html set et
autocmd filetype html set sw=4

" HTML django settings.
autocmd filetype htmldjango set et
autocmd filetype htmldjango set sw=4

" Cpp settings
autocmd filetype cpp set et!
" autocmd filetype cpp set sw=2
autocmd filetype cpp set number
" autocmd filetype cpp set textwidth=80
" autocmd filetype cpp set colorcolumn=81

" Toggle NERDTree.
map <F3> :NERDTreeToggle<CR>
" Disable directory arrows so nerdtree works on (almost) every terminal.
let g:NERDTreeDirArrows=0


" Ignore pyc files.
let NERDTreeIgnore=['\.pyc$', '\~$']

set t_Co=256
colorscheme seoul256

set incsearch

nmap <c-t> :Ag! ""<left>

:set laststatus=2

let mapleader=","
nmap ; !:
nmap <leader>q !:q<CR>

nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nmap <tab> :tabn<CR>

let g:Lf_ShortcutF = '<C-P>'

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

fu! _SetUtf8()
    call append(0, "# -*- coding: utf-8 -*-")
    set fileencoding=utf-8
endfunction

" Python settings

" autocmd filetype python set textwidth=79
autocmd filetype python set colorcolumn=80
autocmd filetype python set foldmethod=indent
autocmd filetype python nnoremap <space> za
autocmd filetype python set foldnestmax=2
autocmd WinEnter,BufEnter,BufNewFile,BufRead *.py match Error /[\t ]\+$/

let g:syntastic_python_flake8_args = '--builtins network,ccp,CCSize,CCRect,ccc3,ccc4,ccc4f,ccc3FromHex,ccc4FromHex,ccc4aFromHex,ccc4fFromHex,get_sprite_frame_fail,GetSpriteFrameFromPlistAndPath,GetTextByLanguageI,message,leading_message,message_debug,confirm_show,tip_tick,ui_show,ui_set_visible,ui_get,ui_get_type_all,ui_hide_type,ui_close,uisystem,_,filter_text,filter_nickname'
autocmd filetype python let g:syntastic_quiet_messages = { "type": "style" }
autocmd filetype python set et
autocmd filetype python nmap <leader>u :call _SetUtf8()<CR>
