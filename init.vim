" =======================
" 插件
" =======================
" 安装vim-plug 插件管理工具
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'yianwillis/vimcdoc'       " VIM 中文help
Plug 'jiangmiao/auto-pairs'     " 括号自动补全
Plug 'sheerun/vim-polyglot'     " 语法高亮插件
Plug 'Yggdroot/indentLine'      " 缩进线
Plug 'mhinz/vim-startify'       " 启动界面
Plug 'ntpeters/vim-better-whitespace'  " 清除行尾无效空格
Plug 'terryma/vim-multiple-cursors'     " 多光标操作
Plug 'editorconfig/editorconfig-vim'     " 支持editorconfig
Plug 'tpope/vim-surround'       " 快速替换tag或引号
" Plug 'justinmk/vim-sneak'       " 快速跳转工具
Plug 'pearofducks/ansible-vim'  " ansible
Plug 'saltstack/salt-vim'       " SaltStack
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }   " 生成Markdown TOC
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }
Plug 'joshdick/onedark.vim'
Plug 'bling/vim-airline'        " 状态栏
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }    " 依赖Nodejs && yarn
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }   " 代替nerdtree侧边栏
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } 		" 快速搜索工具
" Plug 'Shougo/neomru.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'   " 左边实现显示git变动
Plug 'rhysd/git-messenger.vim'  " Git信息查看
Plug 'scrooloose/nerdcommenter'  " 快速注释
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }   " Golang
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }             " Terraform
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }  " Terraform 自动补全
call plug#end()


" ==================
" 主题
" =================
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
if !has('gui_running')
  set t_Co=256
endif
colorscheme onedark


" =================
" 通用配置
" =================
autocmd! bufwritepost $MYVIMRC source %   " 更改配置文件后 自动加载
set clipboard+=unnamed        " 启用共享粘贴板
set mouse-=a                 " 禁用鼠标
set backspace=indent,eol,start  " 退格键
" 字符编码
set termencoding=utf-8
set encoding=utf-8           " 设置新文件的编码为 UTF-8
" set fileencoding=utf-8
set fileencodings=utf-8,cp936,gb18030,gbk,gb2312
set vb t_vb=                 " 关闭提示音
set autochdir                " 设定文件浏览器目录为当前目录
set autoread                 " 文件更新后自动重载
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set undolevels=700           " 可回退700步
set number                   " 显示行号
" set relativenumber           " 显示相对行号
set textwidth=159                   " 每行字符长度
set linebreak
set nowrap                   " 不自动换行
set fo-=t                    " don't automatically wrap text when typing
set colorcolumn=160          " 160字符处显示标识线
set cursorcolumn             " 高亮当前列
set cursorline               " 高亮当前行
set ruler                    " 显示当前行号及列号
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
set listchars=tab:▸\ ,eol:¬,space:· " 设置不可视字符格式
set nofoldenable               " 取消自动折叠
set conceallevel=0              " Markdown/JSON 等文件类型不隐藏引号等字符
set foldmethod=syntax           " 自动折叠方式
set laststatus=2
" if hidden is not set, TextEdit might fail.
set hidden
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=100
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
highlight ColorColumn ctermbg=233   " 高亮标识线


" ==================
" Mapping 快捷键
" =================
let mapleader = ","
let g:mapleader = ","

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" 使用<TAB> 键触发COC补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" 回车键确认COC选中的item
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
" noremap <C-Z> :update<CR>
" vnoremap <C-Z> <C-C>:update<CR>
" inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :q<CR>  " 关闭当前窗口
noremap <Leader>E :qa!<CR>   " 关闭所有窗口

" 窗口切换
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

" vnoremap <s-tab> <gv         " 取消缩进
" vnoremap <tab> >gv           " 缩进

" complete
inoremap <C-j>  <C-n>
inoremap <C-k>  <C-p>

" 将光标移到行首
" imap <c-a> <ESC>I
" 将光标移到行尾
" imap <c-l> <ESC>A
" imap <c-e> <ESC>A

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:onedark_terminal_italics = 1
let g:onedark_termcolors = 256
let g:onedark_hide_endofbuffer = 1

" Ansible
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby', '*.py.j2': 'python', '*.service.j2': 'systemd' }

let g:sls_use_jinja_syntax = 1

