" #####################################
" Get vundle before using this configuration
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Run ':PluginInstall'
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
Plugin 'qpkorr/vim-bufkill'
Plugin 'tcomment'
Plugin 'tpope/vim-surround'
Plugin 'tpope/tpope-vim-abolish'  "underscore <-> camel case conversion
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'bogado/file-line' "open file:line format
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
" Plugin 'ap/vim-buftabline'
Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
Plugin 'itchyny/vim-cursorword'
Plugin 'drmikehenry/vim-headerguard'
" Plugin 'grailbio/bazel-compilation-database'
Plugin 'tpope/vim-fugitive'
" Plugin 'vim-scripts/Merginal'
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
"Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
Glaive codefmt clang_format_style="Google"
Glaive codefmt yapf_executable="yapf -p --style='{based_on_style: google}"
augroup autoformat_settings
  autocmd FileType BUILD,bzl AutoFormatBuffer buildifier
  autocmd FileType cc,c,cpp,cu,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  "autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  "autocmd FileType sh AutoFormatBuffer shfmt
  " autocmd FileType python AutoFormatBuffer autopep8
augroup END

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

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
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
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
let g:ycm_auto_hover=''
let g:ycm_filetype_blacklist = { 'COMMIT_EDITMSG': 1 }
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

" let g:airline#extensions#tabline#enabled = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
" set hidden
" nmap <leader>T :enew<cr>
" nmap <leader>l :bnext<CR>
" nmap <leader>h :bprevious<CR>
" nmap <leader>bq :bp <BAR> bd #<CR>
" nmap <leader>bl :ls<CR>
"
" " Go to tab by number
" noremap <leader>1 1gt
" noremap <leader>2 2gt
" noremap <leader>3 3gt
" noremap <leader>4 4gt
" noremap <leader>5 5gt
" noremap <leader>6 6gt
" noremap <leader>7 7gt
" noremap <leader>8 8gt
" noremap <leader>9 9gt
" noremap <leader>0 :tablast<cr>


nmap <leader>cf :let @" = expand("%")<cr>


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


" Disable YouCompleteMe's annoying popup menu.
"set completeopt-=preview

let g:ycm_show_diagnostics_ui = 1


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"
nmap <leader>e :UltiSnipsEdit<cr>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:alternateExtensions_h = "cc,cpp,cxx,c,CC"

highlight ExtraWhitespace ctermbg=white

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set nospell

set isfname-=: " allow gf to jump to line number

"" Jump between files.
" goto cc file
nmap <leader>rc :e %:r:s?_test??:s?$?.cc?
" goto test file
nmap <leader>rt :e %:r:s?_test??:s?$?_test\.cc?
" goto header file
nmap <leader>rh :e %:r:s?_test??:s?$?.h?
nmap <leader>rmh :e %:r:s?_bm??:s?$?.h?
" goto the build file.
nmap <leader>rb :e %:p:h:s?$?/BUILD?
" goto the proto file.
nmap <leader>rp :e %:r:s?_test??:s?$?.proto?

" Edit vimrc.
nmap <leader>vr :vsp ~/.vimrc
" Reload vimrc.
nmap <leader>vl :source ~/.vimrc

"Override the default header guard function.
function! g:HeaderguardName()
     let s:name= toupper(expand('%:p:.:gs?[^0-9a-zA-Z]?_?:s?$?_?'))
     if strlen(s:name) >= 80 - strlen("#ifndef")
       return s:name . " // NOLINT"
     else
       return s:name
     endif
endfunction
function! g:HeaderguardLine3()
      let s:guard=g:HeaderguardName()
      let s:clean_guard= substitute(s:guard, " // NOLINT", "", "")
      let s:endst="#endif  //"
      if strlen(s:endst) + strlen(s:clean_guard) >= 79
        return "//NOLINTNEXTLINE\n" . s:endst . " " .  s:clean_guard
      else
        return s:endst . " " . s:clean_guard
      endif
endfunction
nmap <leader>hh :HeaderguardAdd

" close a window without resize.
"set noequalalways

set clipboard=unnamedplus

" Vertical Gdiff HEAD~1
set diffopt+=vertical

" Automatically create directory on save.
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
  augroup END

" Disable all sounds.
set belloff=all

" Don't jump after use `*`.
nnoremap * :keepjumps normal! mi*`i<CR>

" :Gdiff HEAD~1
nmap <leader>dif :Gdiff HEAD~1

let g:ycm_show_diagnostics_ui = 0
