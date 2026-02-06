" =========================
" vim-config — Minimal Vim config (NERDTree always-on, correct root)
" Leader: ,
" =========================

let mapleader=","
let maplocalleader=","

set nocompatible
set encoding=utf-8
set hidden
set backspace=indent,eol,start

" UI
set number
set relativenumber
set cursorline
set laststatus=2
set nowrap

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indent
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent

" Clipboard
set clipboard=unnamedplus

" Completion (native)
set completeopt=menu,menuone,noselect
set wildmenu

" Escape veloce
inoremap jk <Esc>

" =========================
" Window navigation
" =========================
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Utilities
nnoremap <F5> :%s/\s\+$//e<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>r :set relativenumber!<CR>

" =========================
" vim-plug (auto-install if missing)
" =========================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'cocopon/iceberg.vim'

call plug#end()

" =========================
" NERDTree behavior
" =========================
" Always open NERDTree, rooted to the opened file's directory (if any).
" No toggle mapping; close manually with 'q' in the tree or :NERDTreeClose
augroup vimconfig_nerdtree
  autocmd!
  autocmd VimEnter * if argc() > 0 |
        \ execute 'NERDTree' fnameescape(expand('%:p:h')) |
        \ wincmd p |
        \ else |
        \ NERDTree |
        \ endif
  " Close Vim if the only window left is NERDTree
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

" =========================
" Theme
" =========================
set background=dark
silent! colorscheme iceberg
if !exists("g:colors_name")
  colorscheme default
endif

set splitbelow
set splitright
