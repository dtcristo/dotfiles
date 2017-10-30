call plug#begin('~/.local/share/nvim/plugged')
" Auto close brackets
Plug 'Townk/vim-autoclose'

" ripgrep plugin
Plug 'jremmen/vim-ripgrep'

" Sensible defaults
" Plug 'tpope/vim-sensible'

" Color schemes
Plug 'chriskempson/base16-vim'

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Elixir support
" Plug 'elixir-lang/vim-elixir'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'mike-hearn/base16-vim-lightline'

" Rails
Plug 'tpope/vim-rails'

" Initialize plugin system
call plug#end()

" CtrlP with ripgrep
" https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Color schemes
let base16colorspace=256 " Access colors present in 256 colorspace
colorscheme base16-solar-flare

" Misc settings
filetype plugin indent on
let mapleader = "\<Space>" " Use space for leader key
set number          " Show line numbers
set list            " Show invisible characters
set tabstop=8       " Width of a tab character
set shiftwidth=2    " Width of an indent
set expandtab       " Expand tabs to spaces

" Key bindings
let mapleader = "\<Space>" " Use space for leader key
map <C-n> :NERDTreeToggle<CR>

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Status bar
set noshowmode      " Remove duplicate mode indicator
let g:lightline = { 'colorscheme': 'base16_solarflare' }
