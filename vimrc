" -----------------------------------------------------------------------------
" PLUGINS INSTALLATION
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" General
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" Language Support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', {
    \'do': 'python install.py --clang-completer --go-completer --js-completer'
    \}

" Appearance
Plug 'jacoborus/tender'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" -----------------------------------------------------------------------------
" PLUGINS CONFIGURATION
" -----------------------------------------------------------------------------

" fatih/vim-go
let g:go_textobj_include_function_doc = 1
let g:go_addtags_transform = 'camelcase'
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['golint']
let g:go_metalinter_autosave = 1

" junegunn/fzf
set rtp+=~/.fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags --fields=+l -R'
let g:fzf_colors =
    \ { 'fg':    ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" edkolev/tmuxline.vim
let NERDTreeIgnore=['\.pyc$', '\~$']

" w0rp/ale
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
let g:ale_linters = {
\   'python': ['pylint'],
\   'go': ['golint'],
\   'xml': ['xmllint'],
\   'html': ['htmlhint'],
\   'javascript': ['eslint'],
\   'css': ['csslint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'

" edkolev/tmuxline.vim
let g:tmuxline_preset = {
    \'a'    : '#S',
    \'win'  : '#I #W',
    \'cwin' : '#I #W',
    \'y'    : '%R',
    \'z'    : '#H',
    \ 'options': {'status-justify': 'left'}}

" vim-airline/vim-airline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ubaryd'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'c' : 'C',
      \ 'v' : 'V',
      \ 'V' : 'V',
      \ 's' : 'S',
      \ 'S' : 'S',
      \ }

" Valloric/YouCompleteMe
let g:ycm_python_binary_path = 'python'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion=1

" Xuyuanp/nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" -----------------------------------------------------------------------------
" VIM INTERNAL CONFIGURATION
" -----------------------------------------------------------------------------

" Load the plugin for specific file types
filetype plugin on

" Sync vim's clipboard with X11 system without use registers
set clipboard=unnamed
set clipboard=unnamedplus

" Enable numeration lines
set number
set relativenumber

" Incremental search
set incsearch

" Enable color syntax highlight
syntax enable

" Set spaces character
set listchars=tab:»\ ,trail:·,nbsp:·,extends:>,precedes:<
set list

" Set Theme
colorscheme tender

" Set Color Column
set cc=101
set laststatus=2
hi ColorColumn ctermbg=236

" Set identation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100

" Search down into subfolders and provides completion for file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,full

" Set utf8 as standard encoding
set encoding=utf8

" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" -----------------------------------------------------------------------------
" SHORCUTS
" -----------------------------------------------------------------------------

" SHORTCUT: Moving between buffers
:noremap bn :bnext<CR>
:noremap bp :bprevious<CR>

" SHORTCUT: fatih/vim-go
autocmd FileType go nmap <leader>r <Plug>(go-run)

" SHORTCUT: w0rp/ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" SHORTCUT: junegunn/fzf
noremap <leader>f :Files<CR>
noremap <leader>a :Ag<CR>
noremap <leader>t :BTags<CR>
noremap <leader>T :Tags<CR>
noremap <leader>l :BLines<CR>
noremap <leader>L :Lines<CR>
noremap <leader>C :Commits<CR>
noremap <leader>b :Buffers<CR>
imap <C-x><C-w> <plug>(fzf-complete-word)
imap <C-x><C-p> <plug>(fzf-complete-path)
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

" SHORTCUT: Valloric/YouCompleteMe
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" SHORTCUT: edkolev/tmuxline.vim
noremap <F2> :NERDTreeToggle<CR>
noremap <leader>w :NERDTreeFind<CR>
