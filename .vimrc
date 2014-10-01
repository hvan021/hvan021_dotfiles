    " ============================================================================
    " --------  --------
    " ============================================================================
    " ============================================================================
    " -------- VIM GENERAL SETTINGS --------
    " ============================================================================
    set nocompatible " Must be first line

" Windows Compatible {
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
" }

    set hidden
    set encoding=utf-8
    "set guioptions-=m
    set guioptions-=T
    set splitright
    "set guioptions=gtrLme
    " Setup Pathogen to manage your plugins
    " mkdir -p ~/.vim/autoload ~/.vim/bundle
    " curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
    " Now you can install any plugin into a .vim/bundle/plugin-name/ folder
    call pathogen#infect()

    " Enable syntax highlighting
    " You need to reload this file for the change to apply
    filetype off
    filetype plugin indent on
    syntax on
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType php set omnifunc=phpcomplete#Complete
    "autocmd FileType java set completeopt-=preview
    "autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
    "autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
    let g:netrw_dirhistmax = 0

    " phpcomplete disable Ctrl+] (was conflicting)
    " see https://github.com/curtismchale/WPTT-Vim-Config/issues/62
    " https://github.com/shawncplus/phpcomplete.vim/issues/48
    let g:phpcomplete_enhance_jump_to_definition = 0

    " vim markdown settings
    let g:vim_markdown_folding_disabled=1

    " Better copy & paste
    " When you want to paste large blocks of code into vim, press F2 before you
    " paste. At the bottom you should see ``-- INSERT (paste) --``.

    set clipboard=unnamed

    set wildmode=list:longest " make TAB behave like in a shell
    set autoread " reload file when changes happen in other editors
    set tags=./tags;$HOME

    " Mouse and backspace
    set mouse=a  " on OSX press ALT and click
    set bs=2     " make backspace behave like normal again

    " Useful settings
    set history=700
    set undolevels=700

    " Make search case insensitive
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    " Disable stupid backup and swap files - they trigger too many events
    " for file system watchers
    set nobackup
    set nowritebackup
    set noswapfile

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
    " Remember info about open buffers on close
    set viminfo^=%

    " Always try to keep this many lines above and below the cursor
    set scrolloff=7

    set relativenumber

    " ============================================================================
    " -------- KEY BINDING SETTINGS --------
    " ============================================================================

    " Rebind <Leader> key
    " I like to have it here becuase it is easier to reach than the default and
    " it is next to ``m`` and ``n`` which I use for navigating between tabs.
    let mapleader = ","
    " nnoremap . <NOP>
    
    "noremap ; :

    set pastetoggle=<F2>

    map <Leader>ev :e ~/.vimrc<cr>


    " =========================
    " Awesome line number magic
    " =========================
    "function! NumberToggle()
    "if(&relativenumber == 1)
        "set number
    "else
        "set relativenumber
    "endif
    "endfunc

    "nnoremap <Leader>l :call NumberToggle()<cr>
    nnoremap <Leader>l :set  relativenumber!<cr>
    ":au FocusLost * :set number
    ":au FocusGained * :set relativenumber
    "autocmd InsertEnter * :set number
    "autocmd InsertLeave * :set relativenumber

    " Quicksave command
    noremap <Leader>w :update<CR>
    vnoremap <Leader>w <C-C>:update<CR>
    inoremap <Leader>w <Esc>:update<CR>

    " Quick quit command
    noremap <Leader>q :quit<CR>  " Quit current window
    noremap <Leader>Q :qa!<CR>   " Quit all windows

    " sudo save
    if has("mac") || has("unix")
        "nnoremap <Leader>W w !sudo tee > /dev/null %
        cmap w!! w !sudo tee % >/dev/null
    endif


    " insert new line in normal mode
    nmap <S-Enter> O<Esc>j
    nmap <CR> o<Esc>k

    " bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
    " Every unnecessary keystroke that can be saved is good for your health :)
    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h


    " maximize vertical 
    map <Leader>- <c-w>_
    " maximize horizontal
    map <Leader>\ <c-w><Bar> 
    " normalize size
    map <Leader>= <c-w>= 
    " tear to new tab
    map <Leader>t <c-w>t 

    " set window minimum height
    set wmh=0

    " provide hjkl movements in Insert mode via the <Alt> modifier key
    inoremap <A-h> <C-o>h
    inoremap <A-j> <C-o>j
    inoremap <A-k> <C-o>k
    inoremap <A-l> <C-o>l

    " map jk and kj to ESC
    inoremap jk <esc>
    inoremap kj <esc>

    inoremap <C-e> <C-O>$
    inoremap ;; <end>;
    inoremap {{ <end>{}<left>
    inoremap <A-p> <C-O>p

    "autocmd FileType php imap <buffer> <C-[> <end>{
    " easier moving between tabs
    "map gT <esc>:tabprevious<CR>
    "map gt <esc>:tabnext<CR>

    " easier formatting of paragraphs
    vmap Q gq
    nmap Q gqap

    " map sort function to a key
    " vnoremap <Leader>s :sort<CR>

    " easier moving of code blocks
    " Try to go into visual mode (v), thenselect several lines of code here and
    " then press ``>`` several times.
    vnoremap < <gv  " better indentation
    vnoremap > >gv  " better indentation

    " new settings
    map <Leader>a ggVG  " select all
    nnoremap <leader>1 yypVr=  " add a line underneath with every character repalce by =

    " center the cursor vertically
    "nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>


    " remove trailing white space
    map <Leader>x :%s/\s\+$//<cr>

    " Vertical split windows
    "nnoremap <Leader>w <C-w>v<C-w>l

" Map ,h to host and vhost files
    if has('win32') || has('win64')
        "map <Leader>h :tabe c:\Windows\System32\drivers\etc\hosts <bar> tabe C:\WebServer\Apache24\conf\extra\httpd-vhosts.conf<cr>
        map <Leader>h :tabe c:\Windows\System32\drivers\etc\hosts <bar> vsp C:\WebServer\Apache24\conf\extra\httpd-vhosts.conf<cr>
    else
        map <Leader>h :tabe /private/etc/hosts <bar> vsp /private/etc/apache2/extra/httpd-vhosts.conf<CR>
    endif

    nnoremap <F3> :set wrap! wrap?<CR>
    imap <F3> <C-O><F3>
    nnoremap <F1> :set hlsearch! hlsearch?<CR>
    imap <F1> <C-O><F1>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
" Remap VIM 0 to first non-blank character
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map 0 ^

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("unix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" ============================================================================
" -------  THEMES - FONTS - GUI --------
" ============================================================================

if has('win32') || has('win64')
    "set guifont=Source_Code_Pro:h10
    set guifont=Consolas:h10
    "Set vim full screen
    "set lines=55 columns=200
    "set lines=999 columns=999
    " winpos 65 1
    set textwidth=80
    ":autocmd GUIEnter * winpos 1 1
    " set maximize window 
    au GUIEnter * simalt ~x 
    " set initial window size
    "set lines=60 columns=120
endif

" =========================
" Show trailing whitespace
" =========================
" MUST be inserted BEFORE the colorscheme command
 autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
 au InsertLeave * match ExtraWhitespace /\s\+$/

" =========================
" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
" =========================
 set t_Co=256
 color wombat256mod
 set colorcolumn=80
 highlight ColorColumn ctermbg=233

" Showing line numbers and length
 set number  " show line numbers
 set tw=79   " width of document (used by gd)
 set nowrap  " don't automatically wrap on load
 set fo-=t   " don't automatically wrap text when typing

" =========================
" No bullshit folding magic
" =========================
set foldmethod=indent
"set foldnestmax=2
"nnoremap <space> zA
"vnoremap <space> zA

" When opening the file, unfold all. Fold all with zM
" au BufRead * normal zR

set laststatus=2

" =========================
" show tab number and modify status
" guitablabel and guitabltooltip
" =========================
set showtabline=2             " always show the tab bar
"if has("gui_running")
"endif

" highlight the cursor line
set cursorline

if has('gui') && has('autocmd') && has('windows')
    "set up tab labels with tab number, buffer name, number of windows
   function! GuiTabLabel()
     let label = ''
     let bufnrlist = tabpagebuflist(v:lnum)
     " Add '+' if one of the buffers in the tab page is modified
     for bufnr in bufnrlist
       if getbufvar(bufnr, "&modified")
         let label = '+'
         break
       endif
     endfor
     " Append the tab number
     let label .= v:lnum.': '
     " Append the buffer name
     let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
     if name == ''
       " give a name to no-name documents
       if &buftype=='quickfix'
         let name = '[Quickfix List]'
       else
         let name = '[No Name]'
       endif
     else
       " get only the file name
       let name = fnamemodify(name,":t")
     endif
     let label .= name
     " Append the number of windows in the tab page
     let wincount = tabpagewinnr(v:lnum, '$')
     return label . '  [' . wincount . ']'
   endfunction
   "set guitablabel=%{GuiTabLabel()}

    " set up tab tooltips with every buffer name
    function! GuiTabToolTip()
    let tip = ''
    let bufnrlist = tabpagebuflist(v:lnum)
    for bufnr in bufnrlist
        " separate buffer entries
        if tip!=''
        let tip .= " \n "
        endif
        " Add name of buffer
        let name=bufname(bufnr)
        if name == ''
        " give a name to no name documents
        if getbufvar(bufnr,'&buftype')=='quickfix'
            let name = '[Quickfix List]'
        else
            let name = '[No Name]'
        endif
        endif
        let tip.=name
        " add modified/modifiable flags
        if getbufvar(bufnr, "&modified")
        let tip .= ' [+]'
        endif
        if getbufvar(bufnr, "&modifiable")==0
        let tip .= ' [-]'
        endif
    endfor
    return tip
    endfunction
    "set guitabtooltip=%{GuiTabToolTip()}


    "set guitablabel=%N.\ %t\ %M " Show tab numbers
    au GUIEnter * set gtl=%{GuiTabLabel()} gtt=%{GuiTabToolTip()}
    "au GUIEnter * set guitablabel=%N.\ %t\ %M " Show tab numbers
endif

"set guitablabel=%N.\ %t\ %M " Show tab numbers


" ====================
" Movement between tabs OR buffers
" ====================
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction

"nnoremap L :call MyNext()<CR>
"nnoremap H :call MyPrev()<CR>

" ============================================================================
" ********** ADD-ON & PLUGGINS **********
" cd ~/.vim/bundle
" git submodule update --init.
"
" to update submodules:
" git submodule foreach git pull origin master
"
"
"
"
"
"
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
" &&
" git clone https://github.com/Raimondi/delimitMate.git
" &&
" git clone https://github.com/mattn/emmet-vim.git
" &&
" git clone --recursive https://github.com/davidhalter/jedi-vim.git
" &&
" git clone https://github.com/scrooloose/nerdtree.git
" &&
" git clone git://github.com/shawncplus/phpcomplete.vim.git
" &&
" git clone https://github.com/ervandew/supertab.git
" &&
" git clone https://github.com/sirver/ultisnips.git
" &&
" git clone git://github.com/tpope/vim-fugitive.git
" &&
" git clone https://github.com/scrooloose/nerdcommenter.git
" &&
" git clone https://github.com/scrooloose/syntastic.git
" ============================================================================
" =====================
" Powerline
" =====================

" Settings for vim-powerline -- Ubutu settings only here -- MODIFY it for
" Windows and MAC OS
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" see here for powerline for multiple apps on Ubuntu
" http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
"""" Ubuntu settings
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" set laststatus=2

" Settings for vim-powerline
" ===========================

"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/source_plugin.vim
"source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
"let g:Powerline_symbols = 'fancy'

    if has('win32') || has('win64')
       let g:Powerline_symbols = 'unicode'
    elseif has('mac')
        source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
        let g:Powerline_symbols = 'fancy'
    else
        " python 2.7
        "set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

        " python 3.4
        set rtp+=$HOME/.local/lib/python3.4/site-packages/powerline/bindings/vim/
        let g:Powerline_symbols = 'fancy'
    endif

" ============================================================================
" Fugitive mapping
" ============================================================================

nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>


" =====================
" NERDTree mapping
" =====================
map      <C-n> :NERDTree<CR>

" =====================
" NerdCommenter settings
" =====================
 filetype plugin on

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
 let g:ctrlp_max_height = 30

" =====================
" DelimitMate
" git clone https://github.com/Raimondi/delimitMate
" =====================
let delimitMate_expand_cr = 1

" =====================
" UltiSnips
" git clone https://github.com/sirver/ultisnips
" =====================
"set runtimepath+=~/.vim/bundle/UltiSnips
"let g:snips_author = "Hugh Van"
"let g:UltiSnipsSnippetDirectories = ['UltiSnips']
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ======================================
"original settings from Ultisnips  github
" ======================================
"" Track the engine.
"Plugin 'SirVer/ultisnips'

"" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" ======================================
" Git gutter color change
" =====================================
  highlight clear SignColumn
  "highlight GitGutterAdd ctermfg=green
  "highlight GitGutterChange ctermfg=yellow
  "highlight GitGutterDelete ctermfg=red
  "highlight GitGutterChangeDelete ctermfg=yellow

" =====================
" Omnicomplete related stuff
" =====================
set completeopt=longest,menuone
inoremap <c-space> <C-x><C-o>
inoremap <c-@> <C-x><C-o>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" found here: http://stackoverflow.com/a/2170800/70778
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" =====================
" SuperTab Integration
" gti clone git://github.com/ervandew/supertab.git bundle/supertab
" =====================
set completeopt-=preview
let g:SuperTabDefaultCompletionType = ""
let g:SuperTabDefaultCompletionType = "context"

" =====================
" Settings for jedi-vim
" =====================
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
 let g:jedi#usages_command = "<leader>z"
 "let g:jedi#popup_on_dot = 0
 let g:jedi#popup_select_first = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" ==========================
" Settings for vim-markdown
" ==========================
" let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1

" Compile bootstrap.css when saving a .less file
"func! s:CompileLess()
    "lcd %:p:h
    "let static_dir = finddir('static', ';')
    "let l:cmd = "cd " . l:static_dir . " && lessc css/bootstrap.less css/bootstrap.css"
    "let l:cmd2 = "cd " . l:static_dir . " && lessc css2/bootstrap.less css2/bootstrap.css"
    "let l:errs = system(l:cmd)
    "let l:errs = system(l:cmd2)
    "if (!empty(l:errs))
        "echo l:errs
    "endif
"endfunc
"autocmd! BufWritePost,FileWritePost *.less call s:CompileLess()

" BEGIN things for Java development
" =============================================================================

" Syntastic
" =========
"let jshint2_save = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,E225'
"let g:syntastic_python_flake8_args='--ignore=E265'
" Javacomplete
" ============
"func! s:SetClasspath()
"    lcd %:p:h
"    let gradle_settings = findfile('settings.gradle', '.;')
"    let project_root = fnamemodify(gradle_settings, ":p:h")
"    call javacomplete#SetSourcePath(project_root)
"    let $CLASSPATH = $CLASSPATH . ":" . project_root . "/desktop/build/libs/*"
"endfunc
"autocmd VimEnter * call s:SetClasspath()


" END tings for Java development
" =============================================================================

" source ~/.vim/vimrc/vimrc_python.vim
" source ~/.vim/bundle/pydiction/vimrc_pydiction.vim


" ============================================================================
" PYTHON IDE SETUP
" ============================================================================

" Real programmers don't use TABs but spaces
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set shiftround
 set expandtab

 set wildignore+=*.pyc
 set wildignore+=*_build/*
 set wildignore+=*/coverage/*



" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
 set nofoldenable

 " see here http://blog.dispatched.ch/2009/05/24/vim-as-python-ide/

" see here http://stackoverflow.com/questions/978643/vim-python-and-django-autocompletion-pysmell
"
" To make work autocomplete, add this lines in your .vimrc:
"
"    autocmd FileType python set omnifunc=pythoncomplete#Complete
"
"    if has("python")
"
"    python import sys,os
"
"    python sys.path.append('/home/sergey/workspace/django')
"
"    python os.environ['DJANGO_SETTINGS_MODULE'] = 'djangoProject.settings'
"
"    endif
"
"where:
"
"    sys.path.append is path to your django workspace directory
"    djangoProject is name of your django project, which is going just after '/home/sergey/workspace/django'
"
"Finally, save it and restart vim. Now, after '.', you press default ctrl-x ctrl-o to get your autocomplete.

" ============================================================================
" CUSTOMIZED FUNCTIONS
" ============================================================================

" =========================
" Convert case
" =========================
function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
        let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
        let result = toupper(a:str)
    endif
    return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv



" ============================================================================
" MAC SETTINGS ONLY
" ============================================================================

" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %

" Fixing the copy & paste madness
" ================================
" vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
" nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
" imap <C-v> <Esc><C-v>a


if has('mac')
    set grepprg=ack\ -k
endif


" Settings for vim-powerline -- Ubutu settings only here -- MODIFY it for
" Windows and MAC OS
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" see here for powerline for multiple apps on Ubuntu
" http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
"""" Ubuntu settings
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" set laststatus=2

" Settings for vim-powerline
" ===========================

"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/source_plugin.vim
"source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
"let g:Powerline_symbols = 'fancy'


" ===========================================================================
" WINDOWS SETTINGS ONLY
" ===========================================================================
"set nocompatible
""source $VIMRUNTIME/vimrc_example.vim
""source $VIMRUNTIME/mswin.vim
""behave mswin

""Set vim full screen
""set lines=55 columns=200
 "set lines=65 columns=125
"" winpos 65 1
"set textwidth=80
":autocmd GUIEnter * winpos 65 1

""set line no, buffer, search, highlight, autoindent and more.
"set nu
"set ignorecase
"set incsearch
"set smartcase
"set showmatch
"set autoindent
"set ruler
"set vb
"set noerrorbells
"set showcmd
"set mouse=a
"set history=1000
"set undolevels=1000
"set cursorline

"au FileChangedShell * echo "Warning: File changed on disk"

"" Color scheme
"colorscheme wombat256mod
"set guifont=Consolas:h10 " Windows only
""set guifontwide=NSimSun " display Chinese characters properly
"let g:Powerline_symbols = 'unicode'

"" quick edit .vimrc in a vertical split window
"nnoremap <Leader>ev :vsplit $MYVIMRC<Cr>



"let os=substitute(system('uname'), '\n', '', '')
  "if os == 'Darwin' || os == 'Mac'
    "set guifont=Menlo:h16
    "set guicursor+=a:blinkon0
    "set guioptions+=T
  "elseif os == 'Linux'
    "set guifont=Monospace\ 12
  "endif

