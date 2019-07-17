call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'PProvost/vim-ps1'
Plug 'Raimondi/delimitMate'                                     " automatic closing of quotes, parenthesis, brackets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py' } " code-completion engine
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'                                   " plugin which shows a git diff in the gutter
Plug 'cespare/vim-toml'
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/SudoEdit.vim'
"Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-easy-align'
Plug 'keith/swift.vim'
Plug 'lervag/vimtex'                                            " A Vim Tex Plugin
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'mileszs/ack.vim'
" Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'                                        " directory browser -
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-voom/VOoM'                                            " emulates a two-pane text outliner
Plug 'blueyed/vim-diminactive'
Plug 'rhysd/vim-grammarous'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'logico-software/typewriter'
Plug 'dbmrq/vim-ditto'
call plug#end()

" " Settings
syntax on                         " show syntax highlighting
set encoding=utf-8
set ts=4                          " set indent to 4 spaces
set shiftwidth=4
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
set nofoldenable                  " disable code folding
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


" Folding auto save
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1

" reload config
let mapleader="\,"
nnoremap <leader>rv :source $MYVIMRC<CR>


" theme
"

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'


" Highlight
hi MatchParen cterm=bold,underline ctermbg=none ctermfg=12

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='base16'
let g:airline#extensions#wordcount#enabled = 0



" Activate FOCUS mode with F12
nmap <F12> :Goyo <bar> Limelight!!<CR>"


" Change the cursor from block to i-beam in INSERT mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END


" quick save
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>


" remap ESC
inoremap jk <ESC>
" vnoremap jk <ESC>
" snoremap jk <ESC>
" cnoremap jk <ESC>


" " hint to keep lines short
" if exists('+colorcolumn')
"   set colorcolumn=80
" endif


" Explore setting
let g:netrw_banner = 0


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

" nnoremap <leader><leader>a :Ag<space>
cnoreabbrev Ack Ack!
nnoremap <Leader><Leader>a :Ack!<Space>

let g:ackprg = 'ag --vimgrep'


" mapping
nmap <F6> :TagbarToggle<CR>
nmap <F5> :SyntasticToggleMode<CR>


" Switch Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>


" Change Filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.cls set filetype=tex
" autocmd BufNewFile,BufReadPost *.tex set filetype=tex
let g:tex_flavor='latex'


" set wrap on diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif


" IndentLine {{
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'startify', 'tagbar', 'vimfiler', 'markdown', 'minimap', 'tex']
" }}


" ctrlP -- Exclude
set wildignore+=*/tmp/*,Rohdaten*,Material*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }


" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.vim/mysnippet'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippet"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"


" youcompleteme
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1
      \}


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
" highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
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
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '%': { 'pattern': '%' },
\ ';': { 'pattern': ';' }
\ }


" vimtex
autocmd BufReadPre *.tex let b:vimtex_main = 'report.tex'
let g:vimtex_view_method = 'skim'
" let g:vimtex_indent_conditionals = {}
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
" let g:grammarous#use_vim_spelllang = 0
" let g:grammarous#enable_spell_check = 1


" vim-better-whitespace
 let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" dito
" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches
