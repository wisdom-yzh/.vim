set nocompatible         	" be iMproved, required
syntax on
filetype on
filetype plugin indent on
set foldenable
set foldmethod=indent
set foldlevelstart=99
set cul						" 高亮光标所在行
set shortmess=atI   	 	" 启动的时候不显示那个援助乌干达儿童的提示
set backspace=2
set helplang=cn
set encoding=utf-8
set number		 	        " 显示行号
set langmenu=zh_CN.UTF-8 	" 语言设置
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

" 设置缩进
set autoindent				" 自动缩进
set cindent					" Tab键的宽度
set expandtab				" 空格代替tab
set tabstop=4				" 统一缩进为4
set softtabstop=4
set shiftwidth=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype phtml setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" leader键位设置
let g:mapleader = ','

" 配色
"syntax enable
"color darkblue
set background=dark
colorscheme solarized

" tab切换
map <C-j> :tabp<CR>
map <C-k> :tabn<CR>


" 插件管理
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'						
Plugin 'c-standard-functions-highlight'		
Plugin 'kien/ctrlp.vim'						
Plugin 'c.vim'							    
Plugin 'scrooloose/nerdtree'				
Plugin 'jistr/vim-nerdtree-tabs'			
Plugin 'taglist-plus'						
Plugin 'rosenfeld/conque-term'              
Plugin 'Lokaltog/vim-powerline'             
Plugin 'Valloric/YouCompleteMe'		
Plugin 'Syntastic'							
Plugin 'scrooloose/nerdcommenter'			
Plugin 'delimitMate.vim'					
Plugin 'python.vim'							
Plugin 'Python-mode-klen'					
Plugin 'pangloss/vim-javascript'			
Plugin 'nono/jquery.vim'					
Plugin 'ianva/vim-youdao-translater'		
Plugin 'vim-pandoc/vim-pandoc-syntax'		
Plugin 'mattn/emmet-vim'					
Plugin 'chazy/cscope_maps'                  
Plugin 'fugitive.vim'                       
Plugin 'joonty/vdebug'                      
Plugin 'rizzatti/dash.vim'
Plugin 'altercation/vim-colors-solarized'

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'

" for js
Plugin 'ternjs/tern_for_vim'

" for php
Plugin 'php.vim-for-php5'					
Plugin 'shawncplus/phpcomplete.vim'

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
map <F1> :!dot -Tpng % > %.png<CR>

" You Complete Me configure
" 自动补全设置
let g:ycm_global_ycm_extra_conf =  '~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = []
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
" 跳转
nnoremap <C-F12> :YcmCompleter GoToDefinition<CR>
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>
" 报错信息
nmap <F4> :YcmDiags<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>?'

" 不用pylint查错,太可怕..
let g:syntastic_python_checkers = ["pep8", "pyflakes"]
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]

" pymode 设置
let g:pymode_folding = 0
let g:pymode_warnings = 0
let g:pymode_rope_completion = 0
let g:pymode_lint_write = 0

" pandoc设置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=pandoc
nmap md :!pandoc -s -S --latexmathml --listings % -o %.html <CR><CR>

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
let g:vdebug_options = {}
let g:vdebug_options["port"] = 8008

" phpcomplete enhanced
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1

" dash 快捷键
nmap <silent> <leader>d <Plug>DashSearch

" 语法补全
" pdv php-document config
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
nnoremap <C-l> :call pdv#DocumentWithSnip()<CR>
" Trigger configuration. Do not use <tab> if you use
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au FileType javascript :UltiSnipsAddFiletypes javascript
au FileType javascript :UltiSnipsAddFiletypes javascript-angular
au FileType javascript :UltiSnipsAddFiletypes javascript-node
au FileType javascript :UltiSnipsAddFiletypes json
au FileType php :UltiSnipsAddFiletypes php 
au FileType php :UltiSnipsAddFiletypes php-symfony2 
au FileType php :UltiSnipsAddFiletypes php-phpunit
au FileType php :UltiSnipsAddFiletypes php-laravel
au FileType python :UltiSnipsAddFiletypes python
au FileType c :UltiSnipsAddFiletypes c
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
