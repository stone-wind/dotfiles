"{{{ basic
set nocompatible
set fencs=utf-8,gb18030,utf-16le
set enc=utf-8
set ambiwidth=double
set display=lastline " 不显示@
set nu
set cindent
set backspace=indent,eol,start
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set hlsearch
"set mouse=a
set autochdir
set nobackup
set laststatus=2
syntax on
syntax enable
colorscheme elflord
filetype plugin indent on
"}}}

"{{{ language
let c_comment_strings=1 " highlighting strings inside C comments
autocmd FileType c set makeprg=gcc\ -g\ -Wall\ %\ -o\ %:t:r
autocmd FileType cpp set makeprg=g++\ -g\ -std=c++17\ -Wall\ %\ -o\ %:t:r
autocmd FileType js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype make setlocal noexpandtab
"}}}

"{{{ key
set pastetoggle=<F3>

noremap j gj
noremap k gk
noremap 0 g0
noremap $ g$
noremap <C-j> :tabprevious<cr>
noremap <C-k> :tabnext<cr>

nnoremap <F2> :set mouse=<cr>:set nonu<cr>
nnoremap <F4> :set mouse=a<cr>:set nu<cr>
nnoremap <F5> :!./%<cr>
nnoremap <F6> :!o %<cr><cr>
nnoremap <F7> :!./%:t:r<cr>
nnoremap <F8> :set foldmethod=marker<cr>
nnoremap <F9> :w<cr>:make<cr>:cw<cr>

nnoremap <C-a> ggVG
inoremap <C-a> <C-O>gg<C-O>VG
vnoremap <C-c> y:call system("~/.bin/z clip", getreg("\""))<cr>

inoremap <C-t> <C-v>
nnoremap <C-t> <C-v>
vnoremap <C-t> <C-v>
cnoremap <C-t> <C-v>

" CTRL-A is Select all
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"xnoremap <C-A> <C-C>ggV

"nnoremap <C-l> <C-v>
"nnoremap <C-v> :r!~/.bin/wrun pclip<cr>
"}}}

"{{{ function
function! Ca(from, to)
    execute 'cabbr ' . a:from . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' 
        \ . a:to . '" : "' . a:from . '"<CR>'
endfunction
"}}}

"{{{ command
" 用 / 搜索也会被替换
"ca xx yy
" 用 / 搜索不会被替换
"call Ca("xx", "yy")
" 只能大写开头
"command XX yy

call Ca("qq", "q!")
call Ca("w!!", "w !sudo tee >/dev/null %")
call Ca("icmu", ":!git commit -am update")
call Ca("ist", ":!git status")
call Ca("idi", ":!git diff")
"}}}

"{{{ statusline
set statusline=
set statusline +=%1*\ %n\ %*                      "buffer number
set statusline +=%5*%{&ff}%*                      "file format
set statusline +=%3*,%{&fenc!=''?&fenc:&enc}%*    "encoding
set statusline +=%3*%{&bomb?',bom':''}%*          "bom
set statusline +=%3*%Y%*                          "file type
set statusline +=%3*%R%*                          "readonly
set statusline +=%4*\ %<%F%*                      "full path
set statusline +=%2*%m%*                          "modified flag
set statusline +=%1*%=%5l%*                       "current line
set statusline +=%2*/%L%*                         "total lines
set statusline +=%2*\ %p%%\ %*                    "lines %
set statusline +=%1*%4v\ %*                       "virtual column number
set statusline +=%2*0x%04B\ %*                    "character under cursor
"}}}

"{{{ nerdtree
command NT NERDTreeToggle
"}}}

"{{{ supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'
"}}}

"{{{ vim-plug
let g:plug_shallow = 1
let g:plug_window = 'new'
command PlugInit !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9'
Plug 'vim-scripts/a.vim'
Plug 'othree/vim-autocomplpop'
Plug 'tsaleh/vim-supertab'
Plug 'scrooloose/nerdtree'

call plug#end()
"}}}
