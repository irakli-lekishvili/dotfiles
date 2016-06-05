call plug#begin('~/.config/nvim/plugged')
source ~/.config/nvim/config/plugs.vim
call plug#end()

syntax on
filetype plugin indent on      " Indent and plugins by filetype"
filetype plugin on

let mapleader=" "

" Basic options {{{
scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
" sset ttyfast                  " better screen redraw *** DEPRECATED ***
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set more                        " to show pages using `more` in command outpouts
set number                      " show numbers
set relativenumber              " show relative numbers
set splitright                  " split right
set splitbelow                  " split below
set colorcolumn=80              " show a vertical line at the 80th character
set completeopt-=preview        " hide preview window on completion
set mouse-=a                    " Disable mouse
" set tags=./tags;                " set ctags directory

" Show invisible
"au BufNewFile,BufRead *.* set list listchars=eol:¬,tab:\▸\ ,trail:~,extends:>,precedes:<
au BufNewFile,BufRead *.* set list listchars=tab:\▸\ ,trail:~,extends:>,precedes:<
nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
" }}}

" Searching {{{
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters
" }}}


" Make a dir if no exists {{{
function! MakeDirIfNoExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction
" }}}

" Backups {{{
set backup
set noswapfile
set backupdir=$HOME/.config/nvim/tmp/backup/
set undodir=$HOME/.config/nvim/tmp/undo/
set directory=$HOME/.config/nvim/tmp/swap/
"set viminfo+=$HOME/.vim/tmp/viminfo
"}}}

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)
" }}}


" History and permanent undo levels {{{
set history=1000
set undofile
set undoreload=1000
"}}}


" Wildmenu {{{
"set wildmenu=longest,list,full
set wildmenu                                     " Command line autocompletion

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " Java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats
" }}}


" Tabs, space and wrapping {{{
set expandtab     " spaces instead of tabs
set tabstop=2     " a tab = four spaces
set shiftwidth=2  " number of spaces for auto-indent
set softtabstop=2 " a soft-tab of four spaces
set autoindent    " set on the auto-indent
" }}}


" Ok, a vim for men, get off the cursor keys {{{
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
" }}}


" Colorscheme {{{
syntax enable
set background=dark
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme OceanicNext
" colorscheme base16-tomorrow
colorscheme yowish
" colorscheme onedark
" }}}


" Load matchit by default {{{
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
" }}}


" Plugins setup {{{ ===========================================================


" Airline {{{
"set noshowmode
"let g:airline_theme='powerlineish'
" let g:airline_theme                          = 'serene'
" let g:airline_theme                          = 'distinguished'
let g:airline_theme                          = 'yowish'
let g:airline_powerline_fonts                = 1
let g:airline#extensions#branch#enabled      = 1
let g:airline#extensions#whitespace#enabled  = 1
let g:airline#extensions#hunks#non_zero_only = 1
" }}}


" Gundo {{{
let g:gundo_width          = 30
let g:gundo_preview_height = 20
let g:gundo_left           = 0
let g:gundo_preview_bottom = 1"
" }}}


" Choosewin {{{
let g:choosewin_overlay_enable = 1
" }}}


" Ultisnips {{{
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}


" Easymotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap m <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap m <Plug>(easymotion-s2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}


" Hl matchit {{{
let g:hl_matchit_enable_on_vim_startup = 1
" }}}


" syntastic {{{
"let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" }}}


" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ya <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ya <Plug>(EasyAlign)
" }}}


" FZF {{{
let $FZF_DEFAULT_COMMAND= 'ag -g ""' " Respect .gitignore
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" }}}


" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'enable': {
      \   'tabline': 0
      \}
      \ }
" }}}


" Sidesearch {{{
let g:side_search_prg = 'ag --word-regexp'
      \. " --ignore='*.js.map'"
      \. " --heading --stats -B 1 -A 4"
" Can use `vnew` or `new`
let g:side_search_splitter = 'vnew'
" I like 40% splits, change it if you don't
let g:side_search_split_pct = 0.4
" SideSearch current word and return to original window
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
" }}}


" Unite {{{
let g:unite_source_history_yank_enable = 1
let g:neomru#file_mru_limit = 100
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '-i --vimgrep --hidden --ignore ' .
      \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

let g:default_context = {
      \ 'winheight' : 25,
      \ 'update_time' : 200,
      \ 'prompt' : '>>> ',
      \ 'enable_start_insert' : 0,
      \ 'enable_short_source_names' : 0,
      \ 'marked_icon' : '✓',
      \ 'ignorecase' : 1,
      \ 'smartcase' : 1,
      \ }

call unite#custom#profile('default', 'context', default_context)

" custom ignore pattern
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'tmp/',
      \ 'log/',
      \ 'public/assets/',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'android/app/build/',
      \ '.gradle/',
      \ ], '\|'))

let g:unite_source_history_yank_enable       = 1
let g:unite_force_overwrite_statusline       = 0
let g:unite_split_rule                       = 'botright'
let g:unite_data_directory                   = $HOME.'/.vim/tmp/unite'
let g:unite_source_buffer_time_format        = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format      = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
" }}}


" END of plugins setup }}}


fun! RangerChooser()
  exec "silent !ranger --choosefiles=/tmp/chosenfile " . expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec system('sed -ie "s/ /\\\ /g" /tmp/chosenfile')
    exec 'argadd ' . system('cat /tmp/chosenfile | tr "\\n" " "')
    exec 'edit ' . system('head -n1 /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun


source ~/.config/nvim/config/mappings.vim


let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:javascript_enable_domhtmlcss=1
let g:easytags_dynamic_files = 1
let g:easytags_async = 1


" let g:deoplete#enable_at_startup=1
" let g:deoplete#enable_refresh_always=1
" let g:deoplete#auto_complete_start_length=2
" let g:deoplete#file#enable_buffer_path=1
"
" let g:deoplete#sources={}
" let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
" let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
" let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
" let g:deoplete#sources['javascript.jsx'] = ['buffer', 'member', 'file', 'ultisnips']
" let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
" let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
" let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']
"
" inoremap <C-x><C-k> <NOP>
" let g:UltiSnipsExpandTrigger='<C-j>'
" let g:UltiSnipsListSnippets='<C-l>'
" let g:UltiSnipsJumpForwardTrigger='<C-j>'
" let g:UltiSnipsJumpBackwardTrigger='<C-k>'











let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always=1
let g:deoplete#min_pattern_length=0
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
      \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
      \}

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
  " tern
  if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
  endif
  " set completeopt=menu,preview,noinsert
  let g:deoplete#sources = {}
  let g:deoplete#sources._ = []
  tnoremap <ESC> <C-\><C-n><C-w><C-p>
