" Activate fzf
if filereadable("/usr/local/opt/fzf")
    set rtp+=/usr/local/opt/fzf
else 
    set rtp+=~/.fzf
endif
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '**/cache/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
nnoremap <silent> <leader>t :FZF -m<CR>

set clipboard=unnamedplus

" Show Line Number
set number

" Set Tabstop / width = 4
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

execute pathogen#infect()

colorscheme wombat256mod

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

" set Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Copy/Paste
if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile


