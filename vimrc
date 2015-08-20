" ############################################################ 
" Key Bindings
" --- --------
" Ctrl + P      : Open files Using CtrlP
" F2            : Nerd Tree
" vip<ENTER>*,  : easy align, all commas in currect paragraph
" ,#            : comment/uncomment
" ,a            : silver search
" ,be           : easy buffer
" ############################################################ 
" On windows it works out better to leave configuration files in Git folders.
" Add this to $HOME/_vimrc and it works well.
" --
" let &runtimepath.=',$HOME/My Documents/GitHub/dotfiles/vim/'
" source $HOME/My Documents/GitHub/dotfiles/vimrc
" --
" ############################################################ 


call pathogen#infect()

set t_Co=256

set nocompatible 
set hidden
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set showtabline=2

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hlsearch
set incsearch
set number
set relativenumber "7.4 only
set nowrap
set autoindent
set smartindent
filetype plugin indent on

set vb t_vb=
set title
set ls=2

set nolazyredraw

set showbreak=↪

set nobackup
if has("win32")
  set directory=c:/temp//,.
else
  set directory=$HOME/tmp//,.
endif

let mapleader = ","

syntax on

set background=dark
colorscheme vividchalk
if has("gui_running") 
  colorscheme badwolf
  set cursorline
  if has("win32")
    set guifont=ProFontWindows:h9
  elseif has("gui_macvim")
    set guifont=Inconsolata\ for\ Powerline:h14
    let g:airline_powerline_fonts = 1
  else
  endif
  set guioptions-=T
  set guioptions-=m
  set lines=50
  set columns=120
  set wrap
else
endif


"define 3 custom highlight groups
hi User1 ctermfg=grey  guifg=grey
hi User2 ctermfg=yellow guifg=yellow
hi User3 ctermfg=green guifg=green

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmov


" Don't leave visual move when changing indentation...
vmap > >gv
vmap < <gv

autocmd FileType ruby setlocal foldmethod=syntax nofoldenable
autocmd FileType ruby setlocal indentexpr=GetRubyIndent() nosmartindent 
autocmd FileType ruby compiler rubyunit

autocmd FileType markdown map <leader>r :!mdr -b --temp % <cr><cr>
autocmd FileType markdown set wrap
autocmd FileType markdown set wrap
autocmd FileTYpe markdown set spell

autocmd FileType mail set spell

au BufNewFile,BufRead *.config setfiletype xml
au BufNewFile,BufRead *.config.sample setfiletype xml
au BufNewFile,BufRead *.msbuild setfiletype xml

set enc=utf-8

" Remap Arrow keys for buffer navigator
map <Left> :bp<cr>
map <Right> :bn<cr>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Clear highlighting
nnoremap <leader><space> :noh<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

" " Make the current window big, but leave others context
" set winwidth=84
" " We have to have a winheight bigger than we want to set winminheight. But if
" " we set winheight to be huge before winminheight, the winminheight set will
" " fail.
" set winheight=5
" set winminheight=5
" set winheight=999

nnoremap <leader><leader> <c-^>

"set list
set list listchars=tab:>-,trail:·,extends:>

" Trailing whitespace {{{   
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:·
    au InsertLeave * :set listchars+=trail:·
augroup END

" === AG.VIM ====================================================
nnoremap <leader>a :Ag -i<space>

" === CTRL+P ====================================================
" CTRL-P searching (run ClearAllCtrlPCaches) after changing the list of paths to ignore
let g:ctrlp_working_path_mode=0 " 2 = first occurance of .git or root.dir
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.exe$|\.dll$'
let g:ctrlp_follow_symlinks = 1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.exe,*.dll
"
" === NERDTREE ==================================================
map <F2> :NERDTreeToggle<CR>
set guioptions-=r
set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
set winfixwidth

" === EASY BUFFER ===============================================
nmap <leader>be :EasyBufferToggle<cr>

" === NERD COMMENT ==============================================
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

" === AIRLINE ==============================================
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

" === ULTISNIPS ==============================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" === EASYALIGN ==============================================
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
