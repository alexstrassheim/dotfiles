call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'chriskempson/base16-vim'
Plug 'chrisbra/SudoEdit.vim'
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-dispatch'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/syntastic'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'Chiel92/vim-autoformat'
Plug 'chrisbra/Colorizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/ZoomWin'
Plug 'jamessan/vim-gnupg'
Plug 'keith/swift.vim'
Plug 'vim-voom/VOoM'
Plug 'scrooloose/nerdtree'
Plug 'PProvost/vim-ps1'
Plug 'cespare/vim-toml'
Plug 'dpelle/vim-LanguageTool'
" Plug 'rhysd/vim-grammarous'
Plug 'lervag/vimtex'                                   " A Vim Tex Plugin
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } " A Vim Plugin for Lively Previewing LaTeX PDF Output
call plug#end()

" Settings
syntax on                         " show syntax highlighting
set encoding=utf-8
set ts=4                          " set indent to 4 spaces
set shiftwidth=4
set expandtab                     " use spaces, not tab characters
set updatetime=100
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
filetype plugin indent on


" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" reload config
let mapleader="\,"
nnoremap <leader>rv :source $MYVIMRC<CR>

" theme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" quick save
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" remap ESC
inoremap jk <ESC>
cnoremap jk <ESC>

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
nnoremap <leader><leader>a :Ag<space>

" mapping
nmap <F6> :TagbarToggle<CR>
nmap <F5> :SyntasticToggleMode<CR>

" Switch Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" Change Filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.cls set filetype=tex
" autocmd BufNewFile,BufReadPost *.tex set filetype=tex
let g:tex_flavor='latex'

" set wrap on diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif


" indentLine
let g:indentLine_char = '¦'
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'startify', 'tagbar', 'vimfiler', 'markdown', 'minimap']


" ctrlP -- Exclude
set wildignore+=*/tmp/*,Rohdaten*,Material*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" " syntastic
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
"
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

"  vim-grammarous languagetool
let g:grammarous#languagetool_cmd = '/usr/local/Cellar/languagetool/4.3/libexec/languagetool-commandline.jar'
let g:grammarous#use_vim_spelllang = 0
let g:grammarous#enable_spell_check = 1
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-f> <Plug>(grammarous-fixit)
endfunction
function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
    nunmap <buffer><C-f>
endfunction
let g:grammarous#disabled_rules = {
            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'EN_UNPAIRED_BRACKETS'],
            \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
            \ }
let g:grammarous#enabled_rules = {'*' : ['PASSIVE_VOICE']}

" vim-languagetool languagetool
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.3/libexec/languagetool-commandline.jar'
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,EN_UNPAIRED_BRACKETS'
let g:languagetool_enable_rules='PASSIVE_VOICE'
let g:languagetool_lang="de-DE"

" Easy Align
let g:easy_align_delimiters = {
\ '%': { 'pattern': '%' }
\ }

" vimtex
let g:vimtex_view_method = 'skim'
" let g:vimtex_indent_conditionals = {}
let g:vimtex_indent_conditionals = {
 \ 'open': '\v(\\newif)@<!\\if(f>|field|name|numequal|thenelse|beginwith)@!',
\ }
