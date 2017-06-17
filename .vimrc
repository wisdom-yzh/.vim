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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'				
Plugin 'jistr/vim-nerdtree-tabs'			
Plugin 'Syntastic'							
Plugin 'Valloric/YouCompleteMe'		
Plugin 'scrooloose/nerdcommenter'			
Plugin 'taglist-plus'						
Plugin 'vim-airline/vim-airline'
Plugin 'rosenfeld/conque-term'              
Plugin 'delimitMate.vim'					
Plugin 'altercation/vim-colors-solarized'
Plugin 'fugitive.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chazy/cscope_maps'                  
Plugin 'ryanoasis/vim-webdevicons'

" c
Plugin 'c.vim'							    
Plugin 'c-standard-functions-highlight'		

" python
Plugin 'python.vim'							
Plugin 'Python-mode-klen'					

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'

" frontend
Plugin 'pangloss/vim-javascript'			
Plugin 'mxw/vim-jsx'
Plugin 'ternjs/tern_for_vim'
Plugin 'posva/vim-vue'
Plugin 'mattn/emmet-vim'					
Plugin 'cakebaker/scss-syntax.vim'

" php
Plugin 'php.vim-for-php5'					
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'joonty/vdebug'                      

" document
Plugin 'vim-pandoc/vim-pandoc-syntax'		

" FileList & TList
map <F3> <plug>NERDTreeTabsToggle<CR> 
map <F2> :TlistToggle<CR>
let g:Tlist_Show_One_File = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Use_Horiz_Window = 0
let g:Tlist_Enable_Fold_Column = 0

" You Complete Me configure
" autocomplete
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
" jump
nnoremap <C-F12> :YcmCompleter GoToDefinition<CR>
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>
au FileType javascript nnoremap <C-F12> :YcmCompleter GotoReference<CR>
au FileType javascript nnoremap <F12> :YcmCompleter GoTo<CR>

" syntastic checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_exe = "$(npm bin)/eslint"
let g:syntastic_python_checkers = ["pep8", "pyflakes"]

" pymode 设置
let g:pymode_folding = 0
let g:pymode_warnings = 0
let g:pymode_rope_completion = 0
let g:pymode_lint_write = 0

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
let g:jsx_ext_required = 1

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
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
