" == Lusty Explorer ========================================
" <Leader>lf  - Opens filesystem explorer.
" <Leader>lr  - Opens filesystem explorer at the directory of the current file.
" <Leader>lb  - Opens buffer explorer.
" <Leader>lg  - Opens buffer grep. 

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
set vb t_vb=
set title
set ls=2

set nobackup
set directory=$HOME/tmp//,.

"let mapleader = ","
map <Leader>t :FuzzyFinderTextMate<Enter>

syntax on


au BufNewFile,BufRead *.config setfiletype xml

if has("gui_running") 
  if has("win32")
    set guifont=Consolas:h8
  else
    set guifont=Monospace\ 8
  endif
  set guioptions-=T
  set guioptions-=m
  set lines=999
  set columns=999
  set wrap
  set background=dark
  colorscheme solarized
else
  colorscheme vividchalk
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

" CTRL-P searching (run ClearAllCtrlPCaches) after changing the list of paths to ignore
let g:ctrlp_working_path_mode=0 " 2 = first occurance of .git or root.dir
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

let g:bufExplorerShowRelativePath=1

" Highlighting: Setup some nice colours to show the mark positions.
hi default ShowMarksHLl ctermfg=black ctermbg=white cterm=bold guifg=blu
hi default ShowMarksHLu ctermfg=black ctermbg=white cterm=bold guifg=blu
hi default ShowMarksHLo ctermfg=black ctermbg=white cterm=bold guifg=blu
hi default ShowMarksHLm ctermfg=black ctermbg=white cterm=bold guifg=blu

" Don't leave visual move when changing indentation...
vmap > >gv
vmap < <gv
