set nocompatible         	" be iMproved, required
syntax on
filetype on
filetype plugin indent on
set mouse=a
set foldenable
set foldmethod=indent
set foldlevelstart=99
set cul						" 高亮光标所在行
set shortmess=atI   	 	" 启动的时候不显示那个援助乌干达儿童的提示
set backspace=2
set helplang=cn
set number		 	        " 显示行号
set helplang=cn
set viminfo+=!		 	    " 保存全局变量
set iskeyword+=_,$,@,%,#,- 	" 带有如下符号的单词不要被换行分割
set noeb					" 去掉输入错误的提示声音
set confirm					" 在处理未保存或只读文件的时候，弹出确认
set autoread
set hlsearch				" 搜索逐字符高亮
set incsearch
set laststatus=2            " 显示状态栏
set backupcopy=yes          " 为了开启webpack-dev
set tags=./tags;,tags

" 设置字符编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set termencoding=utf-8

" 设置缩进
set autoindent				" 自动缩进
set cindent					" Tab键的宽度
set expandtab				" 空格代替tab
set tabstop=4				" 统一缩进为4
set softtabstop=4
set shiftwidth=4
set t_ut=
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype phtml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2

" leader键位设置
let g:mapleader = ','

" tab切换
map <C-j> :tabp<CR>
map <C-k> :tabn<CR>

" 插件管理
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'altercation/vim-colors-solarized', { 'as': 'solarized' }
Plug 'tpope/vim-fugitive'
Plug 'rizzatti/dash.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ludovicchabant/vim-gutentags'
Plug 'chazy/cscope_maps'
Plug 'ryanoasis/vim-webdevicons'
Plug 'editorconfig/editorconfig-vim'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" frontend
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'

" php
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'vim-vdebug/vdebug', { 'for': 'php' }

" document
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

" 配色
syntax enable
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
hi CursorLine cterm=underline ctermbg=none
hi Folded ctermbg=none
hi LineNr ctermbg=none
hi VertSplit ctermbg=none
hi StatusLineNC ctermbg=none

" emmet
let g:user_emmet_settings = {
\    'html' : {
\        'quote_char': "'",
\    },
\}


" fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <S-p> :Ag<CR>
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" ctrlp ignore directory
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" let g:ctrlp_custom_ignore = {
"             \ 'dir':  '\v[\/]\.(git|hg|svn|idea)|(node_modules|vendor)$',
"             \ 'file': '\v\.(exe|so|dll)$',
"             \ }

" FileList
map <F3> <plug>NERDTreeTabsToggle<CR>

" TagBar
nmap <F2> :TagbarToggle<CR>
let g:tagbar_type_javascript = {
            \ 'ctagsbin' : 'jsctags'
            \ }
let g:tagbar_type_typescript = {
            \ 'ctagstype': 'typescript',
            \ 'kinds': [
            \ 'c:classes',
            \ 'n:modules',
            \ 'f:functions',
            \ 'v:variables',
            \ 'v:varlambdas',
            \ 'm:members',
            \ 'i:interfaces',
            \ 'e:enums',
            \ ]
            \ }

" toggle location list open
function! ToggleQuickFix()
  if exists("g:qwindow")
    lclose
    unlet g:qwindow
  else
    try
      lopen 10
      let g:qwindow = 1
    catch
      echo "No Errors found!"
    endtry
  endif
endfunction
nmap <script> <silent> <F4> :call ToggleQuickFix()<CR>

" ctags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_file_list_command = {
\   'markers': {
\     '.git': 'git ls-files',
\   },
\ }
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_executable_php = 'phpctags'
" 显示状态
function! s:get_gutentags_status(mods) abort
    let l:msg = ''
    if index(a:mods, 'ctags') > 0
        let l:msg .= '♨'
    endif
    if index(a:mods, 'cscope') > 0
        let l:msg .= '♺'
    endif
    return l:msg
endfunction

set statusline+=%{gutentags#statusline_cb(
    \function('<SID>get_gutentags_status'))}

" You Complete Me configure
" autocomplete
let g:ycm_global_ycm_extra_conf =  '~/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = []
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl,typescript': ['re!\w{2}'],
            \ 'javascript': ['.'],
            \ 'php': ['::', '->'],
            \ }
" jump
nnoremap <F12> :YcmCompleter GoTo<CR>

" ale config
let g:ale_linters = {
\'html': [],
\'javascript': ['eslint'],
\'typescript': ['eslint', 'tsserver', 'tslint'],
\'python': ['pyflakes'],
\'php': ['phpcs', 'phpmd'],
\'c': [],
\'cpp': []
\}

let g:ale_fixers = {
\'javascript': ['eslint'],
\'typescript': ['eslint', 'tsserver'],
\'*': ['remove_trailing_lines', 'trim_whitespace']
\}

let g:ale_php_phpcs_standard = 'PSR2'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '!>'
let g:ale_sign_warning = '?>'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

" 文件类型绑定
au BufRead,BufNewFile *.{css,less} set ft=css
au BufRead,BufNewFile *.{xml,ejs} set ft=html
au BufRead,BufNewFile *.vue set ft=vue

" pandoc设置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=pandoc
autocmd Filetype pandoc nmap md :!pandoc -s -S --latexmathml --listings % -o %.html <CR><CR>

" js配置
let g:javascript_enable_domhtmlcss = 1
let b:javascript_fold = 'false'
let g:jsx_ext_required = 0

" xdebug调试配置
let g:vdebug_keymap = {}
let g:vdebug_keymap["run"] = '<F5>'
let g:vdebug_keymap["run_to_cursor"] = "<F6>"
let g:vdebug_keymap["step_over"] = "<F7>"
let g:vdebug_keymap["step_into"] = "<F8>"
let g:vdebug_keymap["step_out"] = "<F9>"
let g:vdebug_options = {}
let g:vdebug_options["port"] = 8008

" phpcomplete enhanced
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1

" dash 快捷键
nmap <silent> <leader>d <Plug>DashSearch

" 语法补全
" Trigger configuration. Do not use <tab> if you use
au FileType javascript :UltiSnipsAddFiletypes javascript
au FileType javascript :UltiSnipsAddFiletypes javascript-node
au FileType css :UltiSnipsAddFiletypes css
au FileType scss :UltiSnipsAddFiletypes css
au FileType less :UltiSnipsAddFiletypes css
au FileType php :UltiSnipsAddFiletypes php
au FileType python :UltiSnipsAddFiletypes python
au FileType c :UltiSnipsAddFiletypes c
au FileType tex :UltiSnipsAddFiletypes tex
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" c/c++ 开启gdb调试
let g:termdebug_wide = 2
autocmd Filetype cpp packadd termdebug
autocmd Filetype cpp map <C-F5> :Termdebug<CR>
