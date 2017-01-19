" .vimrc
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'chrisbra/SudoEdit.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-dispatch'                    " asynchronous build and test dispatcher
Plugin 'Lokaltog/vim-powerline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'                  " automatic closing of quotes, parenthesis, brackets
Plugin 'terryma/vim-multiple-cursors'          " True Sublime Text style multiple selections for Vim
Plugin 'scrooloose/syntastic'                  " asynchronous build and test dispatcher
Plugin 'tpope/vim-fugitive'                    " asynchronous build and test dispatcher
Plugin 'godlygeek/tabular'
Plugin 'chrisbra/Colorizer'
Plugin 'Chiel92/vim-autoformat'
Plugin 'JamshedVesuna/vim-markdown-preview'

Plugin 'tpope/vim-surround'
Plugin 'kelwin/vim-smali'
Plugin 'a0lex/Theosvi'

" Plugin 'vim-scripts/AlignFromCursor'

Plugin 'ingo-library'
Plugin 'Align'
Plugin 'AlignFromCursor'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put non-Plugin stuff after this line
set encoding=utf-8
syntax on                         " show syntax highlighting
set background=dark
set autoindent                  " set auto indent
set ts=4                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set nofoldenable                  " disable code folding
set noswapfile
set undofile                      " Maintain undo history between sessions
set undodir=~/.vim/undodir
set autoread
set backspace=2
set pastetoggle=<F2>
set splitbelow
set splitright
" set list listchars=tab:»·,trail:· " show extra space characters
" set mouse=a                       " enable mouse support
" set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
" set vb                            " enable visual bell (disable audio bell)
" set clipboard=unnamed             " use the system clipboard
" set wildmenu                      " enable bash style tab completion
" set wildmode=list:longest,full
" set cm=blowfish2

" vim help; search tags with special char
setl iskeyword=!-~,^*,^\|,^\",192-255"

runtime macros/matchit.vim        " use % to jump between start/end of methods

" maps
nmap <F4> :TagbarToggle<CR>
" resize
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>< :exe "10winc < " <CR>
nnoremap <silent> <Leader>> :exe "10winc > " <CR>
" Ctrl-Space for completions. Heck Yeah!
let mapleader="\,"
nnoremap <leader>rv :source $MYVIMRC<CR>

" turn off search highlight
nnoremap <leader><leader> :nohlsearch<CR>

" open ag.vim
nnoremap <leader><leader>a :Ag<space>

" jump to tag
" nnoremap t <C-]>

" split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" quick save
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" remap ESC
inoremap jk <ESC>
cnoremap jk <ESC>

" movement
nnoremap j gj
nnoremap k gk

" latex filetype
let g:tex_flavor = "latex"
" autocmd FileType tex setlocal textwidth=80

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=61
  highlight ColorColumn ctermbg=235
endif
autocmd FileType mail setlocal colorcolumn=61
autocmd FileType mail setlocal textwidth=60
autocmd FileType snippets setlocal colorcolumn=61
autocmd FileType snippets setlocal textwidth=60


au BufNewFile,BufRead *.xm set filetype=objc


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
nnoremap <silent> <F5> :call ToggleSpell()<CR>



" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.vim/mysnippet'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippet"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"

" youcompleteme
let g:EclimCompletionMethod = 'omnifunc'
" let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
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
