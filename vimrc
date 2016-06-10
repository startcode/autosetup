" #####################################
" Get vundle before using this configuration
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
Plugin 'AutoComplPop'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'surround.vim'
Plugin 'ntpeters/vim-better-whitespace'
"==================
call vundle#end()            " required
filetype plugin indent on     " required! 

let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"super tab
let g:SuperTabDefaultCompletionType = "context"

let g:acp_ignorecaseOption = 0

"settings for delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set tabstop=4 softtabstop=4 shiftwidth=4 tw=100 expandtab

set autoindent
set smartindent

"paste mode switch using F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"configure the colors
let g:solarized_termcolors=256
colorschem solarized
"highlight Pmenu ctermbg=238 gui=bold 
syntax on
set background=dark
set hlsearch
