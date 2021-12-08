" Python
let g:python3_host_prog = '/usr/bin/python3'
set nocompatible

" Leader
let mapleader = " "

" Settings
set updatetime=50
set shiftround
set expandtab
set foldlevelstart=99
set undofile
set undodir=~/.config/nvim/undo-dir
set clipboard+=unnamedplus
set splitbelow splitright
set number relativenumber
set spelllang=en     " spelling in english
set pastetoggle=<F2> " allow pasting with correct indentation
set smartindent
set scrolloff=8
set lazyredraw
set completeopt=menuone,noinsert,noselect
set inccommand=split
set ignorecase
set smartcase
set cursorline                    " highlight current line
set noswapfile
set tabstop=4                          " set indent to 4 spaces
set shiftwidth=4
set breakindent
set formatoptions=l
set linebreak

filetype on
syntax enable

if has("nvim-0.5.0") || has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif


" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'AndrewRadev/linediff.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'mbbill/undotree'

" The man himself
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tex
Plug 'matze/vim-tex-fold'

" Colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" Colorschemes
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox

hi MatchParen cterm=NONE ctermfg=white ctermbg=DarkRed
hi Search cterm=NONE ctermfg=white ctermbg=DarkBlue
hi clear SpellBad
hi SpellBad ctermfg=15 ctermbg=90


" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon


" Quick save
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>


" Reload config
nnoremap <leader>rv :source $MYVIMRC<CR>


" ESC remap
inoremap jk <ESC>


" movement
nnoremap j gj
nnoremap k gk


" split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>


" resize window
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>


" highlight search off
nnoremap <leader><leader> :nohlsearch<CR>


augroup MOREBUFFS
    autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
    autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
    autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif

    autocmd BufRead,BufNewFile *.markdown setlocal textwidth=80
augroup END


" ag search
cnoreabbrev Ack Ack!
nnoremap <Leader><Leader>a :Ack!<Space>
let g:ackprg = 'ag --vimgrep'


" Switch Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


" Close Buffer
nmap <leader>q :bp <BAR> bd #<CR>


" Toggel linenumber
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
nnoremap <leader>r :call ToggleNu()<CR>


" Switch spellcheck languages
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
nnoremap <leader>l :call ToggleSpell()<CR>
" nnoremap <silent> <F4> :call ToggleSpell()<CR>


" PLUGIN: Undotree
nnoremap <leader>u :UndotreeShow<CR>


" PLUGIN: UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/mysnippet"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippet"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" PLUGIN: Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
            \ '%': { 'pattern': '%' },
            \ ';': { 'pattern': ';' }
            \ }


" PLUGIN: Better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0


" PLUGIN: AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 0
" let g:airline_theme='papercolor'


" PLUGIN: CoC
let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-tsserver',
            \ 'coc-css',
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-vimlsp',
            \ 'coc-highlight',
            \ 'coc-ember',
            \ 'coc-word',
            \ 'coc-texlab',
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-markdownlint',
            \ 'coc-ltex',
            \ 'coc-explorer',
            \ 'coc-pairs',
            \ 'coc-flutter',
            \ ]

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

func GoCoC()
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <silent><expr> <c-space> coc#refresh()

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " Applying codeAction to the selected region.
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
endfun
autocmd BufEnter * :call GoCoC()


" CoC-PLUGIN: LTeX
let g:coc_filetype_map = {'tex': 'latex'}


" CoC-PLUGIN: Explorer
nmap <space>e :CocCommand explorer ./<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
