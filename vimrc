" ############################################################ 
" On windows it works out better to leave configuration files in Git folders.
" Add this to $HOME/_vimrc and it works well.
" --
" let &runtimepath.=',$HOME/My Documents/GitHub/dotfiles/vim/'
" source $HOME/My Documents/GitHub/dotfiles/vimrc
" --
" ############################################################ 

let mapleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$HOME/My\ Documents/GitHub/dotfiles/vim/bungle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" === CTRL+P ========================
Bundle 'kien/ctrlp.vim'
" CTRL-P searching (run ClearAllCtrlPCaches) after changing the list of paths to ignore
let g:ctrlp_working_path_mode=0 " 2 = first occurance of .git or root.dir
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.exe$|\.dll$'
let g:ctrlp_follow_symlinks = 1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.exe,*.dll

" === MARKDOWN =======================
Bundle 'plasticboy/vim-markdown'
autocmd FileType markdown map <leader>r :!mdr -b --temp % <cr><cr>
autocmd FileTYpe markdown set wrap
autocmd FileType markdown set spell

" === SILVER SEARCH =====================
Bundle 'rking/ag.vim'
nnoremap <leader>a :Ag -i<space>

" === INDENT LINE =======================
Bundle 'Yggdroot/indentLine'
set list lcs=tab:\|\ 
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#333333'
let g:indentLine_char = 'c'
"let g:indentLine_char = '∙▹¦'
let g:indentLine_char = '∙'
let g:indentLine_enabled = 1

" === NERD TREE =====================
Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
set winfixwidth

Bundle 'vim-scripts/scratch.vim'

Bundle 'troydm/easybuffer.vim'
nmap <leader>be :EasyBufferToggle<cr>

Bundle 'terryma/vim-multiple-cursors'

Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Bundle 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>

Bundle 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'zaiste/Atom'
Bundle 'w0ng/vim-hybrid'
Bundle 'chriskempson/base16-vim'
Bundle 'Elive/vim-colorscheme-elive'
Bundle 'zeis/vim-kolor'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

call vundle#end()

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
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪
filetype plugin indent on

set vb t_vb=
set title
set ls=2

set nobackup
if has("win32")
  set directory=c:/temp//,.
else
  set directory=$HOME/tmp//,.
endif


augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:␣
    au InsertLeave * :set listchars+=trail:␣
augroup END

syntax on

au BufNewFile,BufRead *.config setfiletype xml
au BufNewFile,BufRead *.config.sample setfiletype xml
au BufNewFile,BufRead *.msbuild setfiletype xml

set background=dark
colorscheme vividchalk
if has("gui_running") 
  colorscheme badwolf
  set cursorline
  if has("win32")
    set guifont=ProFontWindows:h9
  elseif has("gui_macvim")
    set macmeta " fix alt?
    set guifont=Inconsolata\ for\ Powerline:h14
    let g:airline_powerline_fonts = 1
  else
    set guifont=Inconsolata:h12
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
autocmd FileType mail set spell

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

nnoremap <leader><leader> <c-^>

