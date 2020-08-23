let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense
Plug 'vim-utils/vim-man' " view man pages with :man <command>
Plug 'mboughaba/i3config.vim'
Plug 'vimwiki/vimwiki'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree' 
Plug 'vim-python/python-syntax'
call plug#end()

" -------------------------------------------
set nocompatible
filetype plugin on " Enable plugin loading by filetype
syntax on
source $HOME/.config/nvim/themes/solarized.vim " Load solarized theme

set hidden
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set nowrap

set undodir=~/.vim/undodir
set undofile

set number relativenumber
set incsearch " incremental search
set splitbelow splitright " Splits open at the bottom and right
set wildmode=longest,list,full " Enable autocompletion

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Shortcut split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Alt move to drag line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Python syntax highlighting
let g:python_hightlight_all = 1

" COC - TODO GET ROPE AND AUTOCOMPLETE STUFF FULLY WORKING
" --------------------------------------------
" TODO POSSIBLY CHANGE PYTHON.AUTOCOMPLETE.EXTRAPATHS so stuff like tensorflow gets autocompleted
" Install more with CocInstall
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ ]

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Remap keys for  gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap F2 to rename
nmap <F2> <Plug>(coc-rename)
