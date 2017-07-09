call plug#begin('~/.local/share/nvim/plugged')
" ripgrep plugin
Plug 'jremmen/vim-ripgrep'

" Sensible defaults
Plug 'tpope/vim-sensible'

" Color schemes
" Plug 'chriskempson/base16-vim'
" Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

" Elixir support
" Plug 'elixir-lang/vim-elixir'

" Git support
" Plug 'tpope/vim-fugitive'

" Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'

" Add plugins to &runtimepath
call plug#end()

" inoremap jk <ESC>
" let mapleader = "\<Space>"
" nnoremap <leader>n :NERDTreeFind<CR>

" Remove duplicate mode indicator
" set noshowmode

" Syntax highlighting
" syntax on
" set background=dark
" colorscheme solarized
" colorscheme base16-flat
" let g:airline_theme='solarized' lly enabled

" Add line numbers
" set number

" Expand tabs to spaces
" filetype plugin indent on
" set tabstop=2
" set shiftwidth=2
" set expandtab

" Powerline fonts for airline
" let g:airline_powerline_fonts = 1
