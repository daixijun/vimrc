autocmd! bufwritepost $MYVIMRC source %   " 更改配置文件后 自动加载
set clipboard+=unnamed        " 启用共享粘贴板
set mouse-=a                 " 禁用鼠标
set backspace=indent,eol,start  " 退格键
" 字符编码
" let &termencoding=&encoding
" set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings=utf-8,cp936,gb18030,gbk,gb2312
set vb t_vb=                 " 关闭提示音
set autochdir                " 设定文件浏览器目录为当前目录
set autoread                 " 配置更新后自动重载
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set undolevels=700           " 可回退700步
set number                   " 显示行号
set relativenumber           " 显示相对行号
set tw=159                   " 每行字符长度
set nowrap                   " 不自动换行
set fo-=t                    " don't automatically wrap text when typing
set colorcolumn=160          " 160字符处显示标识线
highlight ColorColumn ctermbg=233   " 高亮标识线
set cursorline               " 高亮当前行
set ruler                    " 显示当前位置
set tabstop=4                " TAB长度
set softtabstop=4            " 如果 tabstop=4  那么按一次tab 插入4个空格， 按两次tab将会变成制表符， 逢8空格进1制表符
set shiftwidth=4             " 自动缩进宽度
set shiftround
set expandtab                " 转换tab为空格
set ignorecase               " 搜索时忽略大小写
set smartcase                " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set nobackup                 " 不自动备份
set nowritebackup
set noswapfile               " 不生成.swap文件
set cindent                  " C 缩进
set smartindent              " 智能缩进
set showmatch                " 高亮显示匹配的括号
set list                     " 显示不可视字符
set listchars=tab:▸\ ,eol:¬,trail:-,nbsp:+  " 设置不可视字符格式
set nofoldenable               " 自动折叠
"set foldmethod=indent " 设置折叠方式为缩进
"set scrolloff=9999    " 让光标所在行处理屏幕中间，上下各保持 9999 行空隙

let mapleader = ","
let g:mapleader = ","

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :q<CR>  " 关闭当前窗口
noremap <Leader>E :qa!<CR>   " 关闭所有窗口


map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>

" easier moving between tabs
map <Leader>tp <esc>:tabprevious<CR>
map <Leader>tn <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

vnoremap <s-tab> <gv         " 取消缩进
vnoremap <tab> >gv           " 缩进

" complete
inoremap <C-j>  <C-n>
inoremap <C-k>  <C-p>

" 将光标移到行首
" imap <c-a> <ESC>I
" 将光标移到行尾
" imap <c-l> <ESC>A
" imap <c-e> <ESC>A

" 记录退出时光标位置，下次打开时光标自动定位到此处
if has("autocmd")
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endif

" YAML 配置
au! BufRead,BufNewFile *.yml,*.yaml set filetype=yaml
autocmd FileType yaml set ts=2 sw=2 sts=2 et

" Enable syntax highlighting
" You need to reload this file for the change to apply
" 按文件类型加载插件及设置缩进
" filetype plugin indent on
" " 开启语法高亮
" syntax enable

" 每行超过160个的字符用下划线标示
au BufRead,BufNewFile *.s,*.c,*.cpp,*.h,*.cl,*.rb,*.sql,*.sh,*.vim,*.js,*.css,*.html,*.py 2match Underlined /.\%161v/

" 设置文件折叠方式
" autocmd BufNewFile,BufReadPost *.py,*.pyw set foldmethod=indent
" autocmd BufNewFile,BufReadPost *.py,*.pyw set filetype=python
" autocmd BufNewFile,BufReadPost *.sh,*.zsh,*.bash set filetype=sh

" Setup vim-plug to manage your plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" 对齐
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" 翻页时平滑滚动
" Plug 'yuttie/comfortable-motion.vim'

" 语法高亮插件
Plug 'sheerun/vim-polyglot'
" 主题
Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'

