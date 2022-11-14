let g:ale_disable_lsp = 1 
" vimplug {
function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
    " Plugins will be downloaded under the specified directory.
    call plug#begin('~/.vim/plugged')
    " Declare the list of plugins.
    " Plug 'MarcWeber/vim-addon-mw-utils'
    " Plug 'tomtom/tlib_vim' "Some utility functions for VIM
    " Plug 'voldikss/vim-floaterm'
    Plug 'mileszs/ack.vim' , { 'on': [] }
    " 'on':[] 在 vim-plug 中表示不加载该插件
    Plug 'junegunn/fzf.vim' , { 'on': [] }
    " Plug 'ludovicchabant/vim-gutentags' , { 'on': [] } "A Vim plugin that manages your tag files
    Plug 'kshenoy/vim-signature' , { 'on': [] } "Plugin to toggle, display and navigate marks
    Plug 'luochen1990/rainbow'
    Plug 'sainnhe/gruvbox-material'
    Plug 'rhysd/conflict-marker.vim'
    Plug 'jiangmiao/auto-pairs', { 'on': [] }
    Plug 'airblade/vim-gitgutter' , { 'on': [] } " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
    Plug 'vim-scripts/restore_view.vim', { 'on': [] }
    Plug 'alfredodeza/jacinto.vim', { 'for': 'json' }
    Plug 'tpope/vim-commentary'  , { 'on': [] } "comment stuff out
    Plug 'preservim/vimux'
    Plug 'sebdah/vim-delve'
    Plug 'tyru/undoclosewin.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale' , { 'on': [] }
    Plug 'elixir-editors/vim-elixir'
    Plug 'blueyed/vim-diminactive'
    " Plug 'tweekmonster/startuptime.vim'
    Plug 'vim-airline/vim-airline'
    " Plug 'mhinz/vim-startify'
    Plug 'sukima/vim-tiddlywiki'
    Plug 'chrisbra/csv.vim'
    Plug 'ruanyl/vim-gh-line'
    Plug 'Vimjas/vim-python-pep8-indent'
    if has('nvim')
        Plug 'j-hui/fidget.nvim'
        Plug 'kyazdani42/nvim-web-devicons'
        Plug 'goolord/alpha-nvim'
        Plug 'neovim/nvim-lspconfig'
        Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
        Plug 'ray-x/navigator.lua'
        Plug 'krivahtoo/silicon.nvim', { 'do': './install.sh' }
        Plug 'p00f/nvim-ts-rainbow'
        Plug 'APZelos/blamer.nvim'
        Plug 'folke/twilight.nvim'
        Plug 'andymass/vim-matchup'
        Plug 'JoosepAlviste/nvim-ts-context-commentstring'
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
        Plug 'romgrk/nvim-treesitter-context'
        " dependencies
        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-lua/plenary.nvim'
        " telescope
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'bfredl/nvim-miniyank'
        Plug 'sbdchd/neoformat'
    endif
    Plug 'mbbill/undotree'

    " List ends here. Plugins become visible to Vim after this call.
    call plug#end()


    " 1500 毫秒后调用 LoadPlug，且只调用一次, 见 `:h timer_start()`
    call timer_start(2000, 'LoadPlug')
    function! LoadPlug(timer) abort
      " 手动加载
      call plug#load('ack.vim')
      call plug#load('auto-pairs')
      call plug#load('fzf.vim')
      call plug#load('vim-signature')
      call plug#load('vim-gitgutter')
      call plug#load('vim-commentary')
      call plug#load('ale')
    endfunction
"}

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/zsh
        endif
    " }

    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }

" }

" Use bundles config {
    " if filereadable(expand("~/.vimrc.bundles"))
    "     source ~/.vimrc.bundles
    " endif
