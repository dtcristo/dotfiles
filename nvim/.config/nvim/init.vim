call plug#begin('~/.local/share/nvim/plugged')
" Auto close brackets
Plug 'Townk/vim-autoclose'

" ripgrep plugin
Plug 'jremmen/vim-ripgrep'

" Color schemes
Plug 'chriskempson/base16-vim'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Language support
Plug 'elixir-lang/vim-elixir'
Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-rails'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'mike-hearn/base16-vim-lightline'

" Disable motion anti-patterns
Plug 'takac/vim-hardtime'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Initialize plugin system
call plug#end()

" CtrlP with ripgrep
" https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
set wildignore+=*/.git/*,*/tmp/*,*.swp,*/node_modules/*

" Highlight results in ripgrep
let g:rg_highlight = 'true'

" Color schemes
let base16colorspace=256 " Access colors present in 256 colorspace
colorscheme base16-solar-flare

" Misc settings
filetype plugin indent on
let mapleader = "\<Space>" " Use space for leader key
set number relativenumber  " Show line numbers
set list            " Show invisible characters
set tabstop=8       " Width of a tab character
set shiftwidth=2    " Width of an indent
set expandtab       " Expand tabs to spaces
set scrolloff=10    " Never let cursor hit bottom
set cursorline      " Highlight current line
set synmaxcol=300   " Kill syntax highlighting after column 300
let g:hardtime_default_on = 1 " Hard mode enabled

" Auto toggle out of relative numbers for unfocused split
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" NERDTree
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=40

" Key bindings
let mapleader = "\<Space>" " Use space for leader key
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt
" Clear highlighting on space
nnoremap <silent> <return> :noh<return><return>
" Ctrl-s for save
nnoremap <C-s> :w<return>

" Automatically quit Vim if quickfix window is the last
au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix" || &buftype=="nofile" || &buftype=="help"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

" Auto watch vimrc for changes and reload
autocmd BufWritePost init.vim,.vimrc,_vimrc source $MYVIMRC

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Status bar
set noshowmode      " Remove duplicate mode indicator
let g:lightline = { 'colorscheme': 'base16_solarflare' }
