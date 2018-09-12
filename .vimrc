set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin(‘~/some/path/here‘)
"
" " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
"
" " All of your Plugins must be added before the following line
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'morhetz/gruvbox'
call vundle#end()            " required
" filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
"
set bg=dark
"execute pathogen#infect()

syntax enable
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" indent fold
" set foldmethod=indent
" set foldlevel=1
set foldmethod=manual
autocmd BufWinLeave *.* mkview " save fold
autocmd BufWinEnter *.* silent loadview " load fold



set clipboard=unnamedplus
set nu
set sm
set autoindent
set smartindent

set cin
set hlsearch
set incsearch
set ignorecase
set ai
set si
set cindent
set showmatch
set wildmenu
" A tab produces a 2-space indentation
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set cursorline

" opaque background
hi Nomal ctermfg=255 ctermbg=none




" manual fold
" set foldmethod=manual
" au BufWinLeave * silent mkview
" au BufWinEnter * silent loadview

" set guifont=Courier\ 10\ Pitch\ 12
" set guifont=DejaVu\ Sans\ Mono\ 13
set background=dark

"  let g:solarized_termcolors=256
"  let g:solarized_underline=0
"  colorscheme solarized

" set guioptions=r
" let g:gruvbox_contrast_dark='soft'

" let g:molokai_original=1
" let g:rehash256=1
" colorscheme molokai


set display+=lastline
set history=400

set encoding=utf-8

set mouse=a

if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif
endif

autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul


"-------------------ack for ag-----------------------
" sudo apt-get install silversearcher-ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"-------------------ack for ag end-------------------

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<M-;>'
nnoremap ,c :YcmCompleter GoToDeclaration<CR>
nnoremap ,d :YcmCompleter GoToImprecise<CR>
autocmd FileType python nnoremap ,d :YcmCompleter GoTo<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'



" for searching file in shapechecker
function! GoToSrc()
ruby << EOF
# Check root according to Git.
def is_root(dir)
  File.directory?(dir + "/.git")
end

head = Vim::Buffer.current.name
abort "Not head file." unless head.end_with?(".h")
src = File.basename(head, ".h") + ".cpp"
puts "head is " + head
puts "src is " + src
dir = File.dirname(head)
until is_root(dir)
  abort ".git not found." if dir == "/"
  dir = File.dirname(dir)
end
puts "dir is " + dir
src_fullpath = `find #{dir} -name #{src}`.split.last # a shit hack for ShapeChecker
p "src_fullpath is " + src_fullpath
if !src_fullpath.empty?
 Vim::command("echo 'vs #{src_fullpath}'")
 Vim::command("let @/ = expand('<cword>')")
 Vim::command("vs #{src_fullpath}")
 Vim::command("normal gg")
 Vim::command("normal n")
else
 Vim::command("echo 'Good bye :)'")
end
EOF
endfunction
nnoremap ,e :call GoToSrc()<cr><cr>
