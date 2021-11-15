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

set cmdheight=2            " Give more space for displaying messages

"}}}
" Options - Behavior {{{
" -----------------------------------------------------------------------------
set mouse=a                " Enable use of the mouse in all modes.
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
  " au BufWritePre * %s/\s\+$//e
  " Jump to last know cursor position if not the 1st line
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \	execute 'normal! g`"zvzz' |
    \ endif
augroup END

" Wipe all the registers!
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

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
set shiftwidth=4           " Spaces for each (auto)indent.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.
set expandtab              " Replace tabs with spaces in Insert mode.

" Indent and tab options for specific file types.
autocmd FileType javascript,javascript.jsx,json,less,ruby,sass,scss,sql,vim,yml,zsh setlocal shiftwidth=2 softtabstop=2 tabstop=2

"}}}
" Options - Searching {{{
" -----------------------------------------------------------------------------

set ignorecase             " Ignore case of normal letters in a pattern.
set smartcase              " Override ignorecase if pattern contains upper case.

" Search for highlighted text, forwards or backwards.
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

" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/Users/notmike/.pyenv/versions/3.10.0/bin/python3'

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

" copy and paste
set clipboard+=unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Select all
nmap <C-a> gg<S-v>G

" Visually select the text that was last edited/pasted
noremap gV `[v`]

" yank whole line from cursor
nnoremap Y y$
vnoremap Y y$

" Stop the highlighting for the current search results.
nnoremap <Space> :nohlsearch<CR>

" Navigate split windows.
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

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

" Search and Replace
noremap <leader>h :%s//g<Left><Left>

" Trim all whitespace
nnoremap <leader>t :%s/\s\+$//e<CR>

" Run Python/Java files by pressing F9
if has('nvim')
    " nnoremap <F9> :call RunFile()<cr>
    let @m = expand("%:t")      " puts the filename (with extension) in register m
    let @n = expand("%:t:r")    " puts the filename (withOUT extension) in register n
    autocmd FileType python nnoremap <F9> :15Term python \<c-r>m\<CR>
    autocmd FileType javascript nnoremap <F9> :15Term node \<c-r>m\<CR>
    autocmd FileType java nnoremap <F9> :15Term javac \<c-r>m && java \<c-r>n\<CR>
else
    autocmd FileType python nnoremap <buffer> <F9> :!python %<CR>
endif

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

" Diff current buffer and the original file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"}}}
" Mappings - Toggle Options {{{
" -----------------------------------------------------------------------------

" (mnemonic: 'co' = change option).
nnoremap cos :set spell!<CR>
nnoremap cow :set wrap!<CR>
nnoremap cor :set relativenumber!<CR>

"}}}
" Plugins Install {{{
" ----------------------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'ap/vim-css-color'                 " A very fast, color name highlighter
Plug 'morhetz/gruvbox'                  " Color scheme gruvbox
Plug 'simnalamburt/vim-mundo'           " Fancy Undo Screen

Plug 'Yggdroot/indentLine'              " Pretty line indentations

Plug 'scrooloose/nerdtree'	            " File Manager
Plug 'Xuyuanp/nerdtree-git-plugin'      " Shows git status of files in NERDtree menu
Plug 'DougBeney/pickachu'               " Color / Date / File Picker
Plug 'mklabs/split-term.vim'            " Better Neovim terminal commands
Plug 'vim-airline/vim-airline'          " Pretty Statusline
Plug 'vim-airline/vim-airline-themes'   " Themes for Airline status bar
Plug 'tpope/vim-commentary'             " Commenting made simple.
Plug 'junegunn/vim-easy-align'	    	  " Text alignment by characters.
Plug 'easymotion/vim-easymotion'        " navigate documents reallllly fast!
Plug 'tpope/vim-fugitive'               " Track Git changes
Plug 'airblade/vim-gitgutter'           " Shows git changes in file
Plug 'luukvbaal/stabilize.nvim'         " Stablize window from losing position

" Code Formatter (JS·CSS·SCSS·Less·JSX·GraphQL·JSON·Markdown
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'tpope/vim-repeat'                 " Add .(dot) functionality to plugin motions
Plug 'tpope/vim-surround'           	" Quoting/parenthesizing made simple.

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Always load this plugin last per developer
Plug 'ryanoasis/vim-devicons'           " Cool icons in NERDtree menu for different filetypes
call plug#end()

