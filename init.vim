" vim: set sw=2 ft=vim ts=2 sts=2 et:

"""""""""""""""""""""""""""""""
" => BUNDLES
"""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Utils

Plug 'dbakker/vim-projectroot'
Plug 'sheerun/vim-polyglot' " Supports all languages!
Plug 'tpope/vim-surround' " Manage surroundings!
Plug 'tpope/vim-repeat' " More powerful dot. E.g. repeats surround
Plug 'tpope/vim-commentary' " Comment code
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-rhubarb' " Gbrowse
Plug 'tpope/vim-vinegar' " Simple file browser
Plug 'airblade/vim-rooter' " Go to repo root
Plug 'christoomey/vim-tmux-navigator' " Navigate to tmux panes
Plug 'jiangmiao/auto-pairs' " The name says it all
Plug 'vim-scripts/matchit.zip' " Extended % matcher
Plug 'vim-scripts/DeleteTrailingWhitespace' " Delete trailing whitespace on save
Plug 'AndrewRadev/splitjoin.vim' " Split and join code
Plug 'janko-m/vim-test' " Test runner that works!
Plug 'djoshea/vim-autoread' " Reload files that have changed automatically.
Plug 'b4b4r07/vim-sqlfmt'

" Autocomplete
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-go'
"
" Linter
Plug 'w0rp/ale' " Awesome linter. Note however that there are some overlaps with LanguageClient.

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

" UI
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'
Plug 'edkolev/tmuxline.vim'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

" HTML
Plug 'alvan/vim-closetag' " Closes tags in html

" Misc
Plug 'christoomey/vim-tmux-runner' " Send commands to tmux pane

" Ruby
Plug 'tpope/vim-endwise' " Adds end automatically

" Go

call plug#end()

"""""""""""""""""""""""""""""""
" => GENERAL
"""""""""""""""""""""""""""""""
let mapleader=' '                   " Just like spacemacs
scriptencoding utf-8
filetype plugin indent on
set shellpipe=2>&1\|\ tee\          " I don't remember why this is here
set tags=./tags,tags;$HOME          " Ctags location
set nofoldenable                    " No folds.
set mouse=                          " Automatically enable mouse usage
set mousehide                       " Hide the mouse cursor while typing
set virtualedit=onemore             " Allow for cursor beyond last character
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set scrolljump=10
set linespace=0                     " No extra spaces between rows
set re=1                            " Force old regex engine for faster ruby syntax highlighting.
set number                          " Line numbers on
set showmatch                       " Show matching brackets/parenthesis
set nocursorline                    " No cursor line. It slows down terminal vim.
set nocursorcolumn                  " No cursor column
set norelativenumber                " No relative number
set winminheight=0                  " Windows can be 0 line high
set ignorecase                      " Case insensitive search
set smartcase                       " Case sensitive when uc present
set nolist                          " We don't want to see $ at the end of each line.
set nospell                         " No need for spell checking, its annoying.
set wildmode=list:longest,full      " Command <Tab> completion, list matches, then longest common part, then all.
set scrolloff=1                     " Minimum lines to keep above and below cursor
set nowrap                          " Do not wrap long lines
set shiftwidth=4                    " Use indents of 4 spaces
set expandtab                       " Tabs are spaces, not tabs
set tabstop=4                       " An indentation every four columns
set softtabstop=4                   " Let backspace delete indent
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
set splitright                      " Puts new vsplit windows to the right of the current
set splitbelow                      " Puts new split windows to the bottom of the current
set nobackup                        " Why backups if git everywhere
set nowb                            " No need to make a backup before overwriting
set noswapfile                      " Swap files are annoying
set noerrorbells
set novisualbell
set tm=500
set clipboard=unnamed
set hidden

" Edit vim config (edit config)
nnoremap <leader>ec :e $MYVIMRC<cr>

" ignore compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.ds_store,*.o,*~,*.pyc

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Do not set netrw as the alternate buffer (#b)! Used also by vim vinegar.
let g:netrw_altfile = 1

" Turn persistent undo on means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""
" => Elixir
"""""""""""""""""""""""""""""""
autocmd FileType ex setlocal filetype=elixir

"""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""
autocmd FileType markdown setlocal textwidth=80

