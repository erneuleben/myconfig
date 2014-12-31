"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug in 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"===================================================
"插件的设置 Vundle －－ 用来管理插件 方便快捷，整齐大方。
"===================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 中文输入
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" vimim --->  input chinese
" i_ctrl-^  切换中文输入法 其实是 ctrl + 6 , 不需要shift
" ctrl- \ 更方便，同emacs 中eim 一样了， 拷贝 中文 "＋y 再粘贴到 firefox
" 就不用输入法了， 因此卸载小企鹅，企鹅
" 注意：发现ctrl-6 和 ctrl-\ 有不同 ， ctrl 6 能 用 hjkl 翻页选字， ctrl \
" 用 ctrl n 翻页。 还有就是 ctrl l 输入空格方便些。 目前偏向于 ctrl \
Plugin 'VimIM'
let g:vimim_map='c-bslash' "  Ctrl-\ 开关输入法 这样的话 就和 emacs 中的eim一样了
let g:vimim_cloud=-1 " 彻底关闭云输入
let g:vimim_toggle=-1 " 彻底关闭循环键

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'peaksea'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'jnurmine/Zenburn'
"Plugin 'tomasr/molokai'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" drawit --> 画图工具
" 
":DIstart，开始绘制结构化字符图形
":Distop，停止绘制结构化字符图形
"空格，绘制或擦出字符
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'DrawIt'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"NerdTree的设置 
"help NERD_tree.txt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'The-NERD-tree'
nnoremap <silent> <F12> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Netrw 是内建插件，当你使用vim尝试打开目录时，vim会自动调用netrw.vim插件打开该目录
"<F1>        显示帮助
"<cr>        如果光标下为目录，则进入该目录；如果光标下是文件，则用vim打开该文件
"-           返回上级目录 	"c           切换vim的当前工作目录为正在浏览的目录
"d           创建目录 		"D           删除文件或目录
"i           切换显示方式 	"R           改名文件或目录
"s           选择排序方式 	"x           定制浏览方式，使用你指定的程序打开该文件
" 其它常用键，诸如使用书签、隐藏符合条件的文件等，请参阅netrw帮助页。 
""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" BufExplorer Buffer Explorer / Browser.
" This plugin can be opened with <leader+o>                   
" BufExplorer已经映射了几个键绑定，
" 例如，使用 ",bv" 就可以打开一个垂直分割窗口显示当前的缓冲区
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'bufexplorer.zip'
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" mru.vim  Plugin to manage Most Recently Used (MRU) files. 
" Includes my own fork which adds syntax highlighting to MRU.
" This plugin can be opened with ",f"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'mru.vim'
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" ctrlp.vim: Fuzzy file, buffer, mru and tag finder. 
" In my config it's mapped to <Ctrl+F>, because <Ctrl+P> is used by YankRing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-f>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  goyo.vim and vim-zenroom2: Remove all clutter and focus only on the essential.
"   Similar to iA Writer or Write Room
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'
map <leader>z :Goyo<cr>

""""""""""""""""""""""""""""""
"下面是程序语言类的 插件
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"YOUCOMPLETEME
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"Plugin 'Valloric/YouCompleteMe'

""""""""""""""""""""""""""""""
"ctags 
""""""""""""""""""""""""""""""
"在你项目所在目录的顶层执行ctags-R，该目录下会多出个tags文件；
"在vim中引入标签数据库文件。在vim中执行命令:settags=/home/your_proj/tags
"在 ~/workspace/ 建立了 源码 0.11 目录 进行测试 需要进行函数名、变量名、结构名、结构成员补全时输入Ctrl+X Ctrl+O，
"需要头文件名补全时输入Ctrl+X Ctrl+I，需要文件路径补全时输入Ctrl+X Ctrl+F。
"取消补全内容以分割子窗口形式出现，只显示补全列表
set tags=~/workspace/linux-0.11/tags
set completeopt=longest,menu

""""""""""""""""""""""""""""""
" Taglist
""""""""""""""""""""""""""""""
Plugin 'taglist.vim'
nnoremap <silent> <F8> :TlistToggle<CR>

""""""""""""""""""""""""""""""
" bash 的支持
""""""""""""""""""""""""""""""
Plugin 'bash-support.vim'

""""""""""""""""""""""""""""""
" c.vim 
" h csupport 查看帮助
""""""""""""""""""""""""""""""
"    Statement oriented editing of  C / C++ programs
"   Speed up writing new code considerably.
"   Write code und comments with a professional appearance from the beginning.
"   Use code snippets
Plugin 'c.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"mattn/emmet-vim 
" zencoding: Expanding abbreviation like zen-coding, 
" very useful for editing XML, HTML.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