"}}}
" Plugin Settings - EasyMotion {{{
" -----------------------------------------------------------------------------
nmap F <Plug>(easymotion-prefix)s

"}}}
" Plugin Settings - GitGutter {{{
" -----------------------------------------------------------------------------
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'

"}}}
" Plugin Settings - Mundo Undo {{{
" -----------------------------------------------------------------------------
nnoremap <leader>u :MundoToggle<CR>  " toggle mundo
"}}}
" Plugin Settings - indentLine {{{
" -----------------------------------------------------------------------------
" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"}}}
" Plugin Settings - nerdtree {{{
" -----------------------------------------------------------------------------

nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
		\ "Modified"  : "✹",
		\ "Staged"	  : "✚",
		\ "Untracked" : "✭",
		\ "Renamed"   : "➜",
		\ "Unmerged"  : "═",
		\ "Deleted"   : "✖",
		\ "Dirty"	    : "✗",
		\ "Clean"	    : "✔︎",
		\ 'Ignored'   : '☒',
		\ "Unknown"   : "?"
		\ }
"}}}
" Plugin Settings - Pickachu {{{
" -----------------------------------------------------------------------------
nnoremap <A-c> :Pickachu<CR>
inoremap <A-c> :Pickachu<CR>

"}}}
" Plugin Settings - Prettier {{{
" -----------------------------------------------------------------------------
" The command :Prettier by default is synchronous but can also be forced async
let g:prettier#exec_cmd_async = 1
" Disable auto formatting of files that have "@format" tag
let g:prettier#autoformat = 0
" Control+P calls :Prettier instead of default <Leader>P since taken by fzf
nmap <C-P> <Plug>(PrettierAsync)

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

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
" Plugin Settings - Vim-DevIcons {{{
" -----------------------------------------------------------------------------
" .bmp, .c, .coffee, .cpp, .css, .erb, .go, .hs, .html, .java, .jpg, .js, .json,
" .jsx, .less, .lua, .markdown, .md, .php, .png, .pl, .py, .rb, .rs, .scala,
" .scss, .sh, .sql, .vim
" let s:brown = '905532'
" let s:aqua =  '3AFFDB'
" let s:blue = '689FB6'
" let s:darkBlue = '44788E'
" let s:purple = '834F79'
" let s:lightPurple = '834F79'
" let s:red = 'AE403F'
" let s:beige = 'F5C06F'
" let s:yellow = 'F09F17'
" let s:orange = 'D4843E'
" let s:darkOrange = 'F16529'
" let s:pink = 'CB6F6F'
" let s:salmon = 'EE6E73'
" let s:green = '8FAA54'
" let s:lightGreen = '31B53E'
" let s:white = 'FFFFFF'
" let s:rspec_red = 'FE405F'
" let s:git_orange = 'F54D27'

" NERDTress File highlighting only the glyph/icon
" test highlight just the glyph (icons) in nerdtree:
autocmd filetype nerdtree highlight cpp_icon ctermbg=none ctermfg=Red guifg=#689FB6
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#689FB6
autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#f5c06f
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#F16529
autocmd filetype nerdtree highlight markdown_icon ctermbg=none ctermfg=Red guifg=#F09F17
autocmd filetype nerdtree highlight php_icon ctermbg=none ctermfg=Red guifg=#44788E
autocmd filetype nerdtree highlight python_icon ctermbg=none ctermfg=Red guifg=#F09F17
autocmd filetype nerdtree highlight shell_icon ctermbg=none ctermfg=Red guifg=#834f79
autocmd filetype nerdtree highlight sql_icon ctermbg=none ctermfg=Red guifg=#689FB6

" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syn match cpp_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match markdown_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match php_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match python_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match shell_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match sql_icon ## containedin=NERDTreeFile

"}}}
" Plugin Settings - Stablize {{{
" -----------------------------------------------------------------------------
lua << EOF
require("stabilize").setup()
EOF

"}}}
" Plugin Settings - CMP Config {{{
" -----------------------------------------------------------------------------
set completeopt=menu,menuone,noselect
lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
EOF
"}}}