"""""""""""""""""""""""""""""""
" => Rust
"""""""""""""""""""""""""""""""
autocmd FileType rust setlocal expandtab sw=4 sts=4 ts=4

"""""""""""""""""""""""""""""""
" => HTML
"""""""""""""""""""""""""""""""
autocmd FileType html setlocal expandtab sw=2 sts=2 ts=2

"""""""""""""""""""""""""""""""
" => YAML
"""""""""""""""""""""""""""""""
autocmd FileType yml setlocal expandtab sw=2 sts=2 ts=2

"""""""""""""""""""""""""""""""
" => CSS
"""""""""""""""""""""""""""""""
autocmd FileType css,scss,less setlocal expandtab sw=2 sts=2 ts=2

"""""""""""""""""""""""""""""""
" => Typescript
"""""""""""""""""""""""""""""""
autocmd FileType typescript setlocal expandtab sw=2 sts=2 ts=2

"""""""""""""""""""""""""""""""
" => MISC KEY BINDINGS
"""""""""""""""""""""""""""""""
map 0 ^
nnoremap <leader>R :call CWDSearchAndReplace()<CR>
vnoremap <leader>R :call CWDSearchAndReplaceVisual()<CR>

nnoremap <leader>r :call FileSearchAndReplace()<CR>

nnoremap <leader>s :call SearchProject()<CR>
vnoremap <leader>s :call SearchProjectVisual()<CR>

" Because jk is overrated
inoremap df <Esc>

" Go to last buffer that exists. Just like spacemacs
noremap <Space><Tab> :b#<CR>

" Pastetoggle (sane indentation on pastes)
set pastetoggle=<F12>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Toggle search highlight
nmap <silent> <leader>/ :nohlsearch<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP"

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Change S to s for vim surround
xmap s <Plug>VSurround

" Add current file path to clipboard. (Copy Path)
nmap <leader>cp :let @+ = expand("%")<cr>

" Only create LSP mapping if there is a language server for this filetype.
function! LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    vnoremap <buffer> <silent> <leader>lf :call LanguageClient#textDocument_rangeFormatting()<cr>
    nnoremap <buffer> <silent> <leader>lf :call LanguageClient#textDocument_formatting()<cr>
    nnoremap <buffer> <silent> <leader>ld :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> <leader>lg :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction
autocmd FileType * call LC_maps()


"""""""""""""""""""""""""""""""
" => AUTOCOMPLETION
"""""""""""""""""""""""""""""""
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
    \ 'ruby': ['tcp://localhost:7658'],
    \ 'go': ['bingo', '--format-style', 'goimports', '--diagnostics-style', 'instant', '--disable-func-snippet'],
    \ }
    " \ 'go' : ['go-langserver', '-gocodecompletion', '-format-tool', 'gofmt'],

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c

" TAB completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Close pum and new line if pressing Enter and pum is opened.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

" Close pum when going insert mode.
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif


"""""""""""""""""""""""""""""""
" => AUTOCLOSE TAGS
"""""""""""""""""""""""""""""""
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.vue,*.html.eex"


"""""""""""""""""""""""""""""""
" => PYTHON
"""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python setlocal expandtab sw=4 ts=4 sts=4
au FileType python syn keyword pythonDecorator True None False self cls
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'


"""""""""""""""""""""""""""""""
" => RUBY
"""""""""""""""""""""""""""""""
au FileType ruby setlocal expandtab sw=2 ts=2 sts=2 textwidth=120
let test#strategy = "vtr"


"""""""""""""""""""""""""""""""
" => Go
"""""""""""""""""""""""""""""""
autocmd BufWritePre *.go call LanguageClient#textDocument_formatting()
autocmd FileType go setlocal noet ci pi sw=4 sts=0 ts=4


"""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""
" Disable for file types for which we use LanguageClient instead.
let g:ale_pattern_options = {
\   '.*\.rs$': {'ale_enabled': 0},
\   '.*\.go$': {'ale_enabled': 0},
\}

