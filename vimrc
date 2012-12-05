" == Lusty Explorer ========================================
" <Leader>lf - Opens filesystem explorer.
" <Leader>lr - Opens filesystem explorer at the directory of the current file.
" <Leader>lb - Opens buffer explorer.
" <Leader>lg - Opens buffer grep.
" ############################################################ 
" Ctrl + P   - Open files Using CtrlP
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
"set cursorline
"set showtabline=2

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hlsearch
set incsearch
set number
set nowrap
set autoindent
set smartindent
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

let mapleader = ","

syntax on

au BufNewFile,BufRead *.config setfiletype xml
au BufNewFile,BufRead *.msbuild setfiletype xml

set background=dark
colorscheme vividchalk
if has("gui_running") 
  if has("win32")
    set guifont=Consolas:h8
  else
    set guifont=Monospace\ 8
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

" set statusline=
" set statusline+=%1*  "switch to User1 highlight
" set statusline+=%F    "full filename
" set statusline+=%2*  "switch to User2 highlight
" set statusline+=%y   "filetype
" set statusline+=%3*  "switch to User3 highlight
" set statusline+=(%l,%c)   "line number

set statusline=%{&ff}\ \%{&fenc}\ \b%1.3n\ \%#StatusFTP#\%Y\
 \%#StatusRO#\%R\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W\ \%#StatusModFlag#\%M\
 \%#StatusLine#\%f\%=\%1.7c\ \%1.7l/%L\ \%p%%

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

map <Leader>u <Plug>MakeGreen

" CTRL-P searching (run ClearAllCtrlPCaches) after changing the list of paths to ignore
let g:ctrlp_working_path_mode=0 " 2 = first occurance of .git or root.dir
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.exe$|\.dll$'
let g:ctrlp_follow_symlinks = 1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.exe,*.dll

let g:bufExplorerShowRelativePath=1

" Don't leave visual move when changing indentation...
vmap > >gv
vmap < <gv

autocmd FileType ruby setlocal foldmethod=syntax nofoldenable
autocmd FileType ruby setlocal indentexpr=GetRubyIndent() nosmartindent 
autocmd FileType ruby compiler rubyunit
autocmd FileType markdown map <leader>r :!mdr -b --temp % <cr><cr>
autocmd FileTYpe markdown set wrap
autocmd FileType mail set spell

" Hacks for Lusty Explorer on Win32 Vim
if has("ruby")
  if has("win32")
    " set encoding to utf-8 because windows seems to force it to Latin1 which
    " causes Lusty Explorer to break.  Also for ruby integration on Windows we
    " need these patched binaries:
    " http://wyw.dcweb.cn/vim/gvim73.zip
    set enc=utf-8
  endif
endif

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

let g:snips_author='Jeff Clement'

map <F2> :NERDTreeToggle<CR>
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Make the current window big, but leave others context
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

nnoremap <leader><leader> <c-^>
