set nocompatible 
set hidden
set wildmenu
set ignorecase
set smartcase
"set cursorline
"set showtabline=2
set tabstop=2
set shiftwidth=2
set hlsearch
set incsearch
set nobackup
set number
set nowrap
set autoindent
set smartindent
set expandtab
set vb t_vb=
set title
set ls=2

syntax on

colorscheme elflord

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