let g:ale_completion_delay = 1000
au BufWinEnter *.rb :let b:ale_ruby_rubocop_executable  =  system('PATH=$(pwd)/bin:$PATH && which rubocop | tr -d "\n"')
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['eslint', 'prettier', 'tslint'],
\}
" Linter from go-langserver does not work
" so we use Ale for linting instead.
" let g:ale_linters = {
" \   'go': ['gofmt', 'govet'],
" \}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1


"""""""""""""""""""""""""""""""
" => Javascript
"""""""""""""""""""""""""""""""
au FileType javascript hi link jsFuncArgs GruvboxPurple
au FileType javascript syn match jsDecorator '@[a-zA-Z_][0-9a-zA-Z_$]*'
au FileType javascript hi link jsDecorator Function


"""""""""""""""""""""""""""""""
" => JSON
"""""""""""""""""""""""""""""""
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 0
au FileType json setlocal expandtab sw=2 ts=2 sts=2


"""""""""""""""""""""""""""""""
" => Lua
"""""""""""""""""""""""""""""""
au FileType lua setlocal expandtab sw=2 ts=2 sts=2


"""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>h :History<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>gf :call fzf#run({'source': 'git diff --name-only $(git rev-parse --abbrev-ref HEAD)..master', 'sink': 'e', 'down': '40%'})<CR>


"""""""""""""""""""""""""""""""
" => FUGITIVE
"""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gi :Git add -p %<CR>
" Auto clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" Navigate to the current git object
autocmd FileType git nnoremap <buffer> <leader>gb :Gbrowse<cr>
" Navigate to current commit hash under the cursor inside the blame window
autocmd FileType fugitiveblame nnoremap <buffer> <leader>gb :execute ":Gbrowse " . expand("<cword>")<cr>


"""""""""""""""""""""""""""""""
" => UI
"""""""""""""""""""""""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
colorscheme onedark
highlight Comment cterm=italic
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

"""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""
" Add text to the command line.
" Don't ask me why it's like this, it's just is.
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Returns the word under cursor.
function! GetWordUnderCursor()
    let isOnKeyword = matchstr(getline('.'), '\%'.col('.').'c.') =~# '\k'
    if isOnKeyword
        return expand("<cword>")
    else
        return ""
    endif
endfunction

" Returns the visual selection
function! VisualSelection()
    try
        let a_save = @a
        silent normal! gv"ay
        return @a
    finally
        let @a = a_save
    endtry
endfunction

" Use Rg with word under cursor
function! SearchProject()
    call CmdLine("Rg " . GetWordUnderCursor())
endfunction

" Maps Rg result to quickfix list
function! s:rg_to_qf(line)
  let parts = split(a:line, ':')
  echo parts
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

" Wrapper over rg_to_qf
function! RgToQF(query)
  call setqflist(map(systemlist('rg --column '.a:query), 's:rg_to_qf(v:val)'))
endfunction

function! Escape(toescape)
    return escape(a:toescape, '\\/.*$^~[]<>{}')
endfunction

" Search the project for the visual selection
function! SearchProjectVisual()
    call CmdLine("Rg " . Escape(VisualSelection()))
endfunction

" Search and replace the visual selection in the project
function! CWDSearchAndReplaceVisual()
    call inputsave()
    let visual_select = Escape(VisualSelection())
    let replacement = input("Replace \"" . visual_select . "\" with: ")
    if visual_select != ''
        call RgToQF(visual_select)
        exec "cdo s/" . visual_select . "/" . replacement ."/gc"
    endif
    call inputrestore()
endfunction

" Search and replace the word under cursor in the CWD
function! CWDSearchAndReplace()
    call inputsave()
    let wordToReplace = input("Replace : ", GetWordUnderCursor())
    let replacement = input("Replace \"" . wordToReplace . "\" with: ")
    call RgToQF(wordToReplace)
    exec "cdo s/" . wordToReplace . "/" . replacement ."/gc"
    call inputrestore()
endfunction

" Search and replace the word under cursor in the current buffer
function! FileSearchAndReplace()
    call inputsave()
    let wordToReplace = input("Replace: ", GetWordUnderCursor())
    let replacement = input("Replace \"" . wordToReplace . "\" with: ")
    execute ":%s/" . wordToReplace . "/" . replacement . "/gc"
    call inputrestore()
endfunction

let g:sqlfmt_command = "sqlfmt"
let g:sqlfmt_options = ""
