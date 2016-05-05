set nocompatible         	" be iMproved, required
syntax on
filetype on
filetype plugin indent on
set foldenable
set foldmethod=indent
set foldlevelstart=99
set cul						" 高亮光标所在行
set shortmess=atI   	 	" 启动的时候不显示那个援助乌干达儿童的提示
color darkblue
set backspace=2
set helplang=cn
set encoding=utf-8
set autoindent				" 自动缩进
set cindent					" Tab键的宽度
set tabstop=4				" 统一缩进为4
set expandtab				" 空格代替tab
set softtabstop=4
set shiftwidth=4
set number		 	        " 显示行号
set langmenu=zh_CN.UTF-9 	" 语言设置
set helplang=cn
set viminfo+=!		 	    " 保存全局变量
set iskeyword+=_,$,@,%,#,- 	" 带有如下符号的单词不要被换行分割
set noeb					" 去掉输入错误的提示声音
set confirm					" 在处理未保存或只读文件的时候，弹出确认
set autoread
set hlsearch				" 搜索逐字符高亮
set incsearch
set laststatus=2            " 显示状态栏

" 设置字符编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

" leader键位设置
let g:mapleader = ','

" 透明背景
hi Normal ctermbg=NONE
hi Folded ctermbg=NONE ctermfg=3
hi VertSplit ctermfg=gray ctermbg=NONE
hi Comment ctermfg=2
hi Pmenu    ctermfg=0 ctermbg=7
hi PmenuSel ctermfg=7 ctermbg=0
hi Underlined ctermfg=6
"highlight PmenuSel ctermfg=1 ctermbg=6

" tab切换
map <C-j> :tabp<CR>
map <C-k> :tabn<CR>


" 插件管理
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'						" 插件管理~
"Plugin 'c-standard-functions-highlight'		" 函数高亮~
Plugin 'kien/ctrlp.vim'						" 文件搜索~
Plugin 'scrooloose/nerdtree'				" 文件列表~
Plugin 'jistr/vim-nerdtree-tabs'			" 列表增强~
Plugin 'taglist-plus'						" 函数列表~
Plugin 'rosenfeld/conque-term'              " 内部终端~
Plugin 'Lokaltog/vim-powerline'             " 状态边栏~
"Plugin 'Valloric/YouCompleteMe'				" 自动补全~
Plugin 'Syntastic'							" 错误提示~
"Plugin 'bronson/vim-trailing-whitespace'	" 标红空白~
Plugin 'scrooloose/nerdcommenter'			" 快速注释~
Plugin 'delimitMate.vim'					" 括号补全~
Plugin 'python.vim'							" 写Python~
Plugin 'Python-mode-klen'					" 噜Python~
Plugin 'pangloss/vim-javascript'			" JS更好看~
Plugin 'nono/jquery.vim'					" JQ更好看~
Plugin 'ianva/vim-youdao-translater'		" 有道词典~
Plugin 'vim-pandoc/vim-pandoc-syntax'		" 书写文档~
"Plugin 'KabbAmine/zeavim.vim'				" 查看Zeal~
Plugin 'php.vim-for-php5'					" 好写网页~
Plugin 'mattn/emmet-vim'					" 简写HTML~
Plugin 'chazy/cscope_maps'                  " 查看调用~
Plugin 'fugitive.vim'                       " 版本控制~
Plugin 'joonty/vdebug'                      " PHP调试~
"Plugin 'hallettj/jslint.vim'                " js增强~
Plugin 'neocomplcache'
Plugin 'rizzatti/dash.vim'
Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'phpfolding.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'ternjs/tern_for_vim'

" 插件个性化

" 有道词典翻译
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>

" 函数列表查看
let g:Tlist_Show_One_File = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Use_Horiz_Window = 0
let g:Tlist_Enable_Fold_Column = 0

" 文件列表查看
map <F3> <plug>NERDTreeTabsToggle<CR> 
map <F2> :TlistToggle<CR>

" YCM自动补全设置
"let g:ycm_global_ycm_extra_conf =  '~/ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_autoclose_preview_window_after_completion = 0
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_confirm_extra_conf = 0

" YCM跳转
"nnoremap <C-F12> :YcmCompleter GoToDefinition<CR>
"nnoremap <F12> :YcmCompleter GoToDeclaration<CR>

" 不用pylint查错,太可怕..
let g:syntastic_python_checkers = ["pep8", "pyflakes"]
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]

" YCM报错信息
"nmap <F4> :YcmDiags<CR>
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>?'

" pymode 设置
let g:pymode_folding = 0
let g:pymode_warnings = 0
let g:pymode_rope_completion = 0
let g:pymode_lint_write = 0

" pandoc设置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=pandoc
nmap md :!pandoc -s -S --latexmathml % -o %.html <CR><CR>

" js配置
let g:javascript_enable_domhtmlcss = 1
let b:javascript_fold = 'false'
let g:JSLintHighlightErrorLine = 0

" 状态栏设置
let g:Powerline_symbols = 'unicode'
let g:Powerline_stl_path_style = 'short'
let g:Powerline_theme = 'default'

" xdebug调试配置
let g:vdebug_keymap = {}
let g:vdebug_keymap["run"] = '<F5>'
let g:vdebug_keymap["run_to_cursor"] = "<F6>"
let g:vdebug_keymap["step_over"] = "<F7>"
let g:vdebug_keymap["step_into"] = "<F8>"
let g:vdebug_keymap["step_out"] = "<F9>"
let g:vdebug_keymap["step_into"] = "<F8>"
let g:vdebug_keymap["step_out"] = "<F9>"
let g:vdebug_options = {}
let g:vdebug_options["port"] = 8008

" phpcomplete enhanced
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1

" neocompletecache config
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" do not invoke jslint
let b:did_jslint_plugin = 0

" dash 快捷键
nmap <silent> <leader>d <Plug>DashSearch

" pdv php-document config
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-l> :call pdv#DocumentWithSnip()<CR>

" Trigger configuration. Do not use <tab> if you use
au FileType javascript :UltiSnipsAddFiletypes javascript 
au FileType javascript :UltiSnipsAddFiletypes jquery 
au FileType javascript :UltiSnipsAddFiletypes json
au FileType php :UltiSnipsAddFiletypes php 
au FileType php :UltiSnipsAddFiletypes php-symfony2 
au FileType php :UltiSnipsAddFiletypes php-phpunit
au FileType php :UltiSnipsAddFiletypes php-laravel
au FileType python :UltiSnipsAddFiletypes python
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

