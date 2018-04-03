" vim: fdm=marker
"
"
"
"   ██████╗  █████╗ ████████╗    ██╗███╗   ██╗██╗████████╗
"   ██╔══██╗██╔══██╗╚══██╔══╝    ██║████╗  ██║██║╚══██╔══╝
"   ██║  ██║███████║   ██║       ██║██╔██╗ ██║██║   ██║
"   ██║  ██║██╔══██║   ██║       ██║██║╚██╗██║██║   ██║
"   ██████╔╝██║  ██║   ██║       ██║██║ ╚████║██║   ██║
"   ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝
"
"
" Options - Appearance {{{
" ----------------------------------------------------------------------------
" Theme
set background=dark
let base16colorspace=256
let g:gruvbox_italic=1
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"

if has('nvim-0.1.5')        " True color in neovim wasn't added until 0.1.5
    set termguicolors
endif

set shortmess+=I           " Don't display intro message on vim startup
set cursorcolumn           " Highlights current column
set cursorline             " Highlights current line
set colorcolumn=80         " Show right column in a highlighted colour.
set history=10000          " Number of commands and search patterns to remember.
set number                 " Precede each line with its line number.
set relativenumber         " Show other lines distance from current line
set showmatch              " Show matching brackets.
set title                  " Set window title to 'filename [+=-] (path) - NVIM'.

" Highlight Trailing Spaces (ugly code)
match ErrorMsg '\s\+$'

"}}}
" Options - Behavior {{{
" -----------------------------------------------------------------------------
set wrap linebreak          " wrap lines by default & allow easy navigation
set showbreak=" "
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" Remap ENTER & BACKSPACE to move one paragraph in normal mode
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {
nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

set splitbelow             " New splits below, not above
set splitright             " New splits on the right, not left

" Trim Whitespace On Save & Return to last line when opening file
augroup line_return
  au!
  " Trim whitespace onsave
  au BufWritePre * %s/\s\+$//e
  " Jump to last know cursor position if not the 1st line
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \	execute 'normal! g`"zvzz' |
    \ endif
augroup END

"}}}
" Options - Compatibility {{{
" -----------------------------------------------------------------------------
set noswapfile             " Disable swap files
"Enable persisted undo history
set undofile
set undodir=~/.vim-local/undofiles/

"}}}
" Options - Indents and Tabs {{{
" -----------------------------------------------------------------------------

" Default indent and tab options.
set expandtab              " Replace tabs with spaces in Insert mode.
set shiftwidth=4           " Spaces for each (auto)indent.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.

" Indent and tab options for specific file types.
autocmd FileType js,jsx,json,less,ruby,sass,scss,sql,vim,zsh setlocal shiftwidth=2 softtabstop=2 tabstop=2

"}}}
" Options - Searching {{{
" -----------------------------------------------------------------------------

set ignorecase             " Ignore case of normal letters in a pattern.
set smartcase              " Override ignorecase if pattern contains upper case.

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"}}}
" Options - Python {{{
" -----------------------------------------------------------------------------

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

"}}}
" Mappings - General {{{
" -----------------------------------------------------------------------------

" Define <Leader> key.
let mapleader = ','

" Exit insert mode.
inoremap jj <esc>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Switch colon with semi-colon.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"Change the current word to be UPPERCASE on U
nnoremap U vawUew

" Unmap the arrow keys, now UP & DOWN will move lines up & down
no <down> ddp
no <up> ddkP

" Always focus on splited window.
nnoremap <C-w>s <C-w>s<C-w>w
nnoremap <C-w>v <C-w>v<C-w>w

" copy and paste
set clipboard+=unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Visually select the text that was last edited/pasted
noremap gV `[v`]

" yank whole line (w/out newline char)
noremap Y y$
vnoremap Y y$

" Stop the highlighting for the current search results.
nnoremap <Space> :nohlsearch<CR>

" Navigate split windows.
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Write current file as superuser.
cnoremap w!! w !sudo tee > /dev/null %

" Navigate buffers.
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

" Navigate location list.
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Search for trailing spaces and tabs (mnemonic: 'g/' = go search).
nnoremap g/s /\s\+$<CR>
nnoremap g/t /\t<CR>

" Quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

" Run Python Files by pressing F9
autocmd FileType python nnoremap <buffer> <F9> :!python %<CR>

