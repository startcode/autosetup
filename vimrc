" #####################################
" Get vundle before using this configuration
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" after install,
" ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer
"########################################
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"==================
Plugin 'a.vim'
Plugin 'tcomment'
Plugin 'altercation/vim-colors-solarized'
Plugin 'surround.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'morhetz/gruvbox'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'bogado/file-line'
Plugin 'honza/vim-snippets'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-fugitive'
"==================
call vundle#end()            " required

call glaive#Install()
"google style auto format"
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
map <C-I> :pyf path_to_clang_format/clang-format.py<CR>
imap <C-I> <ESC>:pyf path_to_clang_format/clang-format.py<CR>i
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType cc,c,cpp,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

filetype plugin indent on     " required! 

let mapleader=","

set completeopt=longest,menu "vimtip 1228
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "close window after insert
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up> pumvisible() ? "\<C-k>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>":"\<PageDown>"
"inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>":"\<PageUp>"

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
nnoremap <leader>lo :lopen<CR>	"open locationlist
nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
let g:ycm_confirm_extra_conf=0
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
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<C-n>', '<C-f>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-b>', '<C-p>', '<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<c-n>'
map <leader>f :YcmCompleter FixIt<CR>

nmap <leader>e : UltiSnipsEdit<CR>
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="/home/lidong05/src/autosetup/ultisnips"
let g:UltiSnipsSnippetDirectories=["/home/lidong05/src/autosetup/ultisnips"]

" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

set background=dark    " Setting dark mode

"show tabs
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

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set expandtab

set autoindent
set smartindent
set cindent
set cinoptions=>2

"paste mode switch using F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"configure the colors
" let g:solarized_termcolors=256
" colorschem solarized
" colorscheme gruvbox
" colorscheme clarity
"highlight Pmenu ctermbg=238 gui=bold
" colorscheme dark-ruby
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
set spell spelllang=en_us
setlocal spell spelllang=en_us
set autowrite
"set nowrap
set exrc
set secure
set backspace=indent,eol,start
set ruler
