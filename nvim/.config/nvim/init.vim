call plug#begin('~/.local/share/nvim/plugged')
" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Add 'end' to ruby 'def'
Plug 'tpope/vim-endwise'

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" ripgrep plugin
Plug 'jremmen/vim-ripgrep'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Language support
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ElmCast/elm-vim'
Plug 'tpope/vim-rails'
Plug 'dag/vim-fish'
Plug 'rhysd/vim-crystal'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Color schemes
Plug '~/.config/base16/output/vim'

" Status bar
Plug 'itchyny/lightline.vim'
Plug '~/.config/base16/output/lightline'

" Disable motion anti-patterns
Plug 'takac/vim-hardtime'

" Multiple cursors
"Plug 'terryma/vim-multiple-cursors'

" Syntax checking
"Plug 'vim-syntastic/syntastic'

" File type icons
"Plug 'ryanoasis/vim-devicons'

" Run ruby tests
"Plug 'skalnik/vim-vroom'

" Easy editing around things
Plug 'tpope/vim-surround'

" Plugin support for repeating
Plug 'tpope/vim-repeat'

" Handy mappings on brackets
Plug 'tpope/vim-unimpaired'

" Initialize plugin system
call plug#end()

" CtrlP with ripgrep
" https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
if executable('rg')
  "set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob "!.git"'
  let g:ctrlp_use_caching = 0
endif
"set wildignore+=*/.git/*,*/tmp/*,*.swp,*/node_modules/*

" Highlight results in ripgrep
"let g:rg_highlight = 'true'

" Color scheme
let g:base16colorspace=256 " Access colors present in 256 colorspace
colorscheme base16-material-alt

" Misc settings
filetype plugin indent on
set number relativenumber " Show line numbers
set list            " Show invisible characters
set tabstop=8       " Width of a tab character
set shiftwidth=2    " Width of an indent
set expandtab       " Expand tabs to spaces
"set scrolloff=10    " Never let cursor hit bottom
set cursorline      " Highlight current line
set synmaxcol=300   " Kill syntax highlighting after column 300

" Status bar
set noshowmode " Remove duplicate mode indicator
let g:lightline = {
  \   'colorscheme': 'base16_material_alt',
  \   'active': {
  \     'left': [
  \       ['mode', 'paste'],
  \       ['gitbranch', 'readonly', 'filename', 'modified']
  \     ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

" Hard mode
let g:hardtime_default_on = 0

" NERDTree
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=35
let g:NERDTreeShowHidden=1

" Key bindings
let g:mapleader = "\<Space>" " Use space for leader key
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
" Ctrl-s for save
nnoremap <silent> <C-s> :update<return>
inoremap <silent> <C-s> <esc>:update<return>
" Ctrl-\ for toggle word wrap
nnoremap <silent> <C-\> :set wrap!<return>

" Run rustfmt on save
"let g:rustfmt_autosave = 1

" Syntastic configuration
"set statusline+=%#warningmsg#
"set statusline+=%{syntasticstatuslineflag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" vim-vroom config
"let g:vroom_use_terminal = 1  " Enable Neovim terminal for tests
"let g:vroom_use_bundle_exec = 0
"let g:vroom_test_unit_command = 'm'

function! OnBufEnter()
  " Automatically enter insert mode in terminal buffers
  if &buftype=='terminal'
    echom 'hello terminal'
    startinsert
  " Automatically quit Vim if quickfix window is the last
  elseif &buftype=='quickfix' || &buftype=='nofile'
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

" Autocommands
augroup Misc
  autocmd!
  " Trigger OnBufEnter callback
  autocmd BufEnter * call OnBufEnter()
  " Remove trailing whitespace on save
  autocmd BufWritePre * %s/\s\+$//e
  " Auto watch init.vim for changes and reload
  autocmd BufWritePost init.vim source $MYVIMRC
  " Auto toggle out of relative numbers for unfocused split
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
