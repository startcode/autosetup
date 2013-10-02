"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'a.vim'
Bundle 'tComment'
Bundle 'surround.vim'
Bundle 'LaTeX-error-filter'
Bundle 'DrawIt'
Bundle 'marklar.vim'
Bundle 'SpellChecker'
Bundle 'repeat.vim'
Bundle 'delimitMate.vim'
Bundle 'matchit.zip'
Bundle 'quickfonts.vim'
Bundle 'SuperTab'
Bundle 'ctags.vim'
Bundle 'Screen-vim---gnu-screentmux'
Bundle 'snipMate'
Bundle 'spell.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'scrooloose/nerdtree'
Bundle 'DoxygenToolkit.vim'
Bundle 'AutoComplPop'
Bundle 'cpp.vim'
Bundle 'STL-improved'
Bundle 'desert-warm-256'

filetype plugin indent on
set shellslash
set smartindent

set showmatch

set hlsearch
"colorscheme molokai
"let g:molokai_original=1
"colorscheme ir_black
"colorscheme wombat
colorscheme marklar

"set tags+=~/.vim/tags/stl

set ofu=syntaxcomplete#Complete

set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
let g:Tex_Folding=0
let g:Tex_DefaultTargetFormat='pdf'
let g:tex_comment_nospell= 1
let g:tex_verbspell= 1
"spell checkong enabled for tex
autocmd FileType tex set spell

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
"configure the colors
highlight Pmenu ctermbg=238 gui=bold 

"settings for delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"set wrap
"set tw =80

"set iskeyword+=:
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"the following code can open vim to the line last time you close it
if has("autocmd")
	autocmd BufRead *.txt set tw=78
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\   exe "normal g'\"" |
				\ endif
endif

"call nerdtree using F3
nnoremap <F3> :NERDTreeToggle<CR>

"paste mode switch using F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set winaltkeys=no


"gnu format indentation
function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
  setlocal shiftwidth=2
  setlocal tabstop=8
  setlocal expandtab
endfunction
au FileType c,cc,cpp call GnuIndent() 

set makeprg=./waf
" map control-backspace to delete the previous word
:imap <C-BS> <C-W>

"enable hex mode
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>
