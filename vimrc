set t_Co=256

let g:ctrlp_working_path_mode=2
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

let g:bufExplorerShowRelativePath=1

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
set vb t_vb=
set title
set ls=2

set nobackup
set directory=$HOME/tmp//,.

"let mapleader = ","
map <Leader>t :FuzzyFinderTextMate<Enter>

" Prevent Arrow Navigator... For training purposes.
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

syntax on

set background=dark
"colorscheme solarized
colorscheme vividchalk
"colorscheme elflord

au BufNewFile,BufRead *.config setfiletype xml

if has("gui_running") 
  if has("win32")
    set guifont=Consolas:h8
  endif
  set guioptions-=T
  set guioptions-=m
  set lines=999
  set columns=999
  set wrap
endif

"define 3 custom highlight groups
hi User1 ctermbg=black ctermfg=grey  guibg=black guifg=grey
hi User2 ctermbg=black ctermfg=yellow guibg=black guifg=yellow
hi User3 ctermbg=black ctermfg=green guibg=black guifg=green

set statusline=
set statusline+=%1*  "switch to User1 highlight
set statusline+=%F    "full filename
set statusline+=%2*  "switch to User2 highlight
set statusline+=%y   "filetype
set statusline+=%3*  "switch to User3 highlight
set statusline+=(%l,%c)   "line number

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
