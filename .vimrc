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
set rnu
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
set lazyredraw
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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'octol/vim-cpp-enhanced-highlight'
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
Plug 'ervandew/supertab'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Yggdroot/indentLine'

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

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
call plug#end()


" color-schema
syntax enable
set t_Co=256
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_termtrans = 1
let g:solarized_contrast = "high"
set background=dark
colorscheme solarized
let g:solarized_termtrans=1
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


" search
nnoremap <silent> <C-c> :vimgrep <cword> %<CR> :cw <CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <S-p> :Ag <C-R><C-W><CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" TagBar
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

" toggle location list and quick fix
function! ToggleLocation()
    if exists("g:lwindow")
        lclose
        unlet g:lwindow
    else
        try
            lopen 10
            let g:lwindow = 1
        catch
            echo "No Errors found!"
        endtry
    endif
endfunction

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
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_semantic_triggers =  {
            \ 'typescript,javascript': ['re!\w{5}', '.'],
            \ 'c,cpp,php': ['.', '::', '->'],
            \ }

let g:EditorConfig_max_line_indicator = "none"

" supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

" snippets
let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/vim-snippets/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ale config
let g:ale_linters = {
\'html': [],
\'javascript': ['eslint'],
\'typescript': ['eslint', 'prettier', 'tsserver'],
\'typescriptreact': ['eslint', 'prettier', 'tsserver'],
\'python': ['pyflakes'],
\'php': ['phpcs', 'phpmd'],
\'c': [],
\'cpp': []
\}

let g:ale_fixers = {
\'javascript': ['eslint'],
\'typescript': ['eslint', 'prettier'],
\'typescriptreact': ['eslint', 'prettier'],
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

" filetype aliasz
au BufRead,BufNewFile *.{css,less} set ft=css
au BufRead,BufNewFile *.{xml,ejs} set ft=html
au BufRead,BufNewFile *.vue set ft=vue

" js
let g:javascript_enable_domhtmlcss = 1
let b:javascript_fold = 'false'
let g:jsx_ext_required = 0

" markdown
autocmd Filetype markdown nmap md <Plug>MarkdownPreview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" vimspector
packadd! vimspector

" leader key
let g:mapleader = ','
nmap <leader>r <Plug>VimspectorContinue
nmap <leader><S-r> :VimspectorReset<CR>
nmap <leader>b <Plug>VimspectorToggleBreakpoint
nmap <leader>n <Plug>VimspectorStepOver
nmap <leader>s <Plug>VimspectorStepInto
nmap <leader><S-s> <Plug>VimspectorStepOut
nnoremap <leader>c :YcmCompleter GoTo<CR>
nmap <silent> <leader>d <Plug>DashSearch

map <leader><leader> :NERDTreeToggle<CR>
map <leader>. :NERDTreeFind<CR>
nmap <leader>t :TagbarToggle<CR>

nmap <leader>g :13Gstatus<CR>
nmap <leader><C-g> :Gclog %<CR>
nmap <leader><S-g> :Gblame<CR>

nnoremap <script> <silent> <leader>w :call ToggleLocation()<CR>
