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
Plugin 'tomtom/tcomment_vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-dispatch'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'lilydjwg/colorizer'
Plugin 'Chiel92/vim-autoformat'
Plugin 'a0lex/Theosvi'
Plugin 'ingo-library'
Plugin 'Align'
Plugin 'AlignFromCursor'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put non-Plugin stuff after this line

set encoding=utf-8
syntax on                         " show syntax highlighting
set autoindent                    " set auto indent
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

" latex filetype
let g:tex_flavor = "latex"
" autocmd FileType tex setlocal textwidth=70
set textwidth=69
autocmd FileType mail setlocal textwidth=69

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=70
  " highlight ColorColumn ctermbg=235
  highlight ColorColumn ctermbg=237
endif

" maps
nmap <F4> :TagbarToggle<CR>
" resize
nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>h :exe "10winc < " <CR>
nnoremap <silent> <Leader>l :exe "10winc > " <CR>
" Ctrl-Space for completions. Heck Yeah!
let mapleader="\<space>"
nnoremap <leader>rv :source $MYVIMRC<CR>

" turn off search highlight
nnoremap <leader><leader> :nohlsearch<CR>

" open ag.vim
nnoremap <leader><leader>a :Ag

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

" real TAB
inoremap <S-Tab> <C-V><Tab>

" FileType for  objc
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
nnoremap <silent> <F6> :call ToggleSpell()<CR>

nnoremap <silent> <F5> :!open report.pdf<CR><CR>

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.vim/mysnippet'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippet"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"

" youcompleteme
let g:ycm_key_invoke_completion = '<C-b>'
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

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
