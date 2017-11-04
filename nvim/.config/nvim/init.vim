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
Plug 'dag/vim-fish'
Plug 'rhysd/vim-crystal'

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
colorscheme base16-solarflare

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
let NERDTreeShowHidden=1

" Key bindings
let mapleader = "\<Space>" " Use space for leader key
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
" Tab navigation and movement
nnoremap <M-Tab> gt
nnoremap <M-S-Tab> gT
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
nnoremap <silent> <M-H> :tabmove -1<return>
nnoremap <silent> <M-L> :tabmove +1<return>
nnoremap <silent> <M-!> :tabmove 0<return>
nnoremap <silent> <M-@> :tabmove 1<return>
nnoremap <silent> <M-#> :tabmove 2<return>
nnoremap <silent> <M-$> :tabmove 3<return>
nnoremap <silent> <M-%> :tabmove 4<return>
nnoremap <silent> <M-^> :tabmove 5<return>
nnoremap <silent> <M-&> :tabmove 6<return>
nnoremap <silent> <M-*> :tabmove 7<return>
nnoremap <silent> <M-(> :tabmove 8<return>
" Quickfix list navigation
nnoremap <silent> <M-n> :cnext<return>
nnoremap <silent> <M-N> :cprev<return>
" Clear highlighting on space
"nnoremap <silent> <return> :noh<return><return>
" Ctrl-s for save
nnoremap <silent> <C-s> :w<return>
" Ctrl-\ for toggle word wrap
nnoremap <silent> <C-\> :set wrap!<return>

" Automatically quit Vim if quickfix window is the last
au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix" || &buftype=="nofile"
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
