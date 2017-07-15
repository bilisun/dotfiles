set nocompatible
set nu
set ruler

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Vim display
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

" Vim text editor
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'

" Ctrl p
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'

" Git
"Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'

" Tmux + man
"Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" Random stuff
Plugin 'jez/vim-better-sml'
"Plugin 'jez/vim-c0'
"Plugin 'kchmck/vim-coffee-script'

Plugin 'rhysd/vim-clang-format'

call vundle#end()

" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

map <CR> :w<CR>
let g:ctrlp_custom_ignore = {                                                                                                                                                                                                                                                                                         [64/348]
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|db|jar|gif|cache)$',
  \ }
let g:ctrlp_user_command = 'ag --vimgrep --nogroup --nobreak --noheading --nocolor -g'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 100
let g:ctrlp_max_files = 0
"let g:ackprg = 'ag -s -H --nocolor --nogroup --column --vimgrep --follow'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}

" ------------- Syntastic settings -----------------------------------------------------

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <C-w>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>
"
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_include_dirs = ['includes', 'headers']
let g:syntastic_cpp_check_header = 1

augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
  " tell syntastic to always stick any detected errors into the location-list
  au FileType sml let g:syntastic_always_populate_loc_list = 1

  " automatically open and/or close the location-list
  au FileType sml let g:syntastic_auto_loc_list = 1
augroup END

" press <Leader>s (i.e., \s) to not automatically check for errors
"augroup END

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <silent> <leader>s :SyntasticToggleMode<CR>

augroup standard
  autocmd!
  autocmd BufNewFile,BufRead */15410-s17-users/*
        \ setlocal tabstop=2 shiftwidth=2 softtabstop=2
        \ | let b:syntastic_checkers = ['make']
        \ | let b:syntastic_c_make_frame = shellescape(expand("%:r"))
augroup END


" --------- Clang Format Settings ------------------------------
augroup clang_format " {
    autocmd!
    autocmd FileType c ClangFormatAutoEnable
    autocmd FileType c nmap <buffer> = :ClangFormat<CR>
    autocmd FileType c vmap <buffer> = :ClangFormat<CR>
augroup END " }
let g:clang_format#detect_style_file=1

"Open/close majutsushi tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

filetype plugin indent on

syntax on
"autocmd FileType python setlocal expandtab shiftwidth=8 softtabstop=8
retab

set mouse=a
set cursorline

if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set background=dark
colorscheme solarized
set t_Co=256

set laststatus=2                                             " always show statusline

set clipboard=unnamed                                    " yank and paste with the system clipboard
set expandtab
set tabstop=2
set softtabstop=2
set incsearch
set hlsearch
set encoding=utf-8
set list
set listchars=tab:▸\ ,trail:▫
set title
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set splitright
set shiftwidth=2
set textwidth=80
set ttyfast "speed up

command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

inoremap kj <Esc>
inoremap { {<CR>}<Esc>ko
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Clear last search highlighting
map <Space> :noh<cr>

if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd
