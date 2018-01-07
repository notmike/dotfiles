" ~/.vimrc
" vim: fdm=marker
"
"
"    ██████╗  █████╗ ████████╗    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"    ██╔══██╗██╔══██╗╚══██╔══╝    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"    ██║  ██║███████║   ██║       ██║   ██║██║██╔████╔██║██████╔╝██║
"    ██║  ██║██╔══██║   ██║       ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"    ██████╔╝██║  ██║   ██║        ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"    ╚═════╝ ╚═╝  ╚═╝   ╚═╝         ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"
" Options - Theme {{{
" -----------------------------------------------------------------------------
set background=dark
let base16colorspace=256
let g:gruvbox_italic=1
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

"
"}}}
" Options - Compatibility {{{
" -----------------------------------------------------------------------------
set nomodeline             " Don't parse modelines, google vim modeline vulnerability
set nocompatible           " Prefer Vim defaults over Vi-compatible defaults.
set encoding=utf-8         " Set the character encoding to UTF-8.
set noswapfile             " Disable swap files
set modifiable             " Allow buffers to create new files/folders

filetype plugin indent on  " Enable file type detection.
syntax on                  " Enable syntax highlighting.

"Enable persisted undo history
set undofile
set undodir=~/.vim-local/undofiles/

"}}}
" Options - Appearance {{{
" -----------------------------------------------------------------------------
set shortmess+=I           " Don't display intro message on vim startup
set cursorline             " Highlights current line
set cursorcolumn           " Highlights current column
set colorcolumn=80         " Show right column in a highlighted colour.
set completeopt-=preview   " Do not show preview window for ins-completion.
set diffopt+=foldcolumn:0  " Do not show fold indicator column in diff mode.
set history=10000          " Number of commands and search patterns to remember.
set laststatus=2           " Always show status line.
set linespace=6            " Increase line height spacing by pixels.
set noshowmode             " Do not show current mode on the last line.
set number                 " Precede each line with its line number.
" set relativenumber         " Adjust other line #'s based on highlighted line
set showcmd                " Show command on last line of screen.
set showmatch              " Show matching brackets.
set t_Co=256               " Set the number of supported colours.
set title                  " Set window title to 'filename [+=-] (path) - VIM'.
set ttyfast                " Indicate fast terminal more smoother redrawing.
" set scrolloff=8            " Keep 8 lines above or below the cursor when scrolling.
set sidescroll=1           " Keep 15 columns next to the cursor when scrolling horizontally
set sidescrolloff=15       " Keep 15 columns next to the cursor when scrolling horizontally
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list                 " Turns on viewing whitespace as special characters

set lazyredraw             " Only redraw when needed

" Highlight Trailing Spaces (ugly code)
match ErrorMsg '\s\+$'

"}}}
" Options - Behaviour {{{
" -----------------------------------------------------------------------------
set backspace=2            " Allow <BS> and <Del> over everything.
set hidden                 " Hide when switching buffers instead of unloading.
set mouse=a                " Enable use of the mouse in all modes.

" set nowrap                 " Disable word wrap.
set wrap linebreak          " wrap lines by default & allow easy navigation
set showbreak=" "
vmap j gj
vmap k gk
nmap j gj
nmap k gk

set spelllang=en_us        " Check spelling in English
set textwidth=0            " Do not break lines after a maximum width.
set wildmenu               " Use enhanced command-line completion.
set wildmode=longest,full  " for autocomplete, complete as much as you can

let g:tex_flavor = 'latex' " Treat *.tex file extensions as LaTeX files.

" Remap ENTER & BACKSPACE to move one paragraph in normal mode
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {
nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

set splitbelow             " New splits below, not above
set splitright             " New splits on the right, not left

"}}}
" Options - Folding {{{
" -----------------------------------------------------------------------------

" Default folding options.
set nofoldenable           " disable folding
set foldignore=            " Do not ignore any characters for indent folding.
set foldlevelstart=99      " Always start editing with all folds open. 0=all closed, 99=all open
set foldmethod=indent      " Form folds by lines with equal indent.
set foldnestmax=10         " Limit fold levels for indent and syntax folding.

" Folding options for specific file types.
autocmd FileType python setlocal foldnestmax=5
autocmd FileType c,cpp,java setlocal foldmethod=syntax foldnestmax=5
autocmd FileType markdown setlocal foldmethod=marker

"}}}
" Options - GUI {{{
" -----------------------------------------------------------------------------

if has('gui_running')
  " set guifont=Monospace:h18   " Set the font to use.
  set guifont=Monospace 11   " Set the font to use.
  set guioptions=                 " Remove all GUI components and options.
  set guicursor+=a:block-blinkon0 " Use non-blinking block cursor.

  " Paste from PRIMARY
  inoremap <silent> <S-Insert> <Esc>"*p`]a
  " Paste from CLIPBOARD
  inoremap <silent> <M-v> <Esc>"+p`]a
endif

"}}}
" Options - Indents and Tabs {{{
" -----------------------------------------------------------------------------

" Default indent and tab options.
set autoindent             " Copy indent from previous line.
set expandtab              " Replace tabs with spaces in Insert mode.
set shiftwidth=4           " Spaces for each (auto)indent.
set smarttab               " Insert and delete sw blanks in the front of a line.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.

" Indent and tab options for specific file types.
autocmd FileType c,make setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd FileType js,jsx,json,less,ruby,sass,scss,sql,vim,zsh setlocal shiftwidth=2 softtabstop=2 tabstop=2
" Ali: to indent json files on save
" autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool

"}}}
" Options - Searching {{{
" -----------------------------------------------------------------------------

set hlsearch               " Highlight search pattern results.
set ignorecase             " Ignore case of normal letters in a pattern.
set incsearch              " Highlight search pattern as it is typed.
set smartcase              " Override ignorecase if pattern contains upper case.

"}}}
" Options - File Browser {{{
" -----------------------------------------------------------------------------
let g:netrw_banner = 0
"let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
"let g:netrw_altv = 1
"let g:netrw_winsize = 20
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

"}}}
" Mappings - General {{{
" -----------------------------------------------------------------------------

" Define <Leader> key.
let mapleader = ','
let maplocalleader = ','

" Exit insert mode.
inoremap jj <esc>

"Change the current word to be UPPERCASE on U
nnoremap U vawUew

" Unmap the arrow keys, now UP & DOWN will move lines up & down
no <down> ddp
no <up> ddkP

" Always focus on splited window.
nnoremap <C-w>s <C-w>s<C-w>w
nnoremap <C-w>v <C-w>v<C-w>w

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Switch colon with semi-colon.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Search command history matching current input.
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Stop the highlighting for the current search results.
nnoremap <Space> :nohlsearch<CR>

" Navigate split windows.
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Navigate buffers.
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

" Navigate location list.
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Search for trailing spaces and tabs (mnemonic: 'g/' = go search).
nnoremap g/s /\s\+$<CR>
nnoremap g/t /\t<CR>

" Write current file as superuser.
cnoremap w!! w !sudo tee > /dev/null %

" Quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

" Sane Line Joins
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" Run Python Files by pressing F9
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear;python' shellescape(@%, 1)<cr>

"}}}
" Mappings - Toggle Options {{{
" -----------------------------------------------------------------------------

" (mnemonic: 'co' = change option).
nnoremap com :set mouse=<C-R>=&mouse == 'a' ? '' : 'a'<CR><CR>
nnoremap con :set number!<CR>
nnoremap cop :set paste!<CR>
nnoremap cos :set spell!<CR>
nnoremap cow :set wrap!<CR>

"}}}
" Mappings - Clipboard {{{
" -----------------------------------------------------------------------------
" NOTE: You must install Gvim or vim w/ -xterm_clipboard to get this to work
 set clipboard=unnamedplus
 vmap <C-c> "+yi
 vmap <C-x> "+c
 vmap <C-v> c<ESC>"+p
 imap <C-v> <ESC>"+pa
 vnoremap yy "+y
 nnoremap Y "+y$
 " Visually select the text that was last edited/pasted (Vimcast#26).
 noremap gV `[v`]

"}}}
" Plugins Install {{{
" -----------------------------------------------------------------------------

" Requires https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'                  " Color scheme gruvbox
Plug 'sjl/gundo.vim'                    " Fancy Undo Screen
Plug 'scrooloose/nerdtree'              " File explorer window.
Plug 'junegunn/vim-easy-align'          " Text alignment by characters.
Plug 'tpope/vim-surround'               " Quoting/parenthesizing made simple.
Plug 'tpope/vim-repeat'                 " Enable repeat for tpope's plugins.
Plug 'tpope/vim-commentary'             " Commenting made simple.
Plug 'tpope/vim-fugitive'               " Git wrapper.
Plug 'vim-airline/vim-airline'          " Pretty Statusline
Plug 'vim-airline/vim-airline-themes'   " Themes for Airline status bar
Plug 'easymotion/vim-easymotion'        " Move around screen fast!
Plug 'Shougo/context_filetype.vim'      " Get current context for autocompletion.
Plug 'Shougo/neocomplete.vim'           " Synchronous auto completion.
Plug 'benekastah/neomake'               " Asynchronous syntax checking with make.
Plug 'airblade/vim-gitgutter'           " Shows git changes in file
Plug 'Konfekt/FastFold'                 " FastFold <- required by neocomplete
Plug 'chrisbra/csv.vim'                 " Awesome for viewing CSVs
Plug 'edkolev/tmuxline.vim'             " Tmux integration (airline extends this)
Plug 'reedes/vim-lexical'               " Spell check /Dictionary
Plug 'sheerun/vim-polyglot'             " Comprehensive language pack (only loads when needed)
" Plug 'majutsushi/tagbar'                " Display tags in a split window.
" Plug 'ctrlpvim/ctrlp.vim'               " Command line fuzzy finder
" Plug 'jiangmiao/auto-pairs'             " Inserts and Deletes brackets, parens, quote paris.
Plug 'severin-lemaignan/vim-minimap'    " Minimap sidebar!
Plug 'valloric/matchtagalways'          " Highlights enclosing tags
Plug 'shime/vim-livedown'               " Live Markdown Preview
Plug 'vim-syntastic/syntastic'          " Syntax checker

" Code Formatter (JS·CSS·SCSS·Less·JSX·GraphQL·JSON·Markdown
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

" Plugins to enable only on the command line.
if !has('gui_running')
  " Command-line fuzzy finder.
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endif

call plug#end()

"}}}
" Plugin Settings - airline {{{
" -----------------------------------------------------------------------------

let g:airline_left_sep = ''        " Remove arrow symbols.
let g:airline_left_alt_sep = ''    " Remove arrow symbols.
let g:airline_right_sep = ''       " Remove arrow symbols.
let g:airline_right_alt_sep = ''   " Remove arrow symbols.
let g:airline_theme = 'gruvbox'    " Use current theme.
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 1  " enable word counting
let g:airline#extensions#tmuxline#enabled = 1   " enable tmux integration
let g:airline#extensions#capslock#enabled = 1   " enable caps lock block

set laststatus=2

"}}}
" Plugin Settings - easy-align {{{
" -----------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"}}}
" Plugin Settings - fugitive {{{
" -----------------------------------------------------------------------------

" Toggle git-blame window
nnoremap <Leader>g :Gblame!<CR>

"}}}
" Plugin Settings - fzf {{{
" -----------------------------------------------------------------------------
let g:fzf_layout = { 'down': '20' } " Position the default fzf window layout.
let g:fzf_command_prefix = 'Fzf'  " Prefix fzf commands e.g. :FzfFiles.

if exists('plugs') && has_key(plugs, 'fzf.vim')
  " Find buffers.
  nnoremap <Leader>e :FzfBuffers<CR>

  " Find files.
  nnoremap <Leader>o :FzfFiles<CR>

  " Find project tags (ctags -R).
  nnoremap <Leader><S-O> :FzfTags<CR>

  " Find tags in current buffer.
  nnoremap <Leader>r :FzfBTags<CR>

  " Find pattern in files with ag.
  nnoremap <Leader>p :FzfAg<CR>
endif

"}}}
" Plugin Settings - latex-box {{{
" -----------------------------------------------------------------------------

"let g:LatexBox_latexmk_async = 1 " Enable asynchronous Latex compilation.

""}}}
" Plugin Settings - neocomplete {{{
" -----------------------------------------------------------------------------

let g:neocomplete#enable_at_startup = 1 " Enable neocomplete on startup.
let g:neocomplete#enable_smart_case = 1 " Enable smart case.

" Tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" On backspace, delete previous completion and regenerate popup.
inoremap <expr><C-H> neocomplete#smart_close_popup()."\<C-H>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-H>"

"}}}
" Plugin Settings - neomake {{{
" -----------------------------------------------------------------------------

" Use custom configuration file with ESLint:
" https://github.com/w0ng/dotfiles/blob/master/.eslintrc
let g:neomake_javascript_eslint_maker = {
      \ 'args': ['-c', '~/.eslintrc', '-f', 'compact'],
      \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
      \ '%W%f: line %l\, col %c\, Warning - %m'
      \ }

" Use PSR2 standard with PHP CodeSniffer.
let g:neomake_php_phpcs_args_standard = 'PSR2'

" Use custom rule set with PHP Mess Detector:
" https://github.com/w0ng/dotfiles/blob/master/.phpmd.xml
let g:neomake_php_phpmd_maker = {
      \ 'args': ['%:p', 'text', '~/.phpmd.xml'],
      \ 'errorformat': '%E%f:%l%\s%m'
      \ }

"}}}
" Plugin Settings - nerdtree {{{
" -----------------------------------------------------------------------------

" Toggle NERD tree window.
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""}}}
" Plugin Settings - plug {{{
" -----------------------------------------------------------------------------

let g:plug_window = 'topleft new' " Open plug window in a horizontal split.

"}}}
" Plugin Settings - tagbar {{{
" -----------------------------------------------------------------------------

let g:tagbar_left = 1 " Open the Tagbar window on the left side.

" Toggle Tagbar window.
nnoremap <Leader>2 :TagbarToggle<CR>

"}}}
" Plugin Settings - Gundo Undo {{{
" -----------------------------------------------------------------------------

nnoremap <leader>u :GundoToggle<CR>  " toggle gundo
"}}}
" Plugin Settings - Lexical Spellcheck {{{
" -----------------------------------------------------------------------------

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spell = 1         " 0=disabled, 1=enabled
"}}}
" Plugin Settings - Prettier {{{
" -----------------------------------------------------------------------------

"let g:prettier#exec_cmd_async = 1

"}}}
" Plugin Settings - livedown {{{
" -----------------------------------------------------------------------------
nnoremap gm :LivedownToggle<CR>

" should markdown preview get shown automatically upon opening markdown buffer
" let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
" let g:livedown_open = 1
" the port on which Livedown server will run
" let g:livedown_port = 1337
" the browser to use
" let g:livedown_browser = "firefox"
"}}}
" Plugin Settings - EasyMotion {{{
" -----------------------------------------------------------------------------

nmap F <Plug>(easymotion-prefix)s

"}}}
" Plugin Settings - Syntastic {{{
" -----------------------------------------------------------------------------
" let g:syntastic_html_eslint_exec = 'eslint_d'   "<-- only if using eslint_d
" let g:syntastic_javascript_eslint_exec = 'eslint_d'  "<--  only if using eslint_d

let g:syntastic_aggregate_errors = 1    " display all errors from all checkers together
let g:syntastic_html_checkers = ['eslint', 'w3']
let g:syntastic_javascript_checkers = ['jsxhint', 'eslint']
let g:syntastic_python_checkers = ['prospector']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"}}}

