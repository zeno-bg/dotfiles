" Set 'nocompatible' to ward off unexpected things that your distro might
" " have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
filetype plugin on

execute pathogen#infect()


set path+=**            " adds fuzzy like search with :find *blqh.py
set mouse=a		" Makes mouse behavior like it should
set scrolloff=8		" Number of lines from vertical edge to start scrolling
set sidescrolloff=15	" Number of cols from horizontal edge to start scrolling
set sidescroll=1	" Number of cols to scroll at a time
set clipboard=unmaned	" This makes clipboard globaly populated (bi-direct)
set bs=2		" fix backspace problem
set lazyredraw		" faster drawing
set term=xterm-256color	" set terminal
set autochdir		" automatically change window's cwd to file's dir
set wildmenu		" Cool tab completion stuff
set wildmode=list:longest,full
set hidden		" Window reusage
set showcmd		" Show partial commands in the last line of the screen
set hlsearch		" Highlight searches (use <C-L> to temporarily turn off highlighting; see the mapping of <C-L> below)
set ignorecase		" not case sensetive (except when using capitals somewhere)
set smartcase
set incsearch		" incremental search
set autoread		" watch filechanges

set cindent

syntax enable
colorscheme frood
set t_Co=256

"scriptencoding utf8
"set encoding=utf-8


command! MakeTags !ctags -R .

" more subtle popup colors
if has ('gui_running')
	highlight Pmenu guibg=#cccccc gui=bold
endif

" leader key
let mapleader = ","				" map leader key
map <space> <leader>
nmap <leader>l :set list!<CR>	" Use <leader>l to toggle display of whitespace

:nmap <F2> <ESC>:w<CR>  " remap save (normal mode)
:imap <F2> <ESC>:w<CR>  " remap save (insert mode)
:vmap <F2> <ESC>:w<CR>  " remap save (visual mode)


map <Leader>a ggVG		" select all


" Vertical Split : Ctrl+w + v
" " Horizontal Split: Ctrl+w + s
" " Close current windows: Ctrl+w + q
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

"TODO: attempts for making a new preview window with old file contents
"map <Leader><c-w>v :let line = line('.') \| vnew \| 0r # \| execute line <CR><c-w><c-p>:set scrollbind<CR>
"map <Leader><c-w>s :new \| 0r #<CR>


"noh
:map <F4> <ESC>:noh<CR>
"TODO: ?next search, previous search


" easyer moving of blocks of code
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" tab (next in search)
cmap <expr> <Tab> getcmdtype() == "/" ? "<CR>/<C-r>/" : "<C-z>"

set complete=.,w,b,u,U,t,i,d	" do lots of scanning on tab completion
set fileformat=unix			" set file format
set ff=unix					" ^^
set grepprg=grep\ -nH\ $*	" better grep
set ttyfast					" we have a fast terminal
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action
set autoindent				" Allow backspacing over autoindent, line breaks and start of insert action
set nostartofline
set ruler
set cmdheight=2				" Set the command window height to 2 lines, to avoid many cases of having to
set number					" Display the line number
set notimeout ttimeout ttimeoutlen=200	" Quickly time out on keycodes, but never time out on mappings
set backup
set backupdir=~/.vim/backup_files
set directory=~/.vim/swap_files
set noswapfile
set wildcharm=<C-z>			" incremental search with tab
set showmatch				" show matching bracket
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set tags=tags;/

set splitbelow
set splitright
set encoding=utf-8

set pastetoggle=<F5>		" Map Paste
"set confirm			" ask if write err istend of err
"set cul			" highligh current line



" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" auto bracet close
"imap { {}<left>
"imap ( ()<left>
"imap [ []<left>


"auto indent whole file
command! Indent normal! mzgg=G'z


nmap <F9> :TagbarToggle<CR>

let g:tagbar_autofocus = 1
