call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/vim-grammarous'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'chrisbra/Colorizer'
call plug#end()

" Settings
set encoding=UTF-8
set undodir=~/.config/nvim/undo-dir
set undofile
set number relativenumber
set cursorline                    " highlight current line
set clipboard+=unnamedplus
set noswapfile
set expandtab                     " use spaces, not tab characters
set ts=3                          " set indent to 4 spaces
set shiftwidth=3
set t_Co=256

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" reload config
let mapleader="\,"
nnoremap <leader>rv :source $MYVIMRC<CR>

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

" Color Style
color slate

" Highlight
hi MatchParen cterm=NONE ctermbg=DarkRed ctermfg=white
hi Comment cterm=italic gui=italic
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
hi Search cterm=NONE  ctermbg=DarkBlue ctermfg=white
hi VertSplit ctermbg=4 ctermfg=0

" search
nnoremap <leader><leader> :nohlsearch<CR>

" ag
cnoreabbrev Ack Ack!
nnoremap <Leader><Leader>a :Ack!<Space>
let g:ackprg = 'ag --vimgrep'

" Switch Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>

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

" JsBeautify
map <c-f> :call JsBeautify()<cr>

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

" Grammarous
nmap gn <Plug>(grammarous-move-to-next-error)
nmap gp <Plug>(grammarous-move-to-previous-error)
let g:grammarous#use_vim_spelllang=1
let g:grammarous#disabled_rules = {
            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
            \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
            \ }

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme='papercolor'

" Coc
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
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
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Explorer
nmap <space>e :CocCommand explorer ./<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"
