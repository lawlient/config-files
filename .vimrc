set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin(‘~/some/path/here‘)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
Plugin 'Valloric/YouCompleteMe'
" Plugin 'morhetz/gruvbox'

Plugin 'majutsushi/tagbar'
Plugin 'universal-ctags/ctags'

call vundle#end()            " required

"set bg=dark
"execute pathogen#infect()

syntax enable
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" fold memory
set foldmethod=manual
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

set cursorline
:hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkcyan guifg=white
nnoremap <Leader>c :set cursorline!<CR>

:hi CursorColumn cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkcyan guifg=white
nnoremap <Leader>a :set cursorcolumn!<CR>

set colorcolumn=81
:hi ColorColumn   cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkcyan guifg=white
nnoremap <Leader>l :set colorcolumn=81<CR>

set clipboard=unnamedplus
set nu
set sm
set ai
set autoindent
set smartindent
set cin
set hlsearch
set incsearch
"set ignorecase
set si
set cindent
set showmatch
set wildmenu
" A tab produces a 4-space indentation
set softtabstop=4
set expandtab
set smarttab
set shiftwidth=4
set splitright
set tabstop=4
set scrolloff=5
set autochdir
set display+=lastline
set history=400
set encoding=utf-8
set mouse=
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  

" opaque background
hi Nomal ctermfg=255 ctermbg=none

" config for solarized----------
set background=dark
" let g:solarized_termcolors=256
" let g:solarized_underline=0


if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif
endif

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul



" config for youcompleteme
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycn_key_invoke_completion = '<M-;>'
nnoremap ,c :YcmCompleter GoToDeclaration<CR>
nnoremap ,d :YcmCompleter GoToImprecise<CR>
autocmd FileType python nnoremap ,d :YcmCompleter Goto<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tag_files = 1  


" config for tagbar
" Bundle 'majutsushi/tagbar'
nnoremap ,t :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='/usr/local/bin/ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启


function! GoToCpp()
ruby << EOF
head = Vim::Buffer.current.name
abort "Not head file." unless head.end_with?(".h")
c = File.basename(head, ".h") + ".c"
cpp = File.basename(head, ".h") + ".cpp"
dir = File.dirname(head)
full_c = dir + "/" + c # just find it in same directory
full_cpp = dir + "/" + cpp # just find it in same directory
p "file is " + full_cpp
if File.file?(full_cpp)
    Vim::command("echo 'vs #{full_cpp}'")
    Vim::command("let @/ = expand('<cword>')")
    Vim::command("vs #{full_cpp}")
    Vim::command("normal gg")
    Vim::command("normal n")
elsif File.file?(full_c)
    Vim::command("echo 'vs #{full_c}'")
    Vim::command("let @/ = expand('<cword>')")
    Vim::command("vs #{full_c}")
    Vim::command("normal gg")
    Vim::command("normal n")
else
    abort full_cpp
    Vim::command("echo 'Goodbye :)'")
end
EOF
endfunction
nnoremap ,e :call GoToCpp()<cr><cr>

" 这个函数通过替换命令删除行尾空格                                                  
func! DeleteTrailingWS()                                                            
    exec "normal mz"                                                                
    %s/\s\+$//ge                                                                    
    exec "normal `z"                                                                
endfunc                                                                             
map <leader>t :call DeleteTrailingWS()<CR> 
