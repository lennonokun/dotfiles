let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')
" Big boys
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense
Plug 'junegunn/fzf', { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter' " TODO rebind for colemak
Plug 'vimwiki/vimwiki'
Plug 'jooize/vim-colemak'
Plug 'tpope/vim-surround'
" Cosmetic
Plug 'vim-python/python-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
" Writing
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-sentence'
Plug 'junegunn/goyo.vim' " maybe don't use
call plug#end()

" ------------------------------------------- "
" why doesnt W work immediately?
set nocompatible
filetype plugin on " Enable plugin loading by filetype

syntax on
let g:python_highlight_all = 1 " Python syntax highlighting

colorscheme solarized

set hidden
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set nowrap
set encoding=utf-8

set undodir=~/.vim/undodir
set undofile

set number relativenumber " relative line numbering
set showtabline=2 " forces tabline to be shown
set noshowmode " mode messages unneccary bc of lightline
set incsearch " incremental search
set splitbelow splitright " Splits open at the bottom and right
set wildmode=longest,list,full " Enable autocompletion

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#autoformat = 1

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call pencil#init()
																		\ | call lexical#init()
																		\ | setl spell spl=en_us 
																		\ | Goyo
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" Vim-surround
" TODO practice and commit to muscle memory
let g:surround_no_mappings = 1
nmap ds <Plug>Dsurround
nmap ws  <Plug>Csurround
nmap WS  <Plug>CSurround
nmap cs  <Plug>Ysurround
nmap CS  <Plug>YSurround
nmap css <Plug>Yssurround
nmap CSs <Plug>YSsurround
nmap cSS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround

" Lightline
" TODO customize
let g:lightline = {
	\ "colorscheme": 'solarized',
	\ 'tabline': {
	\		'left': [ ['buffers'] ]
	\ },
	\ 'component_expand': {
	\		'buffers': 'lightline#bufferline#buffers'
	\ },
	\ 'component_type': {
	\		'buffers': 'tabsel'
	\ }
	\ }

" FZF
" Find file, history, buffers, lines, rg
nnoremap <leader>ff :Files<CR> 
nnoremap <leader>fh :History<CR> 
nnoremap <leader>fb :Buffers<CR> 
nnoremap <leader>fl :Lines<CR> 
nnoremap <leader>fg :Rg<CR> 

" Use semicolon instead of colon
map ;  :

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
