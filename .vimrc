set nocompatible         	" be iMproved, required
syntax on
filetype on
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
highlight Comment ctermfg=2 guifg=SeaGreen


" tab�л�
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>


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
"Plugin 'python.vim'							" дPython~
"Plugin 'Python-mode-klen'					" ��Python~
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
Plugin 'hallettj/jslint.vim'                " js��ǿ~
Plugin 'neocomplcache'
Plugin 'rizzatti/dash.vim'
Plugin 'shawncplus/phpcomplete.vim'

"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

" ������Ի�

" �е��ʵ䷭��
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>

" �ļ��б�鿴
map <F3> <plug>NERDTreeTabsToggle<CR>

" �����б�鿴
let g:Tlist_Show_One_File = 1
let g:Tlist_Use_Right_Window = 1
map <F9> :TlistToggle<CR>

" YCM�Զ���ȫ����
let g:ycm_global_ycm_extra_conf =  '~/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" YCM��ת
nnoremap <C-F12> :YcmCompleter GoToDefinition<CR>
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>

" ����pylint���,̫����..
let g:syntastic_python_checkers = ["pep8", "pyflakes"]

" YCM������Ϣ
nmap <F4> :YcmDiags<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>?'

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

" xdebug��������
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000

" neocompletecache����
let g:neocomplcache_enable_at_startup = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" �Զ��رղ�ȫ����
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest


" Define dictionary. 
let g:neocomplcache_dictionary_filetype_lists = { 
    \ 'default' : '', 
    \ 'vimshell' : $HOME.'/.vimshell_hist', 
    \ 'scheme' : $HOME.'/.gosh_completions', 
    \ 'css' : $VIMFILES.'/dict/css.dic', 
    \ 'php' : $VIMFILES.'/dict/php.dic', 
    \ 'javascript' : $VIMFILES.'/dict/javascript.dic' 
    \ }

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

" <TAB>: completion. THIS HAS NO USE WHEN WITH SNIPMATE
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>""

" dash ��ݼ�
nmap <silent> <leader>d <Plug>DashSearch
