"+----------------------------------------------------------------------------+
"| Author: Domantas Jackūnas <me@jackleo.info>                                |
"| Source: http://hg.jackleo.info/vim-configs/src                             |
"+----------------------------------------------------------------------------+

" Load vundle and plugins ============================================== {{{

 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'crooloose/syntastic'
 Bundle 'Valloric/YouCompleteMe'
 Bundle 'kien/ctrlp.vim'
 Bundle 'bogado/file-line'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'scrooloose/nerdtree'
 Bundle 'klen/python-mode'
 Bundle 'godlygeek/tabular'
 Bundle 'majutsushi/tagbar'
 Bundle 'ehamberg/vim-cute-python'
 Bundle 'mhinz/vim-signify'
 Bundle 'mhinz/vim-startify'
 Bundle 'jnwhiteh/vim-golang'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'bling/vim-airline'
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'compview'
 Bundle 'Gundo'
 Bundle 'pep8'
 Bundle 'bufkill.vim'
 " non github repos
 "Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

" }}}
" VIM behaviour ========================================================== {{{

    "  Tell vim to remember certain things when we exit
    "  '10  :  marks will be remembered for up to 10 previously edited files
    "  "100 :  will save up to 100 lines for each register
    "  :20  :  up to 20 lines of command-line history will be remembered
    "  %    :  saves and restores the buffer list
    "  n... :  where to save the viminfo files
    set viminfo='10,\"100,:20,%,n~/.vim/backup/.viminfo

    " Show (partial) command in the last line of the screen.
    set showcmd

    " GUI settings
    set title

    " Don't update the display while executing macros
    set lazyredraw

    " Always display a status line at the bottom of the window
    set laststatus=2

    " Keep 3 lines visible down from the cursor while scrolling
    set scrolloff=3

    " Enable ctags support
    set tags=./tags;/

    " If file is not modified in VIM but changed outside, reload it
    set autoread

    " Keep commands history longer (by default keeps only 20 commands)
    set history=1000

    " Shows information on VIM bottom
    set ruler

    " Show line numbers in editor
    set number

    " Ignore case in search and replace
    set ignorecase

    " Found text will be highlighted and search will be repeated over file
    set incsearch

    " Smart search: if lowercase ignore case of matches, if not case-sensitive
    set smartcase

    " Keep VIM history even file is closed
    set viminfo='20,<50,s10,h

    " Remove trailing spaces after save
    au BufWritePre * silent g/\s\+$/s///

    " Set fold level to open all methods arround
    set foldlevel=100

" }}}
" Edit behaviour ========================================================= {{{

    " Encoding
    set termencoding=utf-8
    set encoding=utf-8

    " Set tab to 4 spaces
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

    " Enable wrap mode to see long code lines
    set wrap
    set textwidth=0

    " Enable mouse features
    set mouse=a

    " For new lines automatically indent by current line indent
    set autoindent
    set copyindent

    " Show matching for symbols like () and etc.
    set showmatch

    " Allow backspace on everything in insert mode
    set backspace=indent,eol,start

    " Word wrap not in the middle of the word
    set formatoptions=l
    set lbr

" }}}
" Edit behaviour based on fyle type ====================================== {{{

    " HTML
    autocmd Filetype html setlocal ts=2 sts=2 sw=2

" }}}
" Backups and swap ======================================================= {{{

    set backup
    set backupdir=~/.vim/backup
    set noswapfile