" 状态栏
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme = 'oceanicnext'
" let g:airline_theme = 'gruvbox'
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'
let g:airline_powerline_fonts = 1        " 启用powerline样式字体
" let g:airline_section_b = '%{strftime("%Y-%m-%d %H:%M:%S")}'
let g:airline_section_error = '%{exists("ALEGetStatusLine") ? ALEGetStatusLine() : ""}'

" 代替YCM 自动补全
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
set runtimepath += "~/.local/share/nvim/plugged/deoplete.nvim/"
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Terraform
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
" let g:deoplete#omni_patterns.complete_method = 'complete'
" call deoplete#custom#option({
" \  'auto_complete': v:true,
" \  'omni_patterns': {
" \    'complete_method': 'omnifunc',
" \    'terraform': '[^ *\t"{=$]\w*',
" \  },
" \  'complete_method': 'complete',
" \})
" call deoplete#initialize()

Plug 'zchee/deoplete-jedi', { 'for': 'python'}

" 依赖Nodejs && yarn
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'w0rp/ale'
" let &runtimepath .= ",~/.local/share/nvim/plugged/ale"
let g:ale_enabled = 1
" let g:ale_sign_column_always = 1
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_history_log_output = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {
\   "python": ["flake8"],
\   'javascript': ['eslint'],
\   'yaml.ansible': ['ansible-lint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" let g:ale_python_flake8_executable = '/usr/local/bin/flake8'
let g:ale_python_flake8_args = '--max-line-length=160'
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1
" set statusline+=%{ALEGetStatusLine()}

Plug 'ryanoasis/vim-devicons'
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 1
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

Plug 'Yggdroot/indentLine'
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
" let g:indentLine_char = 'c'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_color_dark = 1

Plug 'hdima/python-syntax'
let python_highlight_all = 1

" Ansible
Plug 'willthames/ansible-lint', { 'for': 'ansible' }
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "od"
    " a: highlight all instances of key=
    " o: highlight only instances of key= found on newlines
    " d: dim the instances of key= found
    " b: brighten the instances of key= found
    " n: turn this highlight off completely
let g:ansible_name_highlight = 'd'
    " d: dim the instances of name: found
    " b: brighten the instances of name: found
let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_with_keywords_highlight = 'Constant'

" Saltstack
Plug 'saltstack/salt-vim'

Plug 'sgur/vim-editorconfig'

Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-markdown', {'for': 'markdown'}
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
let g:markdown_syntax_conceal = 1

" VUE && JS && TS
Plug 'posva/vim-vue', {'for': 'vue'}
autocmd BufNewFile,BufReadPost *.vue set filetype=vue
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs'

Plug 'cespare/vim-toml'
Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0
" let g:vim_json_syntax_concealcursor = 'nvc'

" 括号高亮
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'evanmiller/nginx-vim-syntax'


" 多重光标选取
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-N>'
let g:multi_cursor_prev_key='<C-P>'
let g:multi_cursor_skip_key='<C-X>'
let g:multi_cursor_quit_key='<Esc>'


Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ultisnips_python_quoting_style = 'single'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

" Plug 'Glench/Vim-Jinja2-Syntax'


" 标红每行尾无效空格
Plug 'bronson/vim-trailing-whitespace'


Plug 'majutsushi/tagbar'
nmap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['+', '-']
"set g:tagbar_ctags_bin = /usr/bin/ctags
let g:tagbar_type_python = {
    \ 'kinds' : [
        \ 'c:classes',
        \ 'f:functions',
        \ 'm:class members',
        \ 'v:variables:1',
        \ 'i:imports:1'
    \ ]
\ }

" 自定义VIM启动界面
Plug 'mhinz/vim-startify'

" 自动补全引号括号等
Plug 'Raimondi/delimitMate'
au FileType python let b:delimitMate_nesting_quotes = ['"']

" 自动补全html/xml标签
" Plug 'docunext/closetag.vim'
" let g:closetag_html_style = 1

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <silent> <F3> :NERDTreeToggle <CR><ESC>
let NERDTreeWinSize=24
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.swp$', '\~$', '.git$[[dir]]', '.svn$[[dir]]']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 当只有NerdTree窗口时,自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 打开目录时自动开启NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 文件操作
" Plug 'tpope/vim-eunuch'
    " :Remove: Delete a buffer and the file on disk simultaneously.
    " :Unlink: Like :Remove, but keeps the now empty buffer.
    " :Move: Rename a buffer and the file on disk simultaneously.
    " :Rename: Like :Move, but relative to the current file's containing directory.
    " :Chmod: Change the permissions of the current file.
    " :Mkdir: Create a directory, defaulting to the parent of the current file.
    " :Find: Run find and load the results into the quickfix list.
    " :Locate: Run locate and load the results into the quickfix list.
    " :Wall: Write every open window. Handy for kicking off tools like guard.
    " :SudoWrite: Write a privileged file with sudo.
    " :SudoEdit: Edit a privileged file with sudo.
    " File type detection for sudo -e is based on original file name.
    " New files created with a shebang line are automatically made executable.
    " New init scripts are automatically prepopulated with /etc/init.d/skeleton.

" Plug 'sjl/gundo.vim'
" let g:gundo_preview_height = 40
" let g:gundo_width = 24

" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" 文件查找
Plug 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'tpope/vim-fugitive'
set statusline+=%{fugitive#statusline()} "

" Git 实时展示修改
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

" Git 信息查看
Plug 'rhysd/git-messenger.vim'
" Mapping	Description
" q	Close the popup window
" o	older. Back to older commit at the line
" O	Opposite to o. Forward to newer commit at the line
" d	Toggle diff hunks only related to current file in the commit
" D	Toggle all diff hunks in the commit
" ?	Show mappings help

" 注释
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
    \ 'c': {'left': '"'},
    \ 'vim': {'left': '"'}
    \ }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" 使用：
" 1、 <Leader>cc 注释当前行和选中行
" 2、 <Leader>cn 没有发现和<Leader>cc有区别
" 3、 <Leader>c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
" 4、 <Leader>cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
" 5、 <Leader>ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
" 6、 <Leader>cs 添加性感的注释，代码开头介绍部分通常使用该注释
" 7、 <Leader>cy 添加注释，并复制被添加注释的部分
" 8、 <Leader>c$ 注释当前光标到改行结尾的内容
" 9、 <Leader>cA 跳转到该行结尾添加注释，并进入编辑模式
" 10、<Leader>ca 转换注释的方式，比如： /**/和//
" 11、<Leader>cl <Leader>cb 左对齐和左右对其，左右对其主要针对/**/
" 12、<Leader>cu 取消注释


" Python 折叠
Plug 'BtPht/python_editing'
" 使用:
" f: 折叠/取消 当前class/function
" F: 折叠/取消 所有

" Python virtualenv
" Plug 'jmcantrell/vim-virtualenv'

" Plug 'bling/vim-bufferline'

" Golang
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Terraform
Plug 'hashivim/vim-terraform'
let g:terraform_align=1
let g:terraform_fold_sections=1

" Terraform 自动补全
Plug 'juliosueiras/vim-terraform-completion'
" (Optional) Enable terraform plan to be include in filter
" let g:syntastic_terraform_tffilter_plan = 1
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
"let g:terraform_completion_keys = 1
" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
"let g:terraform_registry_module_completion = 0

" 异步编译
Plug 'neomake/neomake', has('nvim') ? {} : { 'on': [] }

call plug#end()

syntax enable
if has("termguicolors")
    set termguicolors
endif
" 主题样式
" colorscheme gruvbox
colorscheme onedark
" colorscheme OceanicNext
" (Optional)Remove Info(Preview) window
" set completeopt-=preview
" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
