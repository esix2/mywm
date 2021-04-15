set tabstop=4
"set softtabstop=1
set expandtab
set shiftwidth=4
set smarttab "set tab size
set autoindent
"set smartindent
"vnoremap // y/<C-R>"<CR>

"Reload vimrc
nmap ,rl :source $MYVIMRC<CR>

" mapps + and - for going misspelled words
noremap + ]s
noremap - [s
nmap -- [sz=
nmap ++ ]sz=

"disbale arrow keys
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" line break atfter column 80
nmap <F2> 80<bar>eli<cr><esc><home>

vnoremap <C-c> "+y 
vnoremap <C-v> "+p 
vnoremap <C-x> "+x 
set clipboard=unnamedplus

set number "acticvates line numbers
" Advanced tab completion for :
set wildmenu

"load vim setting for bash files
autocmd BufNewFile,BufRead *.sh so ~/.vim/bash.vim
"load vim setting for *.tex files
autocmd BufNewFile,BufRead *.tex so ~/.vim/latex.vim
"load vim setting for python files
autocmd BufNewFile,BufRead *.py so ~/.vim/python.vim
"load vim setting for python files
autocmd BufNewFile,BufRead *.m so ~/.vim/matlab.vim
" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8") || has("gui_running")
if v:version >= 700
if has("gui_running")
set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
else
" xterm + terminus hates these
set list listchars=tab:»·,trail:·,extends:>,nbsp:_
endif
else
set list listchars=tab:»·,trail:·,extends:…
endif
else
if v:version >= 700
set list listchars=tab:>-,trail:.,extends:>,nbsp:_
else
set list listchars=tab:>-,trail:.,extends:>
endif
endif

" puts parantheses and brackets around visual block
map \pp c()<ESC>P  
map \cc c{}<ESC>P
map \bb c[]<ESC>P
map \qq c""<ESC>P

" removes the last and the first charcters and then puts parantheses and brackets around visual block
map \p v%<ESC>`>r)<ESC>`<r(<ESC>
map \c v%<ESC>`>r}<ESC>`<r{<ESC>
map \b v%<ESC>`>r]<ESC>`<r[<ESC>
map \q <ESC>`>r"<ESC>`<r"<ESC>
map \r v%<ESC>`>r <ESC>`<r <ESC>

" set n to jump to next match
noremap n %

" Syntax highlighting in many languages
filetype plugin on
syntax on
colorscheme pink-moon
highlight Wildmenu   ctermfg=black ctermbg=white
highlight MatchParen ctermbg=black ctermfg=grey
"colorscheme mycolor

set wildignore=*.pdf,*.mp3,*.mp4,*.mkv,*.ods,*.odt
"diffoff
"if &diff
"    set scrollbind
"endif
"replace XYZ1 with XYZ2
":%s/XYZ\zs\(\d\+\)/\=(1+submatch(0))/g
"
"
"
"Plugins
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
call plug#end()


let mapleader = ","
"Shortcut to move to tabs
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
