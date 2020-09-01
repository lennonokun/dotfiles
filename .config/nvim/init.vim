let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense
Plug 'junegunn/fzf', { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'mboughaba/i3config.vim'
Plug 'vim-python/python-syntax'
Plug 'jooize/vim-colemak'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" -------------------------------------------
set nocompatible
filetype plugin on " Enable plugin loading by filetype

syntax on
let g:python_highlight_all = 1 " Python syntax highlighting

colorscheme solarized
let g:airline_theme='solarized'

set hidden
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set nowrap
set encoding=utf-8

set undodir=~/.vim/undodir
set undofile

set number relativenumber " relative line numbering
set incsearch " incremental search
set splitbelow splitright " Splits open at the bottom and right
set wildmode=longest,list,full " Enable autocompletion

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = '%l/%L' " current line / total lines

" FZF
" Find file, history, buffers, lines, rg
nnoremap <leader>ff :Files<CR> 
nnoremap <leader>fh :History<CR> 
nnoremap <leader>fb :Buffers<CR> 
nnoremap <leader>fl :Lines<CR> 
nnoremap <leader>fg :Rg<CR> 

" Shortcut split navigation
map <C-h> <C-w>h
map <C-n> <C-w>n
map <C-e> <C-w>e
map <C-i> <C-w>i

" Alt move to switch buffers or drag line
nnoremap <A-h> :bp<CR>
nnoremap <A-n> :m .+1<CR>==
nnoremap <A-e> :m .-2<CR>==
nnoremap <A-i> :bn<CR>

" Turbo navigation
nnoremap <silent> H @='5h'<CR>|xnoremap <silent> H @='5h'<CR>|onoremap <silent> H @='5h'<CR>|
nnoremap <silent> N @='5gj'<CR>|xnoremap <silent> N @='5gj'<CR>|onoremap <silent> N @='5gj'<CR>|
nnoremap <silent> E @='5gk'<CR>|xnoremap <silent> E @='5gk'<CR>|onoremap <silent> E @='5gk'<CR>|
nnoremap <silent> I @='5l'<CR>|xnoremap <silent> I @='5l'<CR>|onoremap <silent> I @='5l'<CR>|

" COC - TODO GET ROPE AND AUTOCOMPLETE STUFF FULLY WORKING
" --------------------------------------------
" TODO POSSIBLY CHANGE PYTHON.AUTOCOMPLETE.EXTRAPATHS so stuff like tensorflow gets autocompleted
" Install more with CocInstall
let g:coc_global_extensions = [
			\ 'coc-python',
			\ 'coc-json',
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

" Leader rn fo rename
nmap <leader>rn <Plug>(coc-rename)
