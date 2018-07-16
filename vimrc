filetype            off
set nocompatible
filetype plugin on
filetype plugin indent on

"" ---- Settings ----
set autoindent                                              " always set autoindenting on
set autoread
set autowriteall
set copyindent                                              " copy the previous indentation on autoindenting
set expandtab
set hidden
set hlsearch                                                " highlight search terms
set number                                                  " always show line numbers
set shiftround                                              " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                                               " set show matching parenthesis
set nobackup
set noic
set noswapfile
set softtabstop     =4
set tabstop         =4                                      " a tab is four spaces
set backspace       =indent,eol,start                       " allow backspacing over everything in insert mode
set shiftwidth      =4                                      " number of spaces to use for autoindenting
set pastetoggle     =<F2>
set t_Co            =256
set wildignore      =*.py[co]
set wildmode        =list:longest,list:full
set clipboard       =unnamedplus
set gfn             =Consolas\ for\ Powerline\ 12
set background      =dark
set tags            +=~/.tags/tags
set path            +=templates
set includeexpr     =substitute(v:fname,'\\.','/','g')
set suffixesadd     =.py
set laststatus      =2
set completeopt     =menu
set rtp+=~/.vim/bundle/Vundle.vim
"set runtimepath     +=~/.vim/bundle/vundle/
filetype            plugin indent off
set runtimepath     +=/usr/lib/go/misc/vim/
filetype            plugin indent on
syntax              on
"call vundle#rc()

let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let g:closetag_default_xml              =1
let g:sparkupNextMapping                ='<c-h>'
let g:ackprg                            ="ack-grep -H --nocolor --nogroup --column"
let g:surround_{char2nr("r")}           ="_(u\r)"
let g:virtualenv_directory              ="~/.virtualenvs2.7/"
let g:Powerline_colorscheme             ="zenburn"
let g:Powerline_symbols                 ="fancy"
let g:UltiSnipsSnippetDirectories       =["UltiSnips", "snippets"]
let g:neocomplcache_enable_at_startup   =1
let g:syntastic_python_flake8_args='--ignore=E501,E128,E225'

function! s:Gentags()
    :! find . -name '*.py' | xargs ctags
endfunction
command! -nargs=0 Gentags call s:Gentags()

if filereadable(".lvimrc")
    source .lvimrc
endif


autocmd     FileType            html        set         ft          =htmldjango.html
autocmd     FileType            htmldjango  set         ft          =htmldjango.html
autocmd     FileType            coffee      setlocal    ts          =2  sts=2   sw=2    et
autocmd     FileType            jade        setlocal    ts          =2  sts=2   sw=2    et
autocmd     FileType            python      compiler    pyunit

"""------------------ setting undle for plugins/bundles------------  
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"fugitive Best git interface for Vim
Plugin 'tpope/vim-fugitive'
"vim-repeat Use . to repeat much more than simple inserts or deletes
Plugin 'tpope/vim-repeat'
"vim-markdown Markdown syntax highlighting for Vim
Plugin 'tpope/vim-markdown'
"gundo.vim Visualize and traverse your undo tree. A must
Plugin 'sjl/gundo.vim'


"YouCompleteMe fuzzy search code completion
Plugin 'Valloric/YouCompleteMe'

"ultisnips  for snippets in vim
Plugin 'SirVer/ultisnips' 


"was already there syntastic These two together make the absolute best autocomplete package around
Plugin 'scrooloose/syntastic'
"vim-colors-solarized Solarized color scheme for Vim
Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-unimpaired'
Plugin 'bkad/CamelCaseMotion'
Plugin 'matchit.zip'
" Plugin 'kogakure/vim-sparkup'  "already a  plugin with same name is there
Plugin 'tristen/vim-sparkup'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'vim-scripts/trailing-whitespace'
Plugin 'scrooloose/nerdcommenter'
" this plugin through an error, while autocompletion if u press tab to select
"Plugin 'vim-scripts/UltiSnips'
Plugin 'html5.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'argtextobj.vim'
Plugin 'mileszs/ack.vim'
Plugin 'jmcantrell/vim-virtualenv'
" powerline Powerline integration for Vim 
Plugin 'powerline/powerline'  
"Plugin 'tuxcanfly/vim-powerline'  " this is not working
Plugin 'Shougo/neocomplcache'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tuxcanfly/vim-json'
Plugin 'majutsushi/tagbar'
Plugin 'skwp/greplace.vim'
"ctrlp.vim A buffer/file/mru/tag explorer with fuzzy text matching
Plugin 'kien/ctrlp.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux' 
Plugin 'tuxcanfly/vimux-django-tests'

call vundle#end()            " required



""" ---- Bundles ------

"Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-ragtag'
"Bundle 'tpope/vim-unimpaired'
"Bundle 'bkad/CamelCaseMotion'
"Bundle 'matchit.zip'
"Bundle 'kogakure/vim-sparkup'
"Bundle 'vim-scripts/The-NERD-tree'
"Bundle 'vim-scripts/trailing-whitespace'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'vim-scripts/UltiSnips'
"Bundle 'html5.vim'
"Bundle 'michaeljsmith/vim-indent-object'
"Bundle 'argtextobj.vim'
"Bundle 'mileszs/ack.vim'
"Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'tuxcanfly/vim-powerline'
"Bundle 'Shougo/neocomplcache'
"Bundle 'digitaltoad/vim-jade'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'tuxcanfly/vim-json'
"Bundle 'majutsushi/tagbar'
"Bundle 'skwp/greplace.vim'
"Bundle 'kien/ctrlp.vim'
"Bundle 'jamessan/vim-gnupg'
"Bundle 'scrooloose/syntastic'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'benmills/vimux'
"Bundle 'tuxcanfly/vimux-django-tests'

""" ---- Keybindings ----
" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>
nnoremap <silent> <C-A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>


" toggle fugitive status map <silent><leader>s :Gstatus<CR> " toggle fugitive diff map <silent><leader>d :Gdiff<CR>
" insert newline but dont enter insert mode
map <silent><leader><Enter> o<Esc>k
" Project search
map <leader>g   :Ack <cword>
map <leader>gp  :Ack --py <cword>
map <leader>gh  :Ack --html <cword>
map <leader>gj  :Ack --js <cword>
map <leader>gc  :Ack --css <cword>
" remove trailing whitespace
map <leader>w :FixWhitespace<CR>

nmap <F3>       :NERDTreeToggle<CR>
nmap <F4>       :TagbarToggle<CR>
let g:tagbar_autofocus = 1
nmap <F5>       :Gentags<CR>
nmap <F6>       :SyntasticToggleMode<CR>
nmap <leader>fp :Git push<CR>
nmap <leader>fm :Git pull<CR>
nmap <leader>fc :Gread<CR>
nmap <leader>fw :Gwrite<CR>
nmap <C-s>      :wa<CR>
nmap <leader>x  :x<CR>


" clear search highlight
nnoremap <leader><space> :noh<CR>
" shortcuts
nnoremap ; :
" open gf in new tab
nnoremap gf <C-W>gf
nnoremap Q gqap
nnoremap <leader>= ea<C-X><C-S>


" clear ^M messup
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" prevent cursor jumping
noremap <S-Up>      <Up>
noremap <S-Down>    <Down>
" move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
let g:ackprg                            ="ack-grep -H --nocolor --nogroup --column"


" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" show pending tasks list
map <F2> :TaskList<CR>
" removes trailing spaces of python files
" (and restores cursor position)
autocmd BufWritePre *.py mark z | %s/\s\+$//e | 'z
" save as sudo
ca w!! w !sudo tee "%"
" debugger keyboard shortcuts
let gvim_debug_disable_mappings = 1
"map <F5> :Dbg over<CR>
"map <F6> :Dbg into<CR>
"map <F7> :Dbg out<CR>
"map <F8> :Dbg here<CR>
"map <F9> :Dbg break<CR>
"map <F10> :Dbg watch<CR>
"map <F11> :Dbg down<CR>
"map <F12> :Dbg up<CR>

" insert ipdb breakpoint with \b
nmap <leader>b Oimport ipdb;ipdb.set_trace()<ESC>

" personal settings
set nocp
set history=1000
set showcmd
set ruler
set textwidth=120
set title
set wildmenu
set modeline
set ls=2
set guioptions-=T
set ignorecase                                              "ignore case when searching
set smartcase                                               " ignore case if search pattern is all lowercase, case-sensitive otherwise
set cursorline
set incsearch                                               " show search matches as you type
set nowrap                                                  " don't wrap lines
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
""" ---colorscheme--settings
set t_Co=256
""" set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
" colorscheme morning
colorscheme torte


let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
"set formatoptions=l
"set shortmess=atI
