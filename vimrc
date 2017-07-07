" .vimrc
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
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
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'chrisbra/Colorizer'
Plugin 'Chiel92/vim-autoformat'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-surround'
Plugin 'kelwin/vim-smali'
Plugin 'keith/swift.vim'
Plugin 'ashisha/image.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'chriskempson/base16-vim'
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
set clipboard=unnamed
set cm=blowfish2

" theme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" hi Normal term=none cterm=none ctermfg=White ctermbg=Black gui=none guifg=White guibg=Black
" hi DiffAdd ctermfg=NONE ctermbg=24 guifg=#f8f8f2 guibg=#13354a
" hi DiffChange cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
" hi DiffDelete cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
" hi DiffText cterm=none ctermfg=bg ctermbg=White gui=none guifg=bg guibg=White
" hi DiffChange term=bold ctermbg=238 guifg=#89807d guibg=#4c4745


" vim help; search tags with special char
setl iskeyword=!-~,^*,^\|,^\",192-255"

runtime macros/matchit.vim        " use % to jump between start/end of methods

" maps
let mapleader="\,"
nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <silent> <F3> :call ToggleNu()<CR>
nmap <F4> :TagbarToggle<CR>
nmap <F5> :SyntasticToggleMode<CR>
nnoremap <silent> <F6> :call ToggleSpell()<CR>
nnoremap <silent> <F7> :!open report.pdf<CR><CR>

nnoremap <leader><leader> :nohlsearch<CR>
nnoremap <leader><leader>a :Ag<space>
" resize window
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>< :exe "10winc < " <CR>
nnoremap <silent> <Leader>> :exe "10winc > " <CR>
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
" jump to tag
" nnoremap t <C-]>

" latex filetype
let g:tex_flavor = "latex"

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

autocmd FileType mail setlocal colorcolumn=61
autocmd FileType mail setlocal textwidth=60
autocmd FileType snippets setlocal colorcolumn=61
autocmd FileType snippets setlocal textwidth=60
" autocmd FileType tex setlocal textwidth=80
au BufNewFile,BufRead *.xm set filetype=objc


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
" nnoremap <silent> <F3> :call ToggleNu()<CR>

" switch spellcheck languages
hi clear SpellBad
" highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
  highlight SpellBad ctermbg=124
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
" nnoremap <silent> <F6> :call ToggleSpell()<CR>

