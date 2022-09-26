" --------------- 默认设置 ---------------
"  
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

if has("win32")
    set noundofile
    set nobackup
    " set fileformats=unix,dos,mac
endif

" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed

" set *.h as c file
let g:c_syntax_for_h=1


" gui pythonthreedll 3.9
if has("win32")
" set runtimepath+=d:/youcompleteme
    set pythonthreedll=python39.dll
" else
" set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.9/Python
endif

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}

" --------------- Vundle设置 ---------------
"
" Vundle 环境设置
filetype off
set shellslash
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    call vundle#begin('~/vimfiles/bundle')
else
    " let Vundle manage Vundle, required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" Vundle 插件列表
Plugin 'VundleVim/Vundle.vim'
" Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
" Plugin 'skywind3000/asyncrun.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'morhetz/gruvbox'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
" 异步语法检查
Plugin 'dense-analysis/ale'
Plugin 'Yggdroot/LeaderF'

Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'

Plugin 'rhysd/vim-clang-format'

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

" -------- Go file路径设置
if has("win32")
    set path=.,D:/proj/rlib/inc/,"$PATH"
else
    set path=.,"$PATH"
endif

" --------------- 插件设置 ---------------
"
" 前缀键
let mapleader=";"

" -------- solarized
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'
" let g:Powerline_symbols='unicode'

" new very inportant
let g:gruvbox_termcolors=256
" 设置主题
set t_Co=256
set background=dark
colorscheme gruvbox

" let g:molokai_original=1

" 清空高亮行的背景色
hi CursorLine ctermbg=NONE

" -------- UltiSnips 
" 设置Snippets文件目录
let g:UltiSnipsSnippetDirectories=["rich_snippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"

" -------- Nerdcommenter
"  注释的时候自动加个空格, 有助于精神健康
let g:NERDSpaceDelims=1

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

" windows gvim 启动错误信息忽略
let NERDTreeIgnore = ["\\~$","\\.pyc$","\\*NTUSER*","\\*ntuser*","TUSER.DAT","tuser.ini"]
" autocmd VimEnter * silent NERDTree | wincmd p

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
" ycm配置文件
if has("win32")
    let g:ycm_global_ycm_extra_conf = '~/vimfiles/bundle/YouCompleteMe/.ycm_extra_conf.py'
else
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
endif
" 语法检查
" let g:syntastic_always_populate_loc_list=1
" 关闭语法检查
let g:ycm_show_diagnostics_ui=0
" 映射<C-x><C-o>
inoremap <leader>; <C-x><C-o>
" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
" YCM补全菜单配色
" 菜单
" highlight Pmenu ctermfg=255 ctermbg=73 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=255 ctermbg=73 guifg=#AFD700 guibg=#106900
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1   
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
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
let g:ycm_complete_in_comments=1
 "在字符串输入中也能补全
let g:ycm_complete_in_strings=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings=0
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> "

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_invoke_completion = '<c-a>'

noremap <c-a> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

" ycm解析白名单
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "objc":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ }

" -------- ale configure
let g:ale_linters = {
\   'c++': ['clang++', 'cppcheck'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
" let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

if has("win32")
    " let g:ale_c_cc_options = '--target=x86_64-pc-windows-gnu -std=c11 -Wall'
    let g:ale_c_cc_options = '--target=x86_64-pc-windows-gnu -std=c11 -Wall -I D:/proj/rlib/inc/'
    let g:ale_cpp_cc_options = '--target=x86_64-pc-windows-gnu -std=c++17 -Wall'
else
    let g:ale_c_cc_options = '-std=c11 -Wall -I ~/Documents/rlib/inc/'
    let g:ale_cpp_cc_options = '-std=c++17 -Wall'
endif
let g:ale_c_gcc_options = '-Wall -O2 -std=c11'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'
let g:ale_cpp_clangtidy_options = '-Wall -std=c++17 -x c++'
let g:ale_cpp_clangcheck_options = '-- -Wall -std=c++17 -x c++'

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" -------- indentLine 设置
let g:indentLine_char='┊'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1

" -------- gui set
" gui font
set guifont=JetBrains\ Mono:h11
" gui cursor blin 
set gcr=a:block-blinkon0
" if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  " set lines=128 columns=100
" endif

" syntax 卡顿
set re=1
set ttyfast
set lazyredraw


" Gvim 窗口位置居中
function WindowCenterInScreen()
    set lines=9999 columns=9999
    let g:windowsSizeFixX = 58
    let g:windowsSizeFixY = 118
    let g:windowsScaleX = 9.75
    let g:windowsScaleY = 17.0
    let g:windowsPosOldX = getwinposx()
    let g:windowsPosOldY = getwinposy()
    let g:windowsScreenWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsPosOldX + g:windowsSizeFixX
    let g:windowsScreenHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsPosOldY + g:windowsSizeFixY
    set lines=128 columns=106
    let g:windowsSizeWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsSizeFixX
    let g:windowsSizeHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsSizeFixY
    let g:windowsPosX = ((g:windowsScreenWidth - g:windowsSizeWidth) / 2)
    let g:windowsPosY = ((g:windowsScreenHeight - g:windowsSizeHeight) / 2)
    exec ':winpos ' . g:windowsPosX . ' ' . g:windowsPosY
endfunc
au GUIEnter * call WindowCenterInScreen()


" gtags
if has("win32")
    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = 'D:/gtags/share/gtags/gtags.conf'
else
    let $GTAGSLABEL = 'native'
    let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
endif

" guntentags
" Usage:
" <leader>cg - 查看光标下符号的定义
" <leader>cs - 查看光标下符号的引用
" <leader>cc - 查看有哪些函数调用了该函数
" <leader>cf - 查找光标下的文件
" <leader>ci - 查找哪些文件 include 了本文件
"
" 设置标签tags
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" guntentags plus
" enable gtags module
let g:gutentags_modules = []

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" 同时开启 ctags 和 gtags 支持：
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif
if !has("win32")
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


" 如果使用 universal ctags 需要增加下面一行
" Get ctags version
" let g:ctags_version = system('ctags --version')[0:8]
" if g:ctags_version == "Universal"
  " let g:gutentags_ctags_extra_args += ['--extras=+q', '--output-format=e-ctags']
" endif
let g:gutentags_ctags_extra_args += ['--extras=+q', '--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 1
" let g:gutentags_define_advanced_commands = 1


" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" 调试
let g:gutentags_trace = 0

" clang-format
let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>kf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>kf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
