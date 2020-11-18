call plug#begin('~/.vim/plugged')
 " Highlighting and language support
Plug 'leafgarland/typescript-vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'nullvoxpopuli/coc-ember', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'dracula/vim' "Theme
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'pangloss/vim-javascript'
Plug 'sbdchd/neoformat'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
" Plug 'Yggdroot/indentLine'
Plug 'Konfekt/FastFold'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'chrisbra/Colorizer'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/vim-grammarous'
Plug 'dbmrq/vim-ditto'
Plug 'ryanoasis/vim-devicons'
call plug#end()


" Settings
set encoding=UTF-8
set ts=3                          " set indent to 4 spaces
set shiftwidth=3
set expandtab                     " use spaces, not tab characters
set updatetime=200
set cmdheight=2
set scrolloff=6                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ruler                         " show row and column in footer
set noswapfile
set clipboard=unnamed
set list                         " Display unprintable characters f12 -
set pastetoggle=<F2>
set visualbell t_vb=
set timeoutlen=750 ttimeoutlen=0
set sessionoptions-=folds

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon


" reload config
let mapleader="\,"
nnoremap <leader>rv :source $MYVIMRC<CR>

" Theme
if (has("termguicolors"))
   set termguicolors
endif
syntax enable
colorscheme dracula

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

" search
nnoremap <leader><leader> :nohlsearch<CR>

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
" autocmd BufNewFile,BufReadPost *.tex set foldlevel=1

" set wrap on diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

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
hi SpellBad cterm=underline guibg=#ff2929 ctermbg=224
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

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme='papercolor'


" ctrlP -- Exclude
set wildignore+=*/tmp/*,Material*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
         \ 'dir':  '\v[\/]\.(git|hg|svn)$',
         \ 'file': '\v\.(exe|so|dll)$',
         \ 'link': 'some_bad_symbolic_links',
         \ }

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/mysnippet"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippet"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Easy Align
xmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
         \ '%': { 'pattern': '%' },
         \ ';': { 'pattern': ';' }
         \ }

" vimtex
autocmd BufReadPre *.tex let b:vimtex_main = 'report.tex'
let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'
let g:tex_conceal = ''
let g:vimtex_compiler_progname = 'nvr'
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
let g:vimtex_indent_conditionals = {
 \ 'open': '\v(\\newif)@<!\\if(f>|field|name|numequal|thenelse|beginwith)@!',
\ }


" FastFold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'

" Grammarous
nmap gn <Plug>(grammarous-move-to-next-error)
nmap gp <Plug>(grammarous-move-to-previous-error)

" vim-better-whitespace
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Colorizer
au BufNewFile,BufRead *.log,*.css,*.html,*.htm  :ColorHighlight!
let g:colorizer_auto_map = 1


" Coc
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-prettier',
  \ 'coc-ember'
\ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Explorer
nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