" Easily edit any macro register by typing cr<register>
fun! ChangeReg() abort
  let x = nr2char(getchar())
  call feedkeys("q:ilet @" . x . " = \<c-r>\<c-r>=string(@" . x . ")\<cr>\<esc>0f'", 'n')
endfun
nnoremap cr :call ChangeReg()<cr>

" edit neovim config file
nnoremap <leader>ev :split $MYVIMRC<cr>
" source neovim config file after editing
nnoremap <leader>v :source $MYVIMRC<cr>
"}}}
" Plugins Install {{{
" ----------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')
Plug 'ap/vim-css-color'                 " A very fast, color name highlighter
Plug 'Shougo/deoplete.nvim'             " Asynchronous auto completion.
Plug 'zchee/deoplete-clang'             " Clang autocomplete
Plug 'zchee/deoplete-jedi'              " Python autocomplete
Plug 'morhetz/gruvbox'                  " Color scheme gruvbox
Plug 'sjl/gundo.vim'                    " Fancy Undo Screen

" Command-line fuzzy finder.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neomake/neomake'                  " Asynchronous syntax checking with make.
Plug 'scrooloose/nerdtree'	            " File Manager
Plug 'DougBeney/pickachu'               " Color / Date / File Picker
Plug 'vim-airline/vim-airline'          " Pretty Statusline
Plug 'vim-airline/vim-airline-themes'   " Themes for Airline status bar
Plug 'tpope/vim-commentary'             " Commenting made simple.
Plug 'junegunn/vim-easy-align'	    	  " Text alignment by characters.
Plug 'easymotion/vim-easymotion'        " navigate documents reallllly fast!
Plug 'tpope/vim-fugitive'               " Track Git changes
Plug 'airblade/vim-gitgutter'           " Shows git changes in file

" Code Formatter (JS·CSS·SCSS·Less·JSX·GraphQL·JSON·Markdown
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

Plug 'tpope/vim-repeat'                 " Add .(dot) functionality to plugin motions
Plug 'tpope/vim-surround'           	  " Quoting/parenthesizing made simple.
call plug#end()

"}}}
" Plugin Settings - deoplete {{{
" -----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1 " Enable deoplete on startup.
let g:deoplete#enable_smart_case = 1 " Enable smart case.

" Tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" On backspace, delete previous completion and regenerate popup.
inoremap <expr><C-H> deoplete#mappings#smart_close_popup()."\<C-H>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-H>"

let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
let g:deoplete#sources#jedi#show_docstring = 1

"}}}
" Plugin Settings - EasyMotion {{{
" -----------------------------------------------------------------------------

nmap F <Plug>(easymotion-prefix)s

"}}}
" Plugin Settings - Gundo Undo {{{
" -----------------------------------------------------------------------------

nnoremap <leader>u :GundoToggle<CR>  " toggle gundo
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
" Plugin Settings - neomake {{{
" -----------------------------------------------------------------------------
" Use custom configuration file with ESLint:
" https://github.com/w0ng/dotfiles/blob/master/.eslintrc
let g:neomake_javascript_enabled_makers = ['jsxhint', 'eslint']
let g:neomake_javascript_eslint_maker = {
      \ 'args': ['-c', '~/.eslintrc', '-f', 'compact'],
      \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
      \ '%W%f: line %l\, col %c\, Warning - %m'
      \ }

let g:neomake_python_enabled_makers = ['pep8']

"}}}
" Plugin Settings - nerdtree {{{
" -----------------------------------------------------------------------------

nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"}}}
" Plugin Settings - Prettier {{{
" -----------------------------------------------------------------------------

"let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0

"}}}
" Plugin Settings - Pickachu {{{
" -----------------------------------------------------------------------------
nnoremap <A-c> :Pickachu<CR>
inoremap <A-c> :Pickachu<CR>

"}}}
" Plugin Settings - Prettier {{{
" -----------------------------------------------------------------------------

"let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0

"}}}
" Plugin Settings - airline {{{
" -----------------------------------------------------------------------------

let g:airline_left_sep = ''        " Remove arrow symbols.
let g:airline_left_alt_sep = ''    " Remove arrow symbols.
let g:airline_right_sep = ''       " Remove arrow symbols.
let g:airline_right_alt_sep = ''   " Remove arrow symbols.
let g:airline_theme = 'gruvbox'    " Use current theme.
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 1  " enable word counting

"}}}
" Plugin Settings - easy-align {{{
" -----------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"}}}
