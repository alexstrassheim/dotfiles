call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ayu-theme/ayu-vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'                                            " A Vim Tex Plugin
Plug 'Chiel92/vim-autoformat'
Plug 'Raimondi/delimitMate'                                     " automatic closing of quotes, parenthesis, brackets
Plug 'Yggdroot/indentLine'
Plug 'cespare/vim-toml'
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/SudoEdit.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-grammarous'
Plug 'dbmrq/vim-ditto'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()}}
call plug#end()

" " Settings
syntax on                         " show syntax highlighting
set encoding=utf-8
set ts=3                          " set indent to 4 spaces
set shiftwidth=3
set expandtab                     " use spaces, not tab characters
set updatetime=1000
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set backspace=2
set autoindent                    " set auto indent
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ruler                         " show row and column in footer
" set nofoldenable                  " disable code folding
set noswapfile
set autoread
set splitbelow
set splitright
set clipboard=unnamed
set cm=blowfish2
set list                         " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
set undofile                     " Maintain undo history between sessions
set undodir=~/.vim/undodir
set pastetoggle=<F2>
set timeoutlen=1000 ttimeoutlen=0
set viminfo='100,f1
set visualbell t_vb=
filetype plugin indent on

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

<<<<<<< HEAD
" Folding auto save
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1

" Folding settings
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

||||||| 5e61cf8
" Folding auto save
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1

=======
>>>>>>> e05b4a6af12698e625ae230f4cab50a72b6f960f
" reload config
let mapleader="\,"
nnoremap <leader>rv :source $MYVIMRC<CR>

" Theme
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Highlight
hi MatchParen cterm=bold,underline ctermbg=none ctermfg=12

" quick save
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" remap ESC
inoremap jk <ESC>

" movement
nnoremap j gj
nnoremap k gk

" split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <silent> <C-w>w :ZoomWin<CR>

" search
nnoremap <leader><leader> :nohlsearch<CR>

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme='papercolor'

" Change the cursor from block to i-beam in INSERT mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" Lex
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_winsize = 15
let g:netrw_preview = 1

" ag
cnoreabbrev Ack Ack!
nnoremap <Leader><Leader>a :Ack!<Space>
let g:ackprg = 'ag --vimgrep'

" mapping
nmap <F6> :TagbarToggle<CR>

" Switch Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>

" Change Filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.cls set filetype=tex
let g:tex_flavor='latex'

" set wrap on diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" IndentLine
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_conceallevel=1
set conceallevel=0

" ctrlP -- Exclude
set wildignore+=*/tmp/*,Rohdaten*,Material*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.vim/mysnippet'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippet"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"

" Shougo deoplete.nvim
let g:deoplete#enable_at_startup = 1

"toggel linenumber
function! ToggleNu()
    if !exists( "b:myNu" )
        let b:myNu = 0
    endif
    let b:myNu = b:myNu + 1
    if b:myNu > 2 | let b:myNu = 0 | endif
    if b:myNu == 0
        set number
    elseif b:myNu == 1
        set relativenumber
    else
        set nonumber
        set norelativenumber
    endif
endfunction
nnoremap <silent> <F3> :call ToggleNu()<CR>

" switch spellcheck languages
hi clear SpellBad
highlight SpellBad ctermbg=124
hi SpellBad cterm=underline
let g:myLangList=["nospell","de_de","en_us","de_de,en_us"]
function! ToggleSpell()
    if !exists( "b:myLang" )
        if &spell
            let b:myLang=index(g:myLangList, &spelllang)
        else
            let b:myLang=0
        endif
    endif
        let b:myLang=b:myLang+1
        if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
        if b:myLang==0
            setlocal nospell
        else
            execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
        endif
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction
nnoremap <silent> <F4> :call ToggleSpell()<CR>

" vim-languagetool languagetool
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.3/libexec/languagetool-commandline.jar'
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,EN_UNPAIRED_BRACKETS'
let g:languagetool_enable_rules='PASSIVE_VOICE'
let g:languagetool_lang="de-DE"

" Easy Align
xmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '%': { 'pattern': '%' },
\ ';': { 'pattern': ';' }
\ }

" vimtex
autocmd BufReadPre *.tex let b:vimtex_main = 'report.tex'
let g:tex_conceal = ''
let g:vimtex_view_method = 'skim'
let g:vimtex_indent_conditionals = {
 \ 'open': '\v(\\newif)@<!\\if(f>|field|name|numequal|thenelse|beginwith)@!',
\ }
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_echo_verbose_input = 0
let g:vimtex_quickfix_enabled = 0
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-lualatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}
let g:vimtex_compiler_latexrun_engines = {
    \ '_'                : 'lualatex',
    \ 'pdflatex'         : 'pdflatex',
    \ 'lualatex'         : 'lualatex',
    \ 'xelatex'          : 'xelatex',
    \}
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '/tmp/latex/output',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" Grammarous
nmap gf <Plug>(grammarous-fixit)
nmap gn <Plug>(grammarous-move-to-next-error)
nmap gp <Plug>(grammarous-move-to-previous-error)


" Markdown preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" vim-better-whitespace
 let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" dito
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off
nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches
