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
set termencoding=utf8
set ff=unix
set visualbell t_vb=

map <C-t> :tabnew<CR>
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>
map <C-e> :call Pep8()<CR>

filetype plugin on

set t_Co=256
set statusline=%F%m%r%h%w\ (format:\ %{&ff})\ (xy:\ %04l,%02v) 
