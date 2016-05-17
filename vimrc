set nocompatible
set nu
set ruler

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'solarized/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'majutsushi/tagbar'
"Plugin 'kien/ctrlp.vim'
"Plugin 'vim-scripts/a.vim'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Raimondi/delimitMate'
Plugin 'jez/vim-better-sml'
"Plugin 'jez/vim-superman'
"Plugin 'jez/vim-c0'
"Plugin 'jez/vim-ispc'
"Plugin 'kchmck/vim-coffee-script'

call vundle#end()

" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <C-w>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>

augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
  " tell syntastic to always stick any detected errors into the location-list
  au FileType sml let g:syntastic_always_populate_loc_list = 1

  " automatically open and/or close the location-list
  au FileType sml let g:syntastic_auto_loc_list = 1
augroup END

" press <Leader>s (i.e., \s) to not automatically check for errors
augroup END

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <silent> <leader>s :SyntasticToggleMode<CR>

filetype plugin indent on

syntax on
"autocmd FileType python setlocal expandtab shiftwidth=8 softtabstop=8
retab

filetype plugin indent on

set mouse=a

set background=dark
"let g:solarized_termcolors=256
"Comment the next two lines if you don't want solarized
"set t_Co=16
"colorscheme solarized

set laststatus=2                                             " always show statusline

set expandtab
set tabstop=4
set softtabstop=4
set clipboard=unnamedplus                                    " yank and paste with the system clipboard
set incsearch
set hlsearch
set encoding=utf-8
set list
set listchars=tab:▸\ ,trail:▫
set title
set ignorecase
set smartcase
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set splitright
set shiftwidth=4
set textwidth=80
set ttyfast "speed up

command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

inoremap kj <Esc>
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i
"inoremap { {<CR><BS>}<Esc>ko
inoremap { {<CR>}<Esc>ko
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Clear last search highlighting
map <Space> :noh<cr>