let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1        " 启用powerline样式字体
" let g:airline_section_b = '%{strftime("%Y-%m-%d %H:%M:%S")}'

" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" adding to vim-startify screen
let g:webdevicons_enable_startify = 1
" Adding the custom source to denite
" let g:webdevicons_enable_denite = 1
" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1
" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsOS = 'Darwin'
" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'


let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_autowrite = 1

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

let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

" 是否隐藏引号号，通过颜色区分变量类型
let g:vim_json_syntax_conceal = 0
" let g:vim_json_syntax_concealcursor = 'nvc'
let g:vim_json_warnings=1

" 括号高亮
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'evanmiller/nginx-vim-syntax'

" FZF
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>

" 多重光标选取
let g:multi_cursor_next_key='<C-N>'
let g:multi_cursor_prev_key='<C-P>'
let g:multi_cursor_skip_key='<C-X>'
let g:multi_cursor_quit_key='<Esc>'



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


" 自动补全引号括号等
" Plug 'Raimondi/delimitMate'
" au FileType python let b:delimitMate_nesting_quotes = ['"']

" 自动补全html/xml标签
" Plug 'docunext/closetag.vim'
" let g:closetag_html_style = 1

" 侧边栏，代替Nerdtree
" call defx#custom#column('size','')
call defx#custom#column('filename', {
    \ 'min_width': 20,
    \ 'max_width': 100,
    \ })
call defx#custom#column('mark', {
    \ 'readonly_icon': '',
    \ 'selected_icon': '',
    \ })
let g:defx_git#indicators = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Ignored'   : '☒',
    \ 'Deleted'   : '✖',
    \ 'Unknown'   : '?'
    \ }
let g:defx_git#column_length = 1
let g:defx_git#show_ignored = 0
let g:defx_git#raw_mode = 0

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''
call defx#custom#option('_',{
    \ 'columns'   : 'indent:icons:filename:type:size',
    \ 'split'     : 'floating',
    \ 'direction' : 'topleft',
    \ 'winwidth'  : 120,
    \ 'show_ignored_files': 0,
    \ 'buffer_name': '[defx]',
    \ 'auto_cd': 0,
    \ 'toggle': 1,
    \ 'resume': 1,
    \ })


" 打开目录时自动开启defx
" FIXME: 此处如果打开目录时使用 `floating` 窗口，将窗口无法取得焦点，所以指定`vertical`方式
augroup ft_defx
    au!
    au VimEnter * sil! au! FileExplorer *
    au BufEnter * if s:isdir(expand('%')) | bd | exe 'Defx -split=vertical' | endif
augroup END

fu! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) ||
       \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu
" 只有defx窗口时自动关闭
autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'defx') | quit | endif
nnoremap <silent> <leader>d :Defx<Cr>
autocmd FileType defx DisableWhitespace
autocmd FileType defx call DefxSettings()

function! DefxContextMenu() abort
  let l:actions = ['new_file', 'new_directory', 'rename', 'copy', 'move', 'paste', 'remove']
  let l:selection = confirm('Action?', "&New file\nNew &Folder\n&Rename\n&Copy\n&Move\n&Paste\n&Delete")
  silent exe 'redraw'

  return feedkeys(defx#do_action(l:actions[l:selection - 1]))
endfunction

function! DefxSettings() abort
  setl nonumber
  setl norelativenumber
  setl listchars=

  " Define mappings
  nnoremap <silent><buffer>m :call DefxContextMenu()<CR>
  nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> o defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> vs defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> sp defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> .. defx#do_action('cd', ['..'])
  " nnoremap <silent><buffer><expr> t defx#do_action('open_directory')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  " nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  " nnoremap <silent><buffer><expr> s defx#do_action('open', 'botright vsplit')
  " nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> l defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  " nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns','git:mark:filename:type:size:time')
  " nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> h defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction



let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

nmap <Leader>gm <Plug>(git-messenger)
" Mapping	Description
" q	Close the popup window
" o	older. Back to older commit at the line
" O	Opposite to o. Forward to newer commit at the line
" d	Toggle diff hunks only related to current file in the commit
" D	Toggle all diff hunks in the commit
" ?	Show mappings help

" 注释
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
    \ 'vim': {'left': '"'},
    \ 'json': {'left': '//'}
    \ }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" Golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