" }
"
" General {

    set background=dark         " Assume a dark background

    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8
    set fileencodings=utf-8,gb18030,gbk,gb2312,big5,ucs-bom,utf-8,cp936
    set termencoding=utf-8
    let &termencoding=&encoding

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    " au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " autocmd Filetype gitcommit setlocal spell textwidth=72

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    " To disable this, add the following to your .vimrc.before.local file:
    "   let g:spf13_no_restore_cursor = 1
    if !exists('g:spf13_no_restore_cursor')
        function! ResCur()
            if line("'\"") <= line("$")
                normal! g`"
                return 1
            endif
        endfunction

        augroup resCur
            autocmd!
            autocmd BufWinEnter * call ResCur()
        augroup END
    endif

    " Setting up the directories {
        set backup                  " Backups are nice ...
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

        " To disable views add the following to your .vimrc.before.local file:
        "   let g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    " }

" }

" Vim UI {
    " let g:gruvbox_contrast_dark = 'soft'
    " let g:gruvbox_contrast_light = 'soft'
    " let g:gruvbox_italic = 1
    " let g:gruvbox_italicize_strings = 1
    "
    "
    let g:gruvbox_material_background = 'soft'
    set background=dark
    let g:gruvbox_material_enable_italic = 1
    let g:gruvbox_material_disable_italic_comment = 0
    let g:gruvbox_material_enable_bold = 1
    let g:gruvbox_material_visual = 'reverse'
    let g:gruvbox_material_diagnostic_line_highlight = 1
    let g:gruvbox_material_current_word = 'bold'
    let g:gruvbox_material_better_performance = 1
    color gruvbox-material "solarized             " Load a colorscheme

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=1

        " Broken down into easily includeable segments
        " set statusline+=%F
        set statusline=%<%f\                     " Filename
        " set statusline=$<%F\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        " set statusline+=\ [%{&ff}/%Y]            " Filetype
        " set statusline+=\ [%!{getcwd()}]          " Current dir
        set statusline+=%{expand('%:p:h:t')}/%t
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info


    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    "set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

" Formatting {

    set autoread "set to auto read when a file is changed from the outside
    set wildignore=*.o,*~,*.pyc " Ignore compiled files
    set wrap
    setlocal wrap
    "set textwidth=30
    "set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    "set columns=57
    set expandtab                   " Tabs are spaces, not tabs
    set smarttab
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.before.local file:
    autocmd FileType c,cpp,java,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    " autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now.

    " autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Workaround vim-commentary for Haskell
    " autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    " autocmd FileType haskell,rust setlocal nospell

" }

" Key (re)Mappings {

    " The default leader is '\', but many people prefer ',' as it's in a standard
    " location. To override this behavior and set it back to '\' (or any other
    " character) add the following to your .vimrc.before.local file:
    let mapleader = ' '

    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    " If you prefer that functionality, add the following to your
    " .vimrc.before.local file:
    "   let g:spf13_no_easyWindows = 1
    " if !exists('g:spf13_no_easyWindows')
    "     map <C-J> <C-W>j<C-W>_
    "     map <C-K> <C-W>k<C-W>_
    "     map <C-L> <C-W>l<C-W>_
    "     map <C-H> <C-W>h<C-W>_
    " endif

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " End/Start of line motion keys act relative to row/wrap width in the
    " presence of `:set wrap`, and relative to line for `:set nowrap`.
    " Default vim behaviour is to act relative to text line in both cases
    " If you prefer the default behaviour, add the following to your
    " .vimrc.before.local file:
    "   let g:spf13_no_wrapRelMotion = 1
    if !exists('g:spf13_no_wrapRelMotion')
        " Same for 0, home, end, etc
        function! WrapRelativeMotion(key, ...)
            let vis_sel=""
            if a:0
                let vis_sel="gv"
            endif
            if &wrap
                execute "normal!" vis_sel . "g" . a:key
            else
                execute "normal!" vis_sel . a:key
            endif
        endfunction

        " Map g* keys in Normal, Operator-pending, and Visual+select
        noremap $ :call WrapRelativeMotion("$")<CR>
        noremap <End> :call WrapRelativeMotion("$")<CR>
        noremap 0 :call WrapRelativeMotion("0")<CR>
        noremap <Home> :call WrapRelativeMotion("0")<CR>
        noremap ^ :call WrapRelativeMotion("^")<CR>
        " Overwrite the operator pending $/<End> mappings from above
        " to force inclusive motion with :execute normal!
        onoremap $ v:call WrapRelativeMotion("$")<CR>
        onoremap <End> v:call WrapRelativeMotion("$")<CR>
        " Overwrite the Visual+select mode mappings from above
        " to ensure the correct vis_sel flag is passed to function
        vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
        vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
        vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
        vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
        vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>
    endif

    " Stupid shift key fixes
    if !exists('g:spf13_no_keyfixes')
        if has("user_commands")
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>
        endif

        cmap Tabe tabe
    endif

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    "go to first and last char of line
    nnoremap H ^
    nnoremap L g_
    vnoremap H ^
    vnoremap L g_


    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " and ask which one to jump to

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Easier formatting
    nnoremap <silent> <leader>q gwip
" }

" Plugins {
    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        " let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        " if gitroot != ''
        "     let &tags = &tags . ',' . gitroot . '/.git/tags'
        " endif
    " }

    " NerdTree {
        " if isdirectory(expand("~/.vim/bundle/nerdtree"))
        "     map <C-e> <plug>NERDTreeTabsToggle<CR>
        "     map <leader>w :NERDTreeFind<CR>
        "     nmap <leader>nt :NERDTreeFind<CR>

        "     let NERDTreeShowBookmarks=1
        "     let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        "     let NERDTreeChDirMode=0
        "     let NERDTreeQuitOnOpen=1
        "     let NERDTreeMouseMode=2
        "     let NERDTreeShowHidden=1
        "     let NERDTreeKeepTreeInNewTab=1
        "     let g:nerdtree_tabs_open_on_gui_startup=0
        " endif
    " }

        " UndoTree {
        " if isdirectory(expand("~/.vim/bundle/undotree/"))
        "     nnoremap <Leader>u :UndotreeToggle<CR>
        "     " If undotree is opened, it is likely one wants to interact with it.
        "     let g:undotree_SetFocusWhenToggle=1
        " endif
        " }

        " Functions {

        " Initialize directories {
        function! InitializeDirectories()
            let parent = $HOME
            let prefix = 'vim'
            let dir_list = {
                        \ 'backup': 'backupdir',
                        \ 'views': 'viewdir',
                        \ 'swap': 'directory' }

            let dir_list['undo'] = 'undodir'

            " To specify a different directory in which to place the vimbackup,
            " vimviews, vimundo, and vimswap files/directories, add the following to
            " your .vimrc.before.local file:
            "   let g:spf13_consolidated_directory = <full path to desired directory>
            "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
            if exists('g:spf13_consolidated_directory')
                let common_dir = g:spf13_consolidated_directory . prefix
            else
                let common_dir = parent . '/.' . prefix
            endif

            for [dirname, settingname] in items(dir_list)
                let directory = common_dir . dirname . '/'
                if exists("*mkdir")
                    if !isdirectory(directory)
                        call mkdir(directory)
                    endif
                endif
                if !isdirectory(directory)
                    echo "Warning: Unable to create backup directory: " . directory
                    echo "Try: mkdir -p " . directory
                else
                    let directory = substitute(directory, " ", "\\\\ ", "g")
                    exec "set " . settingname . "=" . directory
                endif
            endfor
        endfunction
        call InitializeDirectories()
        " }

        " Initialize NERDTree as needed {
        function! NERDTreeInitAsNeeded()
            redir => bufoutput
            buffers!
            redir END
            let idx = stridx(bufoutput, "NERD_tree")
            if idx > -1
                NERDTreeMirror
                NERDTreeFind
                wincmd l
            endif
        endfunction
        " }

        " Strip whitespace {
        function! StripTrailingWhitespace()
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endfunction
        " }

        " Shell command {
        function! s:RunShellCommand(cmdline)
            botright new

            setlocal buftype=nofile
            setlocal bufhidden=delete
            setlocal nobuflisted
            setlocal noswapfile
            setlocal wrap
            set wrap
            "set textwidth=30
            "set columns=57
            "setlocal nowrap
            setlocal filetype=shell
            setlocal syntax=shell

            call setline(1, a:cmdline)
            call setline(2, substitute(a:cmdline, '.', '=', 'g'))
            execute 'silent $read !' . escape(a:cmdline, '%#')
            setlocal nomodifiable
            1
        endfunction

        command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
        " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
        " }

        highlight ExtraWhitespace ctermbg=red guibg=red
        match ExtraWhitespace /\s\+$/

        set clipboard=unnamedplus
       set clipboard+=unnamed


        "编译运行
        func! CompileRun()
            exec "w"
            if &filetype == 'c'
                exec "!gcc -g %  -DLOCAL_PROJECT -Wall && ./a.out"
            elseif &filetype == 'cpp'
                exec "!g++ -g % -DLOCAL_PROJECT -Wall -std=c++11  && ./a.out"
            elseif &filetype == 'exs'
                exec "!elixir %"
            elseif &filetype == 'elixir'
                exec "!elixir %"
            elseif &filetype == 'sh'
                exec "te bash %"
            elseif &filetype == 'python'
                exec "te python3 %"
            elseif &filetype == 'ruby'
                exec "!ruby %"
            elseif &filetype == 'lua'
                exec "!lua %"
            elseif @%[-8:] == "_test.go"
                exec "te go test -v"
            elseif &filetype == 'go'
                exec "te go run %"
            elseif &filetype == 'html'
                exec "!/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %"
            elseif &filetype == 'java'
                exec "!javac %"
                exec "!java %<"
            elseif &filetype == 'haskell'
                exec "!ghc --make %"
                exec "! ./%<"
            endif
        endfunc

        nnoremap <leader>u :GundoToggle<CR>

        "Run make
        func! RunMake()
            exec "w"
            exec "!make"
        endfunc
        nmap <leader>m : call RunMake()<CR>

        imap （ (
        imap ） )
        imap 』 }
        imap 『 {
        imap 【 [
        imap 】 ]
        imap 。 .
        imap ， ,
        imap ； ;
        imap ： :
        imap “ "
        imap ” "
        imap ‘ '
        imap ’ '
        imap ？ ?
        imap ！ !
        imap 》 >
        imap 《 <
        imap 、 /
        imap ￥ $
        map ： :


au BufWritePost *
            \ if getline(1) =~ "^#!/bin/[a-z]*sh" |
            \   exe "silent !chmod a+x <afile>" |
            \ endif


let g:rainbow_active = 1
	let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}


let g:go_fmt_fail_silently = 0
let g:syntastic_go_checkers = ['go']
let g:go_auto_type_info = 1
let g:go_fmt_command = "gofmt"
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_dispatch_enabled = 1 " vim-dispatch needed
" let g:go_metalinter_autosave = 1 
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'test', 'testify']
let g:go_metalinter_deadline = "25s"
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'test', 'testify'] "
let g:go_term_enabled = 1
let g:go_term_mode = "vertical"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1

set modifiable
set autowrite

" let g:tagbar_type_go = {
"     \ 'ctagstype' : 'go',
"     \ 'kinds'     : [
"         \ 'p:package',
"         \ 'i:imports:1',
"         \ 'c:constants',
"         \ 'v:variables',
"         \ 't:types',
"         \ 'n:interfaces',
"         \ 'w:fields',
"         \ 'e:embedded',
"         \ 'm:methods',
"         \ 'r:constructor',
"         \ 'f:functions'
"     \ ],
"     \ 'sro' : '.',
"     \ 'kind2scope' : {
"         \ 't' : 'ctype',
"         \ 'n' : 'ntype'
"     \ },
"     \ 'scope2kind' : {
"         \ 'ctype' : 't',
"         \ 'ntype' : 'n'
"     \ },
"     \ 'ctagsbin'  : 'gotags',
"     \ 'ctagsargs' : '-sort -silent'
" \ }


set lazyredraw
set ttyfast

set wrap
set ic
set iskeyword-=.
set iskeyword+=-


syntax on

"gutentags {
    " gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.project', '.deps', '.apps', "grab-x", "go"]
    " 所生成的数据文件的名称 "
    let g:gutentags_ctags_tagfile = '.tags'
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    " 配置 ctags 的参数 "
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"}


"JSON {
    au! BufRead,BufNewFile *.json set filetype=json
    augroup json_autocmd
      autocmd!
      autocmd FileType json set autoindent
      autocmd FileType json set formatoptions=tcq2l
      autocmd FileType json set textwidth=78 shiftwidth=2
      autocmd FileType json set softtabstop=2 tabstop=8
      autocmd FileType json set expandtab
      autocmd FileType json set foldmethod=syntax
    augroup END
    nnoremap <leader>vj :Jacinto validate<CR>
    nnoremap <leader>fj :Jacinto format<CR>

"}

hi CursorLine gui=underline cterm=underline
hi CursorLine term=bold cterm=bold guibg=Grey28
" hi CursorLine   cterm=NONE ctermbg=Cyan ctermfg=NONE guibg=NONE guifg=NONE
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"
"

nnoremap <leader>; :

set rtp+=/usr/local/opt/fzf
nnoremap <leader>o :FZF<CR>

" grep{
    command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw(<q-args>, <bang>0) 
    "TODO: Want to use path but fail
    " let &path .= system("git rev-parse --show-toplevel | tr -d '\\n'") . "/**" . " ./**"
    "It's used to override the command that is used when you run Vim's :grep command. See :help 'grepprg'
    " let &grepprg = "ag --ignore wiki --ignore tests --ignore swagger --ignore mocks"
    " let gitdir = system("git status >/dev/null 2>&1 && realpath --relative-to=./ \"$(git status >/dev/null 2>&1 && git rev-parse --show-toplevel )\" && echo '/**' './**'" )
    " let gitdir = "grab-x"

    let gitdir = system("findGORootPath" )
    nnoremap <Leader>f :execute 'Ag --nogroup --ignore wiki --ignore vendor --ignore tests --ignore swagger --ignore mocks <C-R><C-W> ' . gitdir<CR>
    autocmd FileType go nnoremap <Leader>t :execute 'Ag --nogroup --ignore vendor --ignore wiki --ignore tests --ignore swagger --ignore "*mock*" "func.*?' . '\b<C-R><C-W>\(" ' . gitdir<CR>
"}
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
" ale{
    let g:ale_go_golangci_lint_executable = "/usr/local/bin/golangci-lint"

    "'go vet',
    " 
    let g:ale_linters = {'go': ['go build','golangci-lint']}
    " nnoremap <leader>s :let g:ale_linters = {'go': ['golangci-lint',  'go build']}
    let g:ale_go_golangci_lint_options = ' --fast '
    let g:ale_go_golangci_lint_package=1 "wait for https://github.com/dense-analysis/ale/pull/2879/files
    " let g:ale_go_golangci_lint_executable    
    let g:ale_completion_delay = 1500
    let g:ale_echo_delay = 50
    let g:ale_lint_delay = 50
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'
    let g:ale_lint_on_text_changed = 'normal'

    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options = ''

    " Error and warning signs.
    let g:ale_sign_error = '💢'
    let g:ale_sign_warning = '💥'
    let g:ale_cpp_cppcheck_options = ''
    let g:ale_set_highlights = 1
    let g:ale_set_signs = 1
    let g:ale_echo_cursor = 1
    let g:ale_virtualtext_cursor = 1
    let g:ale_virtualtext_delay=100
    let g:ale_virtualtext_prefix = "   🤮"
    " let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 0
    " not support on nvim
    " let g:ale_floating_preview= 1
    " let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

    " Write this in your vimrc file
    " let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 1
    " You can disable this option too
    " if you don't want linters to run on opening a file
    let g:ale_lint_on_enter = 0
"}
"
" Enable autosave plugin
let g:auto_save = 1
"let g:auto_save_events = ["CursorHold"]

" Only save in Normal mode periodically. If the value is changed to '1',
" then changes are saved when you are in Insert mode too, as you type, but
" I would say prefer not save in Insert mode
let g:auto_save_in_insert_mode = 0

" Silently autosave. If you disable this option by changing value to '0',
" then in the vim status, it will display "(AutoSaved at <current time>)" all
" the time, which might get annoying
let g:auto_save_silent = 0

" And now turn Vim swapfile off
set noswapfile
map <c-d> <nop>

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/templates/skeleton.sh
  augroup END
endif

function! GetJumps()
    redir => cout
    silent jumps
    redir END
    return reverse(split(cout, "\n")[1:])
endfunction

function! GoToJump(jump)
    let jumpnumber = split(a:jump, '\s\+')[0]
    execute "normal " . jumpnumber . "\<c-o>"
endfunction

command! Jumps call fzf#run(fzf#wrap({
            \ 'source': GetJumps(),
            \ 'sink': function('GoToJump')}))

nmap <Leader>j :call fzf#run(fzf#wrap({
            \ 'source': GetJumps(),
            \ 'sink': function('GoToJump')})) <CR>

if (has("termguicolors"))
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" enable italic in vim
" :help i_CTRL-V to input this
set t_ZH=[3m
set t_ZR=[23m



"==========================
"vim  windown manaement
"==========================
" Zoom / Restore window.
function! s:Zoom() abort
    " resize
    " vertical resize
    exe "normal \<C-W>\|"
    exe "normal \<C-W>\_"
endfunction
command! Zoom call s:Zoom()

nnoremap <C-w>1 1gt
nnoremap <C-w>2 2gt
nnoremap <C-w>3 3gt
nnoremap <C-w>4 4gt
nnoremap <C-w>5 5gt
nnoremap <C-w>6 6gt
nnoremap <C-w>p gT
nnoremap <C-w>n gt
nnoremap <C-w>x :tabclose

nnoremap <C-w>z :Zoom<CR>
nnoremap <silent> <C-w>[ :wincmd W <bar> :Zoom<CR>
nnoremap <silent> <C-w>] :wincmd w <bar> :Zoom<CR>
set colorcolumn=

"==========================
" COC vim
"==========================
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)



"==========================
" airline
"==========================
let g:airline#extensions#ale#enabled = 1
let g:airline_experimental = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline_section_a       = 'mode'
let g:airline_section_b =  fnamemodify(getcwd(), ':t')

let g:airline#extensions#vimagit#enabled = 0
let g:airline#extensions#branch#enabled = 0

let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#default#layout = [
            \ [ 'a',  'b', 'c' ],
            \ [  'x', 'z', 'error', 'warning' ]
            \ ]


let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#hunks#coc_git = 0

"https://github.com/ludovicchabant/vim-gutentags/issues/88
function! ShouldEnableGutentags(path) abort
	return fnamemodify(a:path, ':e') != 'go'
endfunction
let g:gutentags_enabled_user_func = 'ShouldEnableGutentags'
nnoremap <Leader>s :execute 'Ag --nogroup --ignore wiki --ignore tests --ignore swagger --ignore mocks <C-R><C-W> ' . gitdir<CR>
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1

highlight Comment cterm=italic

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <C-o> <C-o>zz
nnoremap <C-t> <C-t>zz
nnoremap <C-i> <C-i>zz
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"""don't show buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
"""

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

map <Leader>b :DlvAddBreakpoint<CR>
let g:delve_breakpoint_sign="💥"
let g:delve_use_vimux=1


"============================= neoVim =========================
if has('nvim')
    set inccommand=nosplit
    map p <Plug>(miniyank-autoput)
    map P <Plug>(miniyank-autoPut)
    map <leader>n <Plug>(miniyank-cycle)
    map <leader>N <Plug>(miniyank-cycleback)
    let g:miniyank_filename = $HOME."/.miniyank.mpack"
    map <Leader>tc <Plug>(miniyank-tochar)
    map <Leader>tl <Plug>(miniyank-toline)
    map <Leader>tb <Plug>(miniyank-toblock)
    let g:blamer_enabled = 0
    let g:blamer_template = '<commit-short> <committer> <summary> '
endif

"============================= neoVim =========================
"
" Stop looping the search
set nowrapscan

hi LineNr ctermbg=241 guifg=#665c54
let g:ftplugin_sql_omni_key = '<Plug>DisableSqlOmni'
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
let g:coc_disable_transparent_cursor = 1
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

"============================= shortcuts =========================
" https://github.com/sunaku/vim-shortcut
set runtimepath+=~/vim-shortcut
runtime plugin/shortcut.vim

Shortcut (GOTO) go to github/gitlab repo line
      \ nnoremap <silent> <Space>gh :GH <CR>
Shortcut (GOTO) blame github/gitlab repo line
      \ nnoremap <silent> <Space>gb :GB <CR>
Shortcut (GOTO) repo view
      \ nnoremap <silent> <Space>go :GO <CR>

Shortcut (telescope) UI
      \ nnoremap <silent> <Space>tt :Telescope<CR>
Shortcut (telescope) live grep of files
      \ nnoremap <silent> <Space>ff :lua require('telescope.builtin').find_files()<CR>
Shortcut (telescope) live grep of contents
      \ nnoremap <silent> <Space>fg :lua require('telescope.builtin').live_grep()<CR>
Shortcut (telescope) live grep of buffers
      \ nnoremap <silent> <Space>fb :lua require('telescope.builtin').buffers()<CR>
Shortcut (telescope) live grep of tags
      \ nnoremap <silent> <Space>ft :lua require('telescope.builtin').help_tags()<CR>

Shortcut (Twilight) Twilight trigger
      \ nnoremap <silent> <Space>tw :Twilight<CR>


Shortcut (Nvim Fold) Unfold one under the cursor
      \ nmap <silent> zo zo
Shortcut (Nvim Fold) Unfold all under the cursor recursively
      \ nmap <silent> zO zO
Shortcut (Nvim Fold) Fold more
      \ nmap <silent> zm zm
Shortcut (Nvim Fold) Folds all
      \ nmap <silent> zM zM

Shortcut (COC) Files explorer
      \ nnoremap <silent> <Space>e :execute 'CocCommand explorer'<CR>

Shortcut (Complie) Compile file
      \ nnoremap <silent> <Space>c : call CompileRun()<CR>

Shortcut (Vim) set Ignore case in search patterns.
      \ nnoremap <silent> <Space>i : set ic<CR>
Shortcut (Vim) set Ignore case in search patterns.
      \ nnoremap <silent> <Space>r :execute 'source ~/.vimrc'<CR>


" Use `[w` and `]w` to navigate diagnostics
Shortcut (Coc) Go to previous diagnostic callout.
      \ nmap <silent> [g <Plug>(coc-diagnostic-prev)
Shortcut (Coc) Go to next diagnostic callout.
      \ nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
Shortcut (Coc) Open the definition of the symbol under the cursor.
      \ nmap <silent> gd <Plug>(coc-definition)
Shortcut (Coc) Open the type definition of the symbol under the cursor.
      \ nmap <silent> gy <Plug>(coc-type-definition)
Shortcut (Coc) Open the implementation of the symbol under the cursor.
      \ nmap <silent> gi <Plug>(coc-implementation)
Shortcut (Coc) Open the references of the symbol under the cursor.
      \ nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
Shortcut! K (Coc) Open the documentation of the symbol under the cursor.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
Shortcut (Coc) Rename the symbol under the cursor.
      \ nmap <Space>qn <Plug>(coc-rename)

" Remap for format selected region
Shortcut (Coc) Format the selected region of code.
      \ xmap <Space>qv  <Plug>(coc-format-selected)
      \|nmap <Space>qv  <Plug>(coc-format-selected)


" ALE
Shortcut (Ale) previous error
      \ nmap <silent> <C-k> <Plug>(ale_previous_wrap)
Shortcut (Ale) next error
      \ nmap <silent> <C-j> <Plug>(ale_next_wrap)
     


let g:conflict_marker_enable_mappings = 0
Shortcut (conflict-marker) resolve merge conflict by keeping their version
      \ nnoremap <silent> <Space>ht :ConflictMarkerThemselves<CR>
Shortcut (conflict-marker) resolve merge conflict by keeping our version
      \ nnoremap <silent> <Space>ho :ConflictMarkerOurselves<CR>
Shortcut (conflict-marker) resolve merge conflict by keeping both versions
      \ nnoremap <silent> <Space>ha :ConflictMarkerBoth<CR>
Shortcut (conflict-marker) resolve merge conflict by deleting both versions
      \ nnoremap <silent> <Space>hn :ConflictMarkerNone<CR>

Shortcut (undoclosewin) undo/restore most recently closed window
      \ nnoremap <silent> <Space>uw :UcwRestoreWindow<CR>
Shortcut (undoclosewin) show history of recently closed windows
      \ nnoremap <silent> <Space>Uw :UcwOpenHistoryBuffer<CR>

Shortcut show shortcut menu and run chosen shortcut
      \ noremap <silent> <Leader><Leader> :Shortcuts<Return>
Shortcut fallback to shortcut menu on partial entry
      \ noremap <silent> <Leader> :Shortcuts<Return>
"============================= shortcuts =========================

" fold ""
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd BufReadPost,FileReadPost * normal zR
