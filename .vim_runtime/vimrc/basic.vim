""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 2014-12-31 11:07:25
" basic.vim
" 通用配置文件， 基本设置都在这。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" leader键的功能设置  修改leader键为逗号
let mapleader=","
let g:mapleader = ","

" ,ee 快速编辑 .vimrc
nnoremap <leader>ee :e ~/.vimrc<CR>

" ,vv  快速编译 
nnoremap <silent><leader>vv :source ~/.vimrc<CR>

" ,w 快速保存 Fast saving
nmap <leader>w :w!<cr>

" 快速退出
if has("gui_running")
	nmap <silent> <C-q> :q!<CR>
	vmap <silent> <C-q> :q!<CR>
endif

" 设置缩写
ab noo ==============================================================
ab moo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbreviate #b /****************************************
abbreviate #e <space> ****************************************/
abbreviate #i #include
abbreviate #d #define

" 插入当前系统时间 ， 上边的版本后面时间 就是 用这个插入的，方便多了
nnoremap <F5> "=strftime("%F %H:%M:%S")<CR>gP
inoremap <F5> <C-R>=strftime("%F %H:%M:%S")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
" scrolloff
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

"设置隐藏gvim的菜单和工具栏
set guioptions-=m
set guioptions-=T

"去除左右两边的滚动条
set go-=r
set go-=L

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" 要查看 左右 10个字符的上下文
set sidescroll=10

" Configure backspace so it acts as it should act;
" 设置 insert 模式下退格键 何时可以删除光标前的字符
" 3个选项 分别是 可以删除位于行首的空格， 断行， 及 开始进入 insert
"模式前的 位置
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" set hightlight search
set hlsearch

" set incremental search " Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts , 窗体设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting ,打开高亮
syntax enable

try
	colorscheme desert
catch
endtry

set background=dark

" 设置字体
set guifont=DejaVu\ Sans\ mono\ 12 

"彩色显示第85行
set colorcolumn=85

"设置光标高亮显示
set cursorline
set cursorcolumn

set ttyfast

"显示行号
set number
"行号栏的宽度
set numberwidth=4

"Always show current position  设置 右下角的 显示 当前光标 行列信息
set ruler

" Height of the command bar
set cmdheight=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" 设置文件的代码形式
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

" Use Unix as the standard file type
set ffs=unix,dos,mac

"新建文件编码
set fenc=utf-8

"设置路径
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" A buffer becomes hidden when it is abandoned
set hid

"以下设置用来是vim正确显示过长的行
set textwidth=80
set formatoptions=qrnl

"右下角显示一个完整命令的已经完成部分
set showcmd
" 多数移动光标命令都会在行首 行尾停止不动 , whichwrap 可以控制此时行为规则
" b,s,<,> 针对normal 模式下的 退格键，空格键，左，右键  [,] 使得 左右键 在 insert 模式下也可用
" set whichwrap& 可恢复默认值，其他也是 让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,],h,l

" 规定关键字， 就是一个word 中可以包含哪些字符,  添加	-这样的话 形如 upper-case 的
" 词就可以被当作  word了 删除一个 字符 使用 操作符 -= , 如 删除 _ set iskeyword-=_  
set iskeyword+=-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif
" Remember info about open buffers on close

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"状态行显示的内容 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
" spell 拼写检查打开拼写检查(Turning on the Vim spell check)::set spell
" 关闭拼写检查(Turning off the Vim spell check)：:set nospell
" :setlocal spell spelllang=en_us 
" :setlocal spell spelllang=de
" ]s        : 将光标移到下一个拼写错误处
"[s        : 将光标移到上一个拼写错误处
"zg       : 将单词加入词典
"zug     : 撤销将单词加入词典
"z=        : 拼写建议
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>
" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" dictionary -> ctrl-x ctrl-k 自动补全， 字典功能 ctrl-p/n, ctrl-y
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set dictionary=/usr/share/dict/words
