set nocompatible         	" be iMproved, required
syntax on
filetype on
filetype plugin indent on
set foldenable
set foldmethod=indent
set foldlevelstart=99
set cul						" �������������
set shortmess=atI   	 	" ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ
color darkblue
set backspace=2
set helplang=cn
set encoding=utf-8
set autoindent				" �Զ�����
set cindent					" Tab���Ŀ��
set tabstop=4				" ͳһ����Ϊ4
set expandtab				" �ո����tab
set softtabstop=4
set shiftwidth=4
set number		 	        " ��ʾ�к�
set langmenu=zh_CN.UTF-9 	" ��������
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

" leader��λ����
let g:mapleader = ','

" ͸������
hi Normal ctermbg=NONE
hi Folded ctermbg=NONE ctermfg=3
hi VertSplit ctermfg=gray ctermbg=NONE
hi Comment ctermfg=2
hi Pmenu    ctermfg=0 ctermbg=7
hi PmenuSel ctermfg=7 ctermbg=0
hi Underlined ctermfg=6
"highlight PmenuSel ctermfg=1 ctermbg=6

" tab�л�
map <C-j> :tabp<CR>
map <C-k> :tabn<CR>


" �������
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'						" �������~
"Plugin 'c-standard-functions-highlight'		" ��������~
Plugin 'kien/ctrlp.vim'						" �ļ�����~
Plugin 'scrooloose/nerdtree'				" �ļ��б�~
Plugin 'jistr/vim-nerdtree-tabs'			" �б���ǿ~
Plugin 'taglist-plus'						" �����б�~
Plugin 'rosenfeld/conque-term'              " �ڲ��ն�~
Plugin 'Lokaltog/vim-powerline'             " ״̬����~
"Plugin 'Valloric/YouCompleteMe'				" �Զ���ȫ~
Plugin 'Syntastic'							" ������ʾ~
"Plugin 'bronson/vim-trailing-whitespace'	" ���հ�~
Plugin 'scrooloose/nerdcommenter'			" ����ע��~
Plugin 'delimitMate.vim'					" ���Ų�ȫ~
Plugin 'python.vim'							" дPython~
Plugin 'Python-mode-klen'					" ��Python~
Plugin 'pangloss/vim-javascript'			" JS���ÿ�~
Plugin 'nono/jquery.vim'					" JQ���ÿ�~
Plugin 'ianva/vim-youdao-translater'		" �е��ʵ�~
Plugin 'vim-pandoc/vim-pandoc-syntax'		" ��д�ĵ�~
"Plugin 'KabbAmine/zeavim.vim'				" �鿴Zeal~
Plugin 'php.vim-for-php5'					" ��д��ҳ~
Plugin 'mattn/emmet-vim'					" ��дHTML~
Plugin 'chazy/cscope_maps'                  " �鿴����~
Plugin 'fugitive.vim'                       " �汾����~
Plugin 'joonty/vdebug'                      " PHP����~
"Plugin 'hallettj/jslint.vim'                " js��ǿ~
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

" ������Ի�

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

" YCM�Զ���ȫ����
"let g:ycm_global_ycm_extra_conf =  '~/ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_autoclose_preview_window_after_completion = 0
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_confirm_extra_conf = 0

" YCM��ת
"nnoremap <C-F12> :YcmCompleter GoToDefinition<CR>
"nnoremap <F12> :YcmCompleter GoToDeclaration<CR>

" ����pylint���,̫����..
let g:syntastic_python_checkers = ["pep8", "pyflakes"]
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]

" YCM������Ϣ
"nmap <F4> :YcmDiags<CR>
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>?'

" pymode ����
let g:pymode_folding = 0
let g:pymode_warnings = 0
let g:pymode_rope_completion = 0
let g:pymode_lint_write = 0

" pandoc����
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=pandoc
nmap md :!pandoc -s -S --latexmathml % -o %.html <CR><CR>

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

" dash ��ݼ�
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

