" --------------- 默认设置 ---------------
"  
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup


" --------------- Vundle设置 ---------------
"
" Vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" Vundle 插件列表
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
" 这个插件可以显示文件的Git增删状态
"Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()
filetype plugin indent on



" --------------- vim设置 ---------------
"
" 开启语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch

set showcmd

" -------- 制表符转换
"  
" 自适应不同语言的智能缩进
filetype indent on
" 设置编辑时制表符占用空格数
set tabstop=4
" 将制表符拓展为空格
set expandtab
" 设置格式化是制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为一个制表符
set softtabstop=4

" -------- 代码折叠
" 
" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable


" --------------- 插件设置 ---------------
"
" 前缀键
let mapleader=";"

" -------- solarized
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
" 设置状态栏主题风格
"let g:Powerline_colorscheme='solarized256'

" 设置主题
"set t_Co=256
set background=dark
"colorscheme Tomorrow-Night
"colorscheme solarized
colorscheme monokai

let g:molokai_original = 1

" 清空高亮行的背景色
hi CursorLine ctermbg=NONE

" -------- UltiSnips 
" 设置Snippets文件目录
let g:UltiSnipsSnippetDirectories=["rg-snippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"

" -------- NERDTree
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1

" -------- vim-fswitch
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>


" -------- Indent Guides 设置
"
" 随vim自启动 
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" -------- YCM 设置
"
" 语法检查
let g:syntastic_always_populate_loc_list = 1
" ycm配置文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/.ycm_extra_conf.py'
" 映射<C-x><C-o>
inoremap <leader>; <C-x><C-o>
" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
" YCM补全菜单配色
" 菜单
highlight Pmenu ctermfg=255 ctermbg=73 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=255 ctermbg=73 guifg=#AFD700 guibg=#106900
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" 上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0 
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1   
" 从第1个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1 
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0    
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1  
"force recomile with syntastic
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>  
"open locationlist
"nnoremap <leader>lo :lopen<CR>   
"close locationlist
"nnoremap <leader>lc :lclose<CR>  
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
 "在字符串输入中也能补全
 let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> "


" Poerline 设置
"set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim

"let g:minBufExplForceSyntaxEnable = 1
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
 
"if ! has('gui_running')
"   set ttimeoutlen=10
"   augroup FastEscape
"      autocmd!
"      au InsertEnter * set timeoutlen=0
"      au InsertLeave * set timeoutlen=1000
"   augroup END
"endif
 
"set laststatus=2 " Always display the statusline in all windows
"set guifont=Inconsolata\ for\ Powerline:h14
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"


" -------- indentLine 设置
let g:indentLine_char='│'
let g:indentLine_enabled = 1
