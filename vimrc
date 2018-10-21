" #####################################
" Get vundle before using this configuration
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" after install,
" ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer
" mkdir -p syntax
" wget https://raw.githubusercontent.com/google/protobuf/master/editors/proto.vim -o ~/.vim/syntax
"########################################
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"==================
Plugin 'startcode/a.vim'
Plugin 'tcomment'
Plugin 'tpope/vim-surround'
Plugin 'tpope/tpope-vim-abolish'  "underscore <-> camel case conversion
" crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>),
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bogado/file-line' "open file:line format
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'ap/vim-buftabline'
"==================
call vundle#end()            " required
filetype plugin indent on     " required!

inoremap jj <esc>
inoremap jk <esc>

call glaive#Install()
"google style auto format"

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
Glaive codefmt clang_format_style="Google"
map <C-I> :pyf /usr/share/clang/clang-format-3.9/clang-format.py<CR>
imap <C-I> <ESC>:pyf /usr/share/clang/clang-format-3.9/clang-format.py<CR>i
augroup autoformat_settings
  autocmd FileType BUILD,bzl AutoFormatBuffer buildifier
  "autocmd FileType cc,c,cpp,cu,javascript AutoFormatBuffer clang-format
  autocmd FileType cc,c,cpp,cu AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  "autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " autocmd FileType python AutoFormatBuffer autopep8
augroup END

let mapleader=","

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

set completeopt=longest,menu "vimtip 1228
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "close window after insert
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
nnoremap <leader>lo :lopen<CR>	"open locationlist
nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
let g:ycm_always_populate_location_list=1
let g:ycm_server_python_interpreter = '/home/lidong05/anaconda3/bin/python'
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
map <leader>f :YcmCompleter FixIt<CR>

function! s:CustomizeYcmLocationWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
  " Switch back to working window.
  wincmd p
endfunction

autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

au FileType c,cpp,cc nmap <buffer><silent>,lr <Plug>(clang_rename-current)

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set background=dark    " Setting dark mode

let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|devel|build)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|make|dir|o|cmake)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1
" Looper buffers
let g:buffergator_mru_cycle_loop = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>
" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>
" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

highlight ExtraWhitespace ctermbg=white

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set smartindent
set cindent

"paste mode switch using F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

syntax on
set background=dark
set hlsearch

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
"set colorcolumn=100

hi Normal ctermbg=none
highlight NonText ctermbg=none
set nu
set autowrite
"set nowrap
set exrc
set secure
set backspace=indent,eol,start
set ruler

set isfname-=: " allow gf to jump to line number
