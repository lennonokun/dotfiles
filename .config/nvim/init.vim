let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')
" Big boys
<<<<<<< HEAD
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
=======
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'justinmk/vim-sneak'
Plug 'jooize/vim-colemak'
" Cosmetic
Plug 'vim-python/python-syntax'
Plug 'rust-lang/rust.vim'
Plug 'kmonad/kmonad-vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
call plug#end()

" ------------------------------------------- "
" VIM CONFIG
set nocompatible
set noshowmode " don't show mode, already see in airline
filetype plugin on " Enable plugin loading by filetype
syntax on

colorscheme NeoSolarized
set background=dark
set termguicolors

" allow for transparency
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE
>>>>>>> 6811335 (added nvim)

set hidden
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set nowrap
set encoding=utf-8

<<<<<<< HEAD
set undodir=~/.vim/undodir
=======
set undodir=~/.local/share/nvim/undodir " TODO make relative to XDG DATA?
>>>>>>> 6811335 (added nvim)
set undofile

set number relativenumber " relative line numbering
set showtabline=2 " forces tabline to be shown
<<<<<<< HEAD
set noshowmode " mode messages unneccary bc of lightline
=======
set noshowmode " mode messages unnecessary bc of lightline
>>>>>>> 6811335 (added nvim)
set incsearch " incremental search
set splitbelow splitright " Splits open at the bottom and right
set wildmode=longest,list,full " Enable autocompletion

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

<<<<<<< HEAD
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
=======
" ------------------------------------------- "
" PLUGINS

" Lightline
" TODO customize further
" can't get bufferline to show numbers
>>>>>>> 6811335 (added nvim)
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
<<<<<<< HEAD
	\ }
	\ }

" FZF
" Find file, history, buffers, lines, rg
nnoremap <leader>ff :Files<CR> 
nnoremap <leader>fh :History<CR> 
=======
	\ },
	\ }

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" python-syntax
let g:python_highlight_all = 1

" rust.vim
let g:rust_recommended_style = 0 " 2 space good

" vim-sneak
nmap f <Plug>Sneak_s
omap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
omap F <Plug>Sneak_S
nmap b <Plug>Sneak_;
nmap B <Plug>Sneak_,

" FZF
" Find file, history, buffers, lines, ripgrep
nnoremap <leader>ff :Files<CR> 
nnoremap <leader>fh :Files ~<CR>
nnoremap <leader>fr :History<CR> 
>>>>>>> 6811335 (added nvim)
nnoremap <leader>fb :Buffers<CR> 
nnoremap <leader>fl :Lines<CR> 
nnoremap <leader>fg :Rg<CR> 

<<<<<<< HEAD
" Use semicolon instead of colon
map ;  :

" Alt move to switch buffers or drag line
nnoremap <A-h> :bp<CR>
=======
" ------------------------------------------- "
" GENERAL BINDS

" Use semicolon instead of colon
map ; :

" Adjust movement keys for colemak mod-dh
nnoremap m h


" Config binds
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>rs :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ec :e ~/.config/nvim/init.vim<CR>

" Alt move to switch buffers or drag line
nnoremap <A-m> :bp<CR>
>>>>>>> 6811335 (added nvim)
nnoremap <A-n> :m .+1<CR>==
nnoremap <A-e> :m .-2<CR>==
nnoremap <A-i> :bn<CR>

<<<<<<< HEAD
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
=======
nnoremap <leader>q :wq<CR>

" Buffers
nnoremap <leader>bk :bd<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bw :w<CR>

" Windows
nnoremap <leader>wc <C-w>q
nnoremap <leader>wm <C-w>h
nnoremap <leader>wn	<C-w>j
nnoremap <leader>we	<C-w>k
nnoremap <leader>wi	<C-w>l
nnoremap <leader>wh :split<CR>
nnoremap <leader>wv :vsplit<CR>

" Turbo navigation
nnoremap <silent> M @='5h'<CR>|xnoremap <silent> H @='5h'<CR>|onoremap <silent> H @='5h'<CR>|
nnoremap <silent> N @='5gj'<CR>|xnoremap <silent> N @='5gj'<CR>|onoremap <silent> N @='5gj'<CR>|
nnoremap <silent> E @='5gk'<CR>|xnoremap <silent> E @='5gk'<CR>|onoremap <silent> E @='5gk'<CR>|
nnoremap <silent> I @='5l'<CR>|xnoremap <silent> I @='5l'<CR>|onoremap <silent> I @='5l'<CR>|
>>>>>>> 6811335 (added nvim)
