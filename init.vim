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
" set relativenumber           " 显示相对行号
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
set listchars=tab:▸\ ,eol:¬,trail:˽,space:· " 设置不可视字符格式
set nofoldenable               " 自动折叠
set conceallevel=0
set foldmethod=syntax
set laststatus=2
" set spell spelllang=en_us    " 打开英语单词的拼写检查
"set foldmethod=indent " 设置折叠方式为缩进
"set scrolloff=9999    " 让光标所在行处理屏幕中间，上下各保持 9999 行空隙

" coc settings
" if hidden is not set, TextEdit might fail.
set hidden
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=100
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

let mapleader = ","
let g:mapleader = ","
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-p> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
"
" COC Snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:coc_snippet_next = '<tab>'


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
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endif

" YAML 配置
" au! BufRead,BufNewFile *.yml,*.yaml set filetype=yaml
" autocmd FileType yaml set ts=2 sw=2 sts=2 et

" Enable syntax highlighting
" You need to reload this file for the change to apply
" 按文件类型加载插件及设置缩进
" filetype plugin indent on
" " 开启语法高亮
" syntax enable

" 每行超过160个的字符用下划线标示
" au BufRead,BufNewFile *.s,*.c,*.cpp,*.h,*.cl,*.rb,*.sql,*.sh,*.vim,*.js,*.css,*.html,*.py 2match Underlined /.\%161v/

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

" VIM 中文help
Plug 'yianwillis/vimcdoc'

" 括号自动补全
Plug 'jiangmiao/auto-pairs'

" 语法高亮插件
Plug 'sheerun/vim-polyglot'
" 主题
Plug 'joshdick/onedark.vim'
let g:onedark_terminal_italics = 1
" let g:onedark_termcolors = 256
let g:onedark_hide_endofbuffer = 1

" Ansible
Plug 'pearofducks/ansible-vim'
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby', '*.py.j2': 'python', '*.service.j2': 'systemd' }

" SaltStack
Plug 'saltstack/salt-vim'
let g:sls_use_jinja_syntax = 1

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1        " 启用powerline样式字体
" let g:airline_section_b = '%{strftime("%Y-%m-%d %H:%M:%S")}'

" 依赖Nodejs && yarn
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
" JSON 注释高亮
" autocmd FileType json syntax match Comment +\/\/.\+$+

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

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_autowrite = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }


Plug 'Yggdroot/indentLine'
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 202
let g:indentLine_enabled = 1
" let g:indentLine_char = 'c'
let g:indentLine_concealcursor = 'inc'
" let g:indentLine_char = 'c'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_conceallevel = 2
let g:indentLine_color_dark = 1

" Plug 'sgur/vim-editorconfig'
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'easymotion/vim-easymotion'


Plug 'cespare/vim-toml'
Plug 'elzr/vim-json', {'for': 'json'}
" 是否隐藏引号号，通过颜色区分变量类型
let g:vim_json_syntax_conceal = 0
" let g:vim_json_syntax_concealcursor = 'nvc'
let g:vim_json_warnings=1

" 括号高亮
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'evanmiller/nginx-vim-syntax'


" 多重光标选取
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-N>'
let g:multi_cursor_prev_key='<C-P>'
let g:multi_cursor_skip_key='<C-X>'
let g:multi_cursor_quit_key='<Esc>'

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
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" 自定义VIM启动界面
Plug 'mhinz/vim-startify'

" 自动补全引号括号等
" Plug 'Raimondi/delimitMate'
" au FileType python let b:delimitMate_nesting_quotes = ['"']

" 自动补全html/xml标签
" Plug 'docunext/closetag.vim'
" let g:closetag_html_style = 1

" 侧边栏，代替Nerdtree
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" " call defx#custom#column('size','')
" " call defx#custom#column('filename', {
" "       \ 'directory_icon': '▸',
" "       \ 'opened_icon': '▾',
" "       \ 'root_icon': ' ',
" "       \ 'min_width': 30,
" "       \ 'max_width': 30,
" "       \ })
" " call defx#custom#column('mark', {
" "       \ 'readonly_icon': '',
" "       \ 'selected_icon': '',
" "       \ })
" Plug 'kristijanhusak/defx-git'
" let g:defx_git#indicators = {
"   \ 'Modified'  : '✹',
"   \ 'Staged'    : '✚',
"   \ 'Untracked' : '✭',
"   \ 'Renamed'   : '➜',
"   \ 'Unmerged'  : '═',
"   \ 'Ignored'   : '☒',
"   \ 'Deleted'   : '✖',
"   \ 'Unknown'   : '?',
"   \ }
" let g:defx_git#column_length = 1
" let g:defx_git#show_ignored = 0
" let g:defx_git#raw_mode = 1
"
" Plug 'kristijanhusak/defx-icons'
" let g:defx_icons_enable_syntax_highlight = 1
" let g:defx_icons_column_length = 2
" let g:defx_icons_directory_icon = ''
" let g:defx_icons_mark_icon = '*'
" let g:defx_icons_parent_icon = ''
" let g:defx_icons_default_icon = ''
" let g:defx_icons_directory_symlink_icon = ''
" " Options below are applicable only when using "tree" feature
" let g:defx_icons_root_opened_tree_icon = ''
" let g:defx_icons_nested_opened_tree_icon = ''
" let g:defx_icons_nested_closed_tree_icon = ''
" " autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'defx') | quit | endif

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <silent> <F3> :NERDTreeToggle <CR><ESC>
let NERDTreeWinSize=30
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.swp$', '\~$', '.git$[[dir]]', '.svn$[[dir]]']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 当只有NerdTree窗口时,自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 打开目录时自动开启NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" 文件查找
" Plug 'kien/ctrlp.vim'
" let g:ctrlp_max_height = 30
" set wildignore+=*.pyc
" set wildignore+=*_build/*
" set wildignore+=*/coverage/*
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'tpope/vim-fugitive'
" set statusline+=%{fugitive#statusline()}

" Git 实时展示修改
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

" Git 信息查看
Plug 'rhysd/git-messenger.vim'
nmap <Leader>gm <Plug>(git-messenger)
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
" let g:NERDAltDelims_java = 1
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


" Golang
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
" Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0

" Terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" Terraform 自动补全
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }
" (Optional) Enable terraform plan to be include in filter
" let g:syntastic_terraform_tffilter_plan = 1
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
"let g:terraform_completion_keys = 1
" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
"let g:terraform_registry_module_completion = 0

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif
" if !has('gui_running')
"   set t_Co=256
" endif
colorscheme onedark
