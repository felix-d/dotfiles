" vim: set sw=2 ft=vim ts=2 sts=2

" Specifies the encoding used in the script
scriptencoding utf-8 

""""""""""""""""""""""""""""""
" => BUNDLES
"""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Language pack. Syntax highlighting, formatting etc.
Plug 'sheerun/vim-polyglot'

" Manage surroundings.
Plug 'tpope/vim-surround'

" Repeat more thing with the dot. For example surrounds.
Plug 'tpope/vim-repeat'

" Comment code automatically.
Plug 'tpope/vim-commentary'

" A Git wrapper.
Plug 'tpope/vim-fugitive'

" Shows a git diff in the gutter.
Plug 'airblade/vim-gitgutter'

" :Gbrowse.
Plug 'tpope/vim-rhubarb'

" Goes to the project root automatically.
Plug 'airblade/vim-rooter'

" Navigate tmux panes.
Plug 'christoomey/vim-tmux-navigator'

" Automatically open pairs e.g. quotes.
Plug 'jiangmiao/auto-pairs'

" Extends the % matcher to more stuff.
Plug 'vim-scripts/matchit.zip'

" Delete trailing whitespaces on save.
Plug 'vim-scripts/DeleteTrailingWhitespace'

" Split and join code!
Plug 'AndrewRadev/splitjoin.vim'

" Test runner.
Plug 'janko-m/vim-test'

" Reload files that have changed automatically.
Plug 'djoshea/vim-autoread'

" Format SQL on save. Or use :SQLFmt.
Plug 'b4b4r07/vim-sqlfmt'

" Use release branch (recommend).
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Navigation.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

" Onedark colorscheme.
Plug 'joshdick/onedark.vim'

" Generate Tmux line colorscheme from vim colorscheme.
Plug 'edkolev/tmuxline.vim'

" Lightline for vim.
Plug 'itchyny/lightline.vim'

" Close tags in HTML files.
Plug 'alvan/vim-closetag'

" Send commands to Tmux panes.
Plug 'christoomey/vim-tmux-runner'

" jsonc support.
Plug 'kevinoid/vim-jsonc'

" Nerdtree
Plug 'preservim/nerdtree'

call plug#end()

"""""""""""""""""""""""""""""""
" => GENERAL
"""""""""""""""""""""""""""""""
let mapleader=' '                   " Just like spacemacs.
filetype on                         " Enable ft detection.
set shellpipe=2>&1\|\ tee\          " I don't remember why this is here.
set tags=./tags,tags;$HOME          " Ctags location.
set nofoldenable                    " No folds.
set mouse=                          " Automatically enable mouse usage.
set mousehide                       " Hide the mouse cursor while typing.
set virtualedit=onemore             " Allow for cursor beyond last character.
set iskeyword-=.                    " '.' is an end of word designator.
set iskeyword-=#                    " '#' is an end of word designator.
set iskeyword-=-                    " '-' is an end of word designator.
set scrolljump=10                   " Jump by 10 when scrolling.
set linespace=0                     " No extra spaces between rows.
set number                          " Line numbers on.
set showmatch                       " Show matching brackets/parenthesis.
set nocursorline                    " No cursor line. It slows down terminal vim..
set nocursorcolumn                  " No cursor column.
set norelativenumber                " No relative number.
set winminheight=0                  " Windows can be 0 line high.
set ignorecase                      " Case insensitive search.
set smartcase                       " Case sensitive when uc present.
set nolist                          " We don't want to see $ at the end of each line.
set nospell                         " No need for spell checking, its annoying.
set wildmode=list:longest,full      " Command <Tab> completion, list matches, then longest common part, then all.
set scrolloff=1                     " Minimum lines to keep above and below cursor.
set nowrap                          " Do not wrap long lines.
set shiftwidth=2                    " Use indents of 2 spaces.
set expandtab                       " Tabs are spaces, not tabs.
set tabstop=2                       " An indentation every 2 columns.
set softtabstop=2                   " Let backspace delete indent.
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J).
set splitright                      " Puts new vsplit windows to the right of the current.
set splitbelow                      " Puts new split windows to the bottom of the current.
set nobackup                        " Why backups if git everywhere.
set nowb                            " No need to make a backup before overwriting.
set noswapfile                      " Swap files are annoying.
set re=0                            " Regex syntax highlighting is super slow in typescript.
set noerrorbells                    " Bells are annoying.
set novisualbell                    " Ditto.
set tm=500                          " Time in milliseconds to wait for a mapped sequence to complete.
set clipboard=unnamed               " System clipboard.
set hidden                          " When on a buffer becomes hidden when it is abandoned.
set textwidth=120                   " Good default.
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.ds_store,*.o,*~,*.pyc " Ignore these when expanding wildcards.

" 0 goes to beginning of line.
map 0 ^

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Turn persistent undo on. We can undo even when we close a buffer/VIM.
set undodir=~/.vim/temp_dirs/undodir
set undofile

" Automatically delete the buffer if we delete a file.
let NERDTreeAutoDeleteBuffer = 1

" Prettier
let NERDTreeMinimalUI = 1

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Close NERDTree when opening a file
let g:NERDTreeQuitOnOpen = 1

"""""""""""""""""""""""""""""""
" => MISC KEY BINDINGS
"""""""""""""""""""""""""""""""
" Edit vim config (edit config)
nnoremap <leader>ec :e $MYVIMRC<cr>

" Open the quickfix window.
nnoremap <leader>q :cope<cr>

" Open NERDTree on the current file if there is a file. Otherwise use the default :NERDTree command.
nnoremap <expr> - bufname('%') != '' ? ':NERDTreeFind<CR>' : ':NERDTree<CR>'

" Simple search and replace for the current file.
nnoremap <leader>r :call FileSearchAndReplace()<CR>

" Search in the current working directory.
nnoremap <leader>s :Rg <C-r>=expand("<cword>")<CR>

" Because jk is overrated
inoremap df <Esc>

" Go to last buffer that exists. Just like Spacemacs.
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

" Otherwise sets to <C-L> which conflicts with pane navigation.
nmap <unique> <C-e> <Plug>NetrwRefresh

" Change S to s for vim surround
xmap s <Plug>VSurround

" Add current file path to clipboard. (Copy Path)
nmap <leader>cp :let @+ = expand("%")<cr>

"""""""""""""""""""""""""""""""
" => AUTOCOMPLETION
"""""""""""""""""""""""""""""""
" TAB completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Avoid showing extra messages when using completion.
set shortmess+=c

" Close pum and new line if pressing Enter and pum is opened.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

"""""""""""""""""""""""""""""""
" => AUTOCLOSE TAGS
"""""""""""""""""""""""""""""""
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.vue,*.html.eex"

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
" Search and replace the word under cursor in the current buffer.
" Just a conveniency really.
function! FileSearchAndReplace()
    call inputsave()
    let wordToReplace = input("Replace: ", expand("<cword>"))
    let replacement = input("Replace \"" . wordToReplace . "\" with: ")
    execute ":%s/" . wordToReplace . "/" . replacement . "/gc"
    call inputrestore()
endfunction
