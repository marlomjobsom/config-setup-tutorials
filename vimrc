" -----------------------------------------------------------------------------
" PLUGINS CONFIGURATION
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --clang-completer' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'szw/vim-tags'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'brooth/far.vim'
Plug 'tweekmonster/braceless.vim'
Plug 'Raimondi/delimitMate'
Plug 'heavenshell/vim-pydocstring'

" Themes
Plug 'jacoborus/tender'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-two-firewatch'

" Initialize plugin system
call plug#end()

" YouCompleteMe
let g:ycm_python_binary_path = 'python'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'ubaryd'
set laststatus=2
set t_Co=256

" identLine
let g:indentLine_color_term = 236
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

" ale
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'python': ['pylint'],
\}

" nerdtree
noremap <F2> :NERDTreeToggle<CR>
noremap <leader>w :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" vim-tags
let g:vim_tags_auto_generate = 1

" ultisnips
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-j>"

" fzf
set rtp+=~/.fzf
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
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R'
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

" tmuxline
let g:tmuxline_preset = {
    \'a'    : '#S',
    \'win'  : '#I #W',
    \'cwin' : '#I #W',
    \'y'    : '%R',
    \'z'    : '#H',
    \ 'options': {'status-justify': 'left'}}

" tpope/vim-fugitive
set statusline+=%{fugitive#statusline()}

" braceless.vim
autocmd FileType python BracelessEnable +indent +fold

" airblade/vim-gitgutter
nmap <Leader>gha <Plug>GitGutterStageHunk
nmap <Leader>ghr <Plug>GitGutterUndoHunk
nmap <Leader>ghv <Plug>GitGutterPreviewHunk
nmap ]gh <Plug>GitGutterNextHunk
nmap [gh <Plug>GitGutterPrevHunk

" heavenshell/vim-pydocstring
nmap <silent> <C-_> <Plug>(pydocstring)

" -----------------------------------------------------------------------------
" VIM INTERNAL CONFIGURATION
" -----------------------------------------------------------------------------

" Set identation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100

" Enable numeration lines
set number
set relativenumber

" Enable omni completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" Auto-reload file edited out from vim
set autoread

" Set Color Column
set cc=101
hi ColorColumn ctermbg=235

" Set the terminal title to the current file
set title

" Incremental search
set incsearch

" Set Theme
colorscheme tender

" Set spaces character
set listchars=tab:»\ ,trail:·,nbsp:·,extends:>,precedes:<
set list

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Set disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable color syntax highlight
syntax enable

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,full

" Sync vim's clipboard with X11 system without use registers
set clipboard=unnamed
set clipboard=unnamedplus

" -----------------------------------------------------------------------------
" VIM SHORCUTS
" -----------------------------------------------------------------------------

" MAP: Moving between buffers
:noremap bn :bnext<CR>
:noremap bp :bprevious<CR>

" MAP: Relative moving tabs
function RelativeNext(count)
    let total_tabs = tabpagenr("$")
    let cur_tab = tabpagenr()
    let next_tab = (cur_tab + a:count -1) % total_tabs + 1
    exec "tabnext" .  next_tab
endfunction
command -count=1 TabNext call RelativeNext(<count>)
map gt :TabNext<CR>