" }}}
" Mappings =============================================================== {{{

    " Mapleader from \ to ,
    let mapleader=","

    " <SHIFT + t> - trim white spaces in lines end
    map <s-t> :%s/ \+$//g<CR>

    " Runs Unit tests
    nmap <F8> :python RunUnitTestsUnderCursor()<CR>

    " Toggles non printable character visibility
    nmap <silent> <leader>w :set nolist!<CR>

    " Allow to overwrite root protected files (in case of missed sudo)
    cmap w!! %!sudo tee > /dev/null %

    " Toggle NERDtree
    map <leader>n :NERDTreeToggle<CR>

    " TagBar Toggle
    map <leader>m :TagbarToggle<CR>

    " Spell Check
    map <F5> <Esc>:setlocal spell spelllang=lt<CR>
    map <F6> <Esc>:setlocal spell spelllang=en_us<CR>
    map <F7> <Esc>:setlocal nospell<CR>

    " No autoindent in paste mode
    set pastetoggle=<F2>

    " PEP8 Check
    let g:pep8_map='<F3>'

    " Gundo toggle
    nnoremap <F4> :GundoToggle<CR>

    " CompView
    map <leader>f :CompView<CR>

    " Clean search highlight on space
    nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

    " Simple Copy to system clipboard
    vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

    " Simple paste in insert mode
    imap <C-v> <Esc><C-v>a

    " Insert new line above cursor
    nmap <C-K> O<Esc>j

    " Insert new line below cursor
    nmap <C-J> o<Esc>k

    " Insert space after cursor
    nmap <C-L> li <Esc>h

    " Insert space before cursor
    nmap <C-H> i <Esc>l

    " Insert new line after the cursor
    nmap <CR> i<Enter><Esc>l

    " Text wrap navigation made easy
    map j gj
    map k gk

    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv

    " diff current vi buffer edits against original file
    "nmap <leader>d :w !diff -u % -

    " Easy window navigation/creation
    map <leader>h :call WinMove('h')<cr>
    map <leader>k :call WinMove('k')<cr>
    map <leader>l :call WinMove('l')<cr>
    map <leader>j :call WinMove('j')<cr>

    " Move windows arround
    map <leader>H :wincmd H<cr>
    map <leader>K :wincmd K<cr>
    map <leader>L :wincmd L<cr>
    map <leader>J :wincmd J<cr>

    " Resize windows with arrows
    nmap <left> :3wincmd <<cr>
    nmap <right> :3wincmd ><cr>
    nmap <up> :3wincmd +<cr>
    nmap <down> :3wincmd -<cr>

    " Window close
    map <leader>wc :wincmd q<cr>

    " Window rotate
    map <leader>wr <C-W>r

    " Tabularize shortcut
    vmap <leader>t :Tabularize /

    " Alias to ^w
    nmap <C-q> <C-w>

    " buffer search
    map <leader>b :CtrlPBuffer<cr>

" }}}
" File types options ===================================================== {{{

    " Ignore these file types on :e
    set wildmenu
    set wildmode=list:longest
    set wildignore=*.swp,*.bak,*.pyc

    " If VIM founds project.vim file in project root, it will be loaded.
    " This is required if project has specific settings.
    silent! source project.vim

" }}}
" Omnicomplete =========================================================== {{{

    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS

    set completeopt=menuone,longest

" }}}
" Colors ================================================================= {{{

    " Enable syntax highlighting
    syntax on

    " Set Color scheme
    colorscheme molokai

    " 256 colors
    set t_Co=256

    " Enable CursorLine
    set cursorline

    "" Paint 80 symbols line
    set colorcolumn=80
    hi colorcolumn ctermbg=234 cterm=none guibg=#293739

    "" Omnicomplete colors
    "highlight  Pmenu
        "\ cterm=NONE
        "\ ctermbg=darkblue
        "\ ctermfg=white
        "\ guibg=darkblue
        "\ guifg=white

" }}}
" Plugin Settings ======================================================== {{{
    " AirLine ------------------------------------------------------------ {{{
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_detect_iminsert= 1
        let g:airline_theme = 'dark'
    " }}}
    " Mini Buff Explorer ------------------------------------------------- {{{

        let g:miniBufExplMapWindowNavVim = 1
        let g:miniBufExplMapWindowNavArrows = 1
        let g:miniBufExplMapCTabSwitchBufs = 1
        let g:miniBufExplModSelTarget = 1

    " }}}
    " Gundo -------------------------------------------------------------- {{{

        let g:gundo_preview_bottom = 1
        let g:gundo_width = 30

    " }}}
    " NerdTree ----------------------------------------------------------- {{{

        let NERDTreeMinimalUI=1
        let NERDTreeDirArrows=1
        let NERDTreeIgnore=['\.pyc$', '\.bak$', '\.swp$']

    " }}}
    " startify ----------------------------------------------------------- {{{
        let g:startify_session_dir = '~/.vim/session'
        let g:startify_bookmarks = [ '~/.vim/vimrc', '~/.zshrc' ]
    " }}}
" Custom functions ======================================================= {{{

    function! HgCiDiff()
        "In .hgrc editor option I call vim "+HgCiDiff()"
        "It opens new split with diff inside
        rightbelow  vnew
        setlocal buftype=nofile
        :.!hg diff
        setlocal ft=diff
        wincmd p
        setlocal spell spelllang=en_us
        cnoremap wq wqa
        cnoremap q qa
        start
    endfunction

    function! WinMove(key)
      " Helps moving arround windows
      let t:curwin = winnr()
      exec "wincmd ".a:key
      if (t:curwin == winnr()) "we havent moved
        if (match(a:key,'[jk]')) "were we going up/down
          wincmd v
        else
          wincmd s
        endif
        exec "wincmd ".a:key
      endif
    endfunction
" }}}
