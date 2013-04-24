call pathogen#infect()

syntax on

filetype plugin indent on

colorscheme solarized

set background=dark
set secure
set nowrap
set paste
set autoindent
set expandtab
set modeline
set modelines=5
set number
set hlsearch
set smartcase
set showmatch
set wildmode=longest,list
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set termencoding=utf8
set fileformats=mac,unix,dos
set visualbell t_vb=
set foldmethod=indent
set nofoldenable
set nocompatible
set complete=.,b,u,]
set completeopt=menu,preview
set t_Co=256
set laststatus=2
set splitbelow
set incsearch

" Statusline
"
set statusline=
set statusline +=\ %n\ %*      "buffer number
set statusline +=%{&ff}%*      "file format
set statusline +=%y%*          "file type
set statusline +=\ %<%F%*      "full path
set statusline +=\ %m%*        "modified flag
set statusline +=%=%5l%*       "current line
set statusline +=/%L%*         "total lines
set statusline +=%4v\ %*       "virtual column number
set statusline +=0x%04B\ %*    "character under cursor

" Needed to make solarized show
" the correct colors in iTerm2
let g:solarized_termtrans = 1

" FTP specific
"
" Open files in a new tab
let g:netrw_browse_split=3

" Better tab hotkeys
"
nmap <C-t> :tabnew<CR>
nmap <C-n> :tabn<CR>
nmap <C-p> :tabp<CR>

" Jump to definition (Python)
"
nmap gf <C-w>gf

" Clean highlights
"
nnoremap <CR> :noh<CR><CR>

" Fast copy and paste on OSX
"
vnoremap <silent> ,y y<cr>:call system('pbcopy', @0)<cr>
nnoremap <silent> ,p :r ! pbpaste<cr>

" Insert pdb breakpoint
nnoremap <leader>p oimport pdb; pdb.set_trace()

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" Close buffer without losing split
" https://coderwall.com/p/cridkq
"
nmap <leader>c :ene<CR>:bd #<CR>

" Delimit the 80th column
"
set colorcolumn=80

" Automatically split windows at 79 columns
" https://coderwall.com/p/suj3fq
"
set fillchars+=vert:\ ,

highlight VertSplit ctermbg=NONE ctermfg=235 gui=NONE

function! SplitByColumnSize(col)
    let l:s_s = &nu ? a:col + &numberwidth : a:col
    let l:s_t = trunc(round(winwidth(0) / round(l:s_s)))
    let l:s_c = 1

    " Split window s_t times
    while l:s_c < l:s_t
        vne
        wincmd w
        let l:s_c = l:s_c + 1
    endwhile

    wincmd H

    let l:s_c = 1

    " Resize splits
    while l:s_c < l:s_t
        exe 'vert resize '.l:s_s
        wincmd w
        let l:s_c = l:s_c + 1
    endwhile
endfunction

command PySplit call SplitByColumnSize(79)

" Comment the line below to not split at startup
PySplit

" Python autocomplete and PEP8 check
au BufRead,BufNewFile *.py SyntasticCheck

" Syntastic exceptions
let g:syntastic_html_checkers = []  " don't check .html files
let g:syntastic_xhtml_checkers = []  " don't check .html files
let g:syntastic_xml_checkers = []  " don't check .html files

" vim-multiple-cursors bindings
let g:multi_cursor_use_default_mapping = 0

let g:multi_cursor_next_key = '<S-n>'
let g:multi_cursor_prev_key = '<S-p>'
let g:multi_cursor_skip_key = '<S-x>'
let g:multi_cursor_quit_key = '<S-c>'

" GitGutter specific
highlight clear SignColumn
