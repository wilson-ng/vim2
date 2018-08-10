" Activate fzf
set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '**/cache/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let mapleader=","
nnoremap <silent> <leader>t :FZF -m<CR>

if !has('macunix') 
  set clipboard=unnamedplus
endif

" Show Line Number
set number
set title
set noerrorbells
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" Set Tabstop / width = 4
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

execute pathogen#infect()

syntax enable
set background=dark
colorscheme wombat256i
" let g:solarized_termcolors=256

" Fast saving <leader>w
nmap <leader>w :w!<cr>

" Mapping search using "/" and backwards search using "?"
map <space> /
map <c-space> ?

" Disable highlight <leader><cr>
map <silent> <leader><cr> :noh<cr>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map tn gt
map tp gT
nmap tt :tabs<CR>

" Open nerdtree
map <leader>e :NERDTreeToggle<CR>

" Map Ack
map <leader>g :Ack

" Map Tagbar
nmap <leader>b :TagbarToggle<CR>

" Close vim if only window left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab

" set Lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" Copy/Paste
if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
  map <C-p> "+p
  vnoremap <C-c> "+y
else 
  map <C-p> "+p
  vnoremap <C-c> "+y
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set ruler                                                                       "shows line number and column"
set rulerformat=%l\:%c                                                          "better ruler format"
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l\:%c%V%)

set colorcolumn=80
highlight ColorColumn ctermbg=59 guibg=lightgrey

"" Directories for swp files
set nobackup
set noswapfile

filetype plugin indent on
