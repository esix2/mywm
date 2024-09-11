" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store lots of :cmdline history
set history=500

" Show line numbers
set nu

"set nowrap

" Autoindent when starting new line
"set autoindent
set smartindent
set lazyredraw

" Ignore case when searching
"set ignorecase

" Don't ignore case when search has capital letter
set smartcase

" Enable highlighted case-insensitive incremential search
set incsearch

" Enble search highlighting
set hlsearch

" Always show window statuses
set laststatus=2

" Statusline style
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

" Show the size of block one selected in visual mode
set showcmd

" Hide buffers
set hidden
set visualbell

" Indent using four spaces
set expandtab smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set gcr=a:block-blinkon0

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
" autocmd VimEnter * call ToggleFullscreen()

" Show the line and column number of the cursor position
set ruler

" Highlight line under cursor
"set cursorline
"set cursorcolumn
"set smartindent
"vnoremap // y/<C-R>"<CR>


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
"nmap <F2> 80<bar>eli<cr><esc><home>

vnoremap <C-c> "+y
vnoremap <C-v> "+p
vnoremap <C-x> "+x
set clipboard=unnamedplus

set number "acticvates line numbers
" Advanced tab completion for :
set wildmenu

""load vim setting for bash files
"autocmd BufNewFile,BufRead *.sh so ~/.vim/bash.vim
"load vim setting for *.tex files
autocmd BufNewFile,BufRead *.tex so ~/.vim/latex.vim
""load vim setting for python files
autocmd BufNewFile,BufRead *.py so ~/.vim/python.vim
""load vim setting for python files
"autocmd BufNewFile,BufRead *.m so ~/.vim/matlab.vim
""load vim setting for c++ files
"autocmd BufNewFile,BufRead *.cpp so ~/.vim/cpp.vim
"autocmd BufNewFile,BufRead *.h so ~/.vim/cpp.vim

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
highlight MatchParen ctermbg=red ctermfg=grey
set hlsearch
hi Search ctermbg=white
hi Search ctermfg=Red
"colorscheme mycolor

set wildignore=*.pdf,*.mp3,*.mp4,*.mkv,*.ods,*.odt,*.out
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
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
silent! if plug#begin('~/.vim/plugged')
"My old ones
Plug 'kana/vim-fakeclip'
Plug 'mbbill/undotree'
Plug 'KarimElghamry/vim-auto-comment'
"Plug 'junegunn/fzf', { 'do': {-> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
endif

""" Autocomment plugin config
let g:inline_comment_dict = {
        \'//': ["js", "ts", "cpp", "c", "dart"],
        \'#': ['py', 'sh'],
        \'%': ['tex'],
        \'"': ['vim'],
        \}
let g:block_comment_dict = {
        \'/*': ["js", "ts", "cpp", "c", "dart"],
        \'"""': ['py'],
        \}
let g:autocomment_map_keys = 0
" Inline comment mapping
vnoremap <silent><F3> :AutoInlineComment<CR>
nnoremap <silent><F3> :AutoInlineComment<CR>

" Block comment mapping
vnoremap <silent><F4> :AutoBlockComment<CR>
nnoremap <silent><F4> :AutoBlockComment<CR>



" Who am I? The complete path of the current file
map <F1> :echo expand('%:p')<CR>

" Compile the current file (for C++)
"map <F5> :p terminal p

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
noremap ; gT
noremap _ gt





""" Configs starting with leader (,)
    nmap ,t :tabedit 
    nmap ,f :Files<CR>
    "Reload vimrc
    nmap ,rl :source $MYVIMRC<CR>


" fzf settings
let g:fzf_layout = {'down' : '40%' }
"nmap <C-f>  :Files<CR>
vmap ? y:Ag <C-R>=escape(@",'/\')<CR><CR>

