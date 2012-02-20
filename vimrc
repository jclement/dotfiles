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
  "set background=dark
  "colorscheme solarized
  colorscheme vividchalk
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

map <Leader>u <Plug>MakeGreen

" CTRL-P searching (run ClearAllCtrlPCaches) after changing the list of paths to ignore
let g:ctrlp_working_path_mode=0 " 2 = first occurance of .git or root.dir
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

let g:bufExplorerShowRelativePath=1

" Highlighting: Setup some nice colours to show the mark positions.
hi default ShowMarksHLl ctermfg=black ctermbg=white cterm=bold guifg=blue guibg=white
hi default ShowMarksHLu ctermfg=black ctermbg=white cterm=bold guifg=blue guibg=white
hi default ShowMarksHLo ctermfg=black ctermbg=white cterm=bold guifg=blue guibg=white
hi default ShowMarksHLm ctermfg=black ctermbg=white cterm=bold guifg=blue guibg=white

" Don't leave visual move when changing indentation...
vmap > >gv
vmap < <gv

autocmd FileType ruby setlocal foldmethod=syntax nofoldenable
autocmd FileType ruby setlocal indentexpr=GetRubyIndent() nosmartindent 
autocmd FileType ruby compiler rubyunit
autocmd FileType markdown map <leader>r :!mdr --open % <cr><cr>

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
