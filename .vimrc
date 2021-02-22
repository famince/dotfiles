" General Setting {
  let mapleader= ","

  imap jk <ESC>
  map ls :ls<CR>

  set encoding=utf8

  set regexpengine=1
  set lazyredraw          "open it when vim run slow

  syntax on               "语法高亮度显示

  set number              "显示行号
  "set relativenumber      "设置相对行号
  set expandtab           "展开tab为空格
  set autoindent          "自动格式对齐
  set smartindent         "智能选择对齐方式
  set softtabstop=8       "设置tab键为n个空格
  set shiftwidth=4        "设置当行之间交错时使用n个空格
  set showmatch           "设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
  set vb t_vb=            "当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
  set ruler               "在编辑过程中，在右下角显示光标位置的状态行
  set incsearch           "增量搜索
  set hlsearch            "高亮搜索结果
  "set nohl               "取消搜索结果高亮
  set backspace=2         " make backspace work like most other apps
  "set backspace=indent,eol,starta " Alternately
  set clipboard+=unnamed  "同window 共享剪贴板

  "全局检索光标下字符
  "autocmd filetype qf wincmd J         "全屏显示quickfix
  nnoremap <leader>f :vimgrep /\<<c-r><c-w>\>/j **/*.c **/*.cpp **/*.h <Bar> :copen <CR>


  " 用空格键来开关折叠
  set foldenable
  "set foldmethod=manual
  "set foldmethod=syntax
  set foldmethod=indent
  "set foldlevel=1
  "It declares an automatic command (au), triggered when a buffer is read
  "(BufRead), matching all files (*) and executes the zR (opens all folds)
  "command in normal mode.
  au BufRead * normal zR

  nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

  " hightlight col and line
  set cursorline
  set cursorcolumn

  " colorscheme {
    " cd ~/.vim;mkdir colors;cp ~/.vim/bundle/vim-colorschemes/colors/solarized.vim ~/.vim/colors/
    syntax enable
    let g:solarized_termcolors=256
    set t_Co=256
    "set background=dark
    colorscheme solarized
  " }

  " remember the line i was on when reopen file
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif

  " Every time the user issues a :w command, Vim will automatically remove all
  " trailing whitespace before saving.
  "autocmd BufWritePre * %s/\s\+$//e
" }


" plugin setting {
  " vundle setting {
    set nocompatible        " be iMproved, required
    filetype off            " require

    " set the runtime path to include Vundle and initialize
      set rtp+=~/.vim/bundle/Vundle.vim
      call vundle#begin()
      " alternatively, pass a path where Vundle should install plugins
      "call vundle#begin('~/some/path/here')

      " let Vundle manage Vundle, required
      Plugin 'VundleVim/Vundle.vim'

      "Plugin 'altercation/vim-colors-solarized'
      Plugin 'flazz/vim-colorschemes'

      Plugin 'easymotion/vim-easymotion'

      Plugin 'scrooloose/nerdtree'
      Plugin 'Xuyuanp/nerdtree-git-plugin'

      Plugin 'ctrlpvim/ctrlp.vim'

      Plugin 'majutsushi/tagbar'

      "Plugin 'Valloric/YouCompleteMe'

      Plugin 'terryma/vim-multiple-cursors'

      Plugin 'tpope/vim-rails'

      Plugin 'dkprice/vim-easygrep'

      Plugin 'iamcco/dict.vim'

      Plugin 'ludovicchabant/vim-gutentags'

      "Plugin 'MarcWeber/vim-addon-mw-utils'
      "Plugin 'tomtom/tlib_vim'
      "Plugin 'garbas/vim-snipmate'
      " Optional:
      "Plugin 'honza/vim-snippets'    "contain much languages snippets templates

      " Align text on an equal sign
      " http://stackoverflow.com/questions/8964953/align-text-on-an-equal-sign-with-vim
      Plugin 'godlygeek/tabular'

      "git plugin
      Plugin 'tpope/vim-fugitive'

      Plugin 'Lokaltog/vim-powerline'

      " All of your Plugins must be added before the following line
      call vundle#end()            " required
      filetype plugin indent on    " required
      " To ignore plugin indent changes, instead use:
      "filetype plugin on
      "
      " Brief help
      " :PluginList       - lists configured plugins
      " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
      " :PluginSearch foo - searches for foo; append `!` to refresh local cache
      " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
      "
      " see :h vundle for more details or wiki for FAQ
      " Put your non-Plugin stuff after this line
    " }
  " }

  " easymotion setting {
    "hi link EasyMotionTarget ErrorMsg
    "hi link EasyMotionShade  Comment
    hi link EasyMotionTarget Search
    hi link EasyMotionTarget2First Search
    hi link EasyMotionTarget2Second Search
    hi link EasyMotionShade Comment

    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    let g:EasyMotion_smartcase = 1

    nmap s <Plug>(easymotion-overwin-f2)

    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
  " }

  " ctrlp setting {
    " ctrl + p
    "let g:ctrlp_map = '<c-p>'
    "let g:ctrlp_cmd = 'CtrlP'
    "Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore:
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

    "unlet g:ctrlp_custom_ignore
    "unlet g:ctrlp_user_command
    "let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    "let g:ctrlp_custom_ignore = {
    "      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    "      \ 'file': '\v\.(exe|so|dll)$',
    "      \ 'link': 'some_bad_symbolic_links',
    "      \ }

    "let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
  " }

  " tagbar setting {
    " ctrl + p
    "let g:ctrlp_map = '<c-p>'
    "let g:ctrlp_cmd = 'CtrlP'
    "nmap <F8> :TagbarToggle<CR>
    nnoremap <silent> <leader>tt :TagbarToggle<CR>

    "生成一个tags文件
    nmap <F9> <Esc>:!ctags -R *<CR>
  " }

  " NerdTree setting{
    "set runtimepath^=~/.vim/bundle/nerdtree
    "   nmap <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        map <C-e> :NERDTreeToggle<CR>

        "close vim if the only window left open is a NERDTree?
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
        "nmap <leader>nt :NERDTreeFind<CR>
        "nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  " }

  " dict setting{
    nmap <silent> <Leader>d <Plug>DictSearch
    vmap <silent> <Leader>d <Plug>DictVSearch
  " }

  " snipmate setting {
    let g:snipMate = {}
    let g:snipMate.scope_aliases = {}
    let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
  " }

  " Tabular setting {
  if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /=>\zs<CR>
    vmap <Leader>a: :Tabularize /=>\zs<CR>
  endif
  " }

  " 文件过大; 大于200 KB(大小可以自己设定)
  let g:LargeFile = 1024 * 200
  augroup LargeFile
    "autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
  augroup END

    function LargeFile()
      " no syntax highlighting etc
      set eventignore+=FileType
      " save memory when other file is viewed
      setlocal bufhidden=unload
      " is read-only (write with :w new_filename)
      setlocal buftype=nowrite
      " no undo possible
      setlocal undolevels=-1
      " display message
      autocmd VimEnter * echo "The file is larger than " . (g:LargeFile / 1024) . " KB, so some options are changed (see .vimrc for details)."
    endfunction

  " powerline setting {
    set nocompatible   " Disable vi-compatibility
    set laststatus=2   " Always show the statusline
    set encoding=utf-8 " Necessary to show Unicode glyphs
    set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
  " }

" }

