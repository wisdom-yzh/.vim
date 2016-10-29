set nocompatible         	" be iMproved, required
syntax on
filetype on
filetype plugin indent on
set foldenable
set foldmethod=indent
set foldlevelstart=99
set cul						" �������������
set shortmess=atI   	 	" ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ
set backspace=2
set helplang=cn
set encoding=utf-8
set number		 	        " ��ʾ�к�
set langmenu=zh_CN.UTF-8 	" ��������
set helplang=cn
set viminfo+=!		 	    " ����ȫ�ֱ���
set iskeyword+=_,$,@,%,#,- 	" �������·��ŵĵ��ʲ�Ҫ�����зָ�
set noeb					" ȥ������������ʾ����
set confirm					" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��
set autoread
set hlsearch				" �������ַ�����
set incsearch
set laststatus=2            " ��ʾ״̬��

" �����ַ�����
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

" ��������
set autoindent				" �Զ�����
set cindent					" Tab���Ŀ��
set expandtab				" �ո����tab
set tabstop=4				" ͳһ����Ϊ4
set softtabstop=4
set shiftwidth=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype phtml setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" leader��λ����
let g:mapleader = ','

" ��ɫ
"syntax enable
"color darkblue
set background=dark
colorscheme solarized

" tab�л�
map <C-j> :tabp<CR>
map <C-k> :tabn<CR>


" �������
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

" �е��ʵ䷭��
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>

" �����б�鿴
let g:Tlist_Show_One_File = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Use_Horiz_Window = 0
let g:Tlist_Enable_Fold_Column = 0

" �ļ��б�鿴
map <F3> <plug>NERDTreeTabsToggle<CR> 
map <F2> :TlistToggle<CR>
map <F1> :!dot -Tpng % > %.png<CR>

" You Complete Me configure
" �Զ���ȫ����
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
" ��ת
nnoremap <C-F12> :YcmCompleter GoToDefinition<CR>
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>
" ������Ϣ
nmap <F4> :YcmDiags<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>?'

" ����pylint���,̫����..
let g:syntastic_python_checkers = ["pep8", "pyflakes"]
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]

" pymode ����
let g:pymode_folding = 0
let g:pymode_warnings = 0
let g:pymode_rope_completion = 0
let g:pymode_lint_write = 0

" pandoc����
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=pandoc
nmap md :!pandoc -s -S --latexmathml --listings % -o %.html <CR><CR>

" js����
let g:javascript_enable_domhtmlcss = 1
let b:javascript_fold = 'false'
let g:JSLintHighlightErrorLine = 0

" ״̬������
let g:Powerline_symbols = 'unicode'
let g:Powerline_stl_path_style = 'short'
let g:Powerline_theme = 'default'

" xdebug��������
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

" dash ��ݼ�
nmap <silent> <leader>d <Plug>DashSearch

" �﷨��ȫ
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
