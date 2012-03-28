call pathogen#infect()

syntax on

colorscheme zenburn
set background=dark

set exrc
set secure
set ic
set nowrap
set paste
set autoindent
set expandtab
set modeline
set modelines=5

set nu
set is hls ic scs
set sm
set wildmode=longest,list
set shiftwidth=4
set sts=4
set tabstop=4
set backspace=2
set termencoding=utf8
set ff=unix
set visualbell t_vb=

nmap <C-t> :tabnew<CR>
nmap <C-n> :tabn<CR>
nmap <C-p> :tabp<CR>

map <C-e> :call Pep8()<CR>

filetype plugin on

set t_Co=256
set laststatus=2

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

nmap gf <C-w>gf

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
