" ----------------------------------------------------------------------------
" ultisnips
" ----------------------------------------------------------------------------

let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" ----------------------------------------------------------------------------
" vim-multiple-cursors
" ----------------------------------------------------------------------------

let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" ----------------------------------------------------------------------------
" vim-move
" ----------------------------------------------------------------------------

let g:move_key_modifier = 'C'

" ----------------------------------------------------------------------------
" auto-pairs
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" vim-operator-user
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" wildfire.vim
" ----------------------------------------------------------------------------

map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)

" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------
  
let g:indentLine_char = '│'

" ----------------------------------------------------------------------------
" tarbar
" ----------------------------------------------------------------------------

"inoremap <F2> <esc>:TagbarToggle<cr>
"nnoremap <F2> :TagbarToggle<cr>
"
"let tagbar_left=1
"let tagbar_width=32
"let g:tagbar_sort = 0
"let g:tagbar_compact=1
"let g:tagbar_type_cpp = {
" \ 'ctagstype' : 'c++',
" \ 'kinds'     : [
"     \ 'c:classes:0:1',
"     \ 'd:macros:0:1',
"     \ 'e:enumerators:0:0', 
"     \ 'f:functions:0:1',
"     \ 'g:enumeration:0:1',
"     \ 'l:local:0:1',
"     \ 'm:members:0:1',
"     \ 'n:namespaces:0:1',
"     \ 'p:functions_prototypes:0:1',
"     \ 's:structs:0:1',
"     \ 't:typedefs:0:1',
"     \ 'u:unions:0:1',
"     \ 'v:global:0:1',
"     \ 'x:external:0:1'
" \ ],
" \ 'sro'        : '::',
" \ 'kind2scope' : {
"     \ 'g' : 'enum',
"     \ 'n' : 'namespace',
"     \ 'c' : 'class',
"     \ 's' : 'struct',
"     \ 'u' : 'union'
" \ },
" \ 'scope2kind' : {
"     \ 'enum'      : 'g',
"     \ 'namespace' : 'n',
"     \ 'class'     : 'c',
"     \ 'struct'    : 's',
"     \ 'union'     : 'u'
" \ }
"\ }

" ----------------------------------------------------------------------------
" vim-fswitch
" ----------------------------------------------------------------------------

nmap <silent> <Leader>fs :FSHere<cr>

" ----------------------------------------------------------------------------
" vim-protodef
" ----------------------------------------------------------------------------

let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
let g:disable_protodef_sorting=1

" ----------------------------------------------------------------------------
" nerdcommenter
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------

inoremap <F2> <esc>:NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>

let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" ----------------------------------------------------------------------------
" vim-instant-markdown
" ----------------------------------------------------------------------------

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

nnoremap <Leader>md :InstantMarkdownPreview<CR>


" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" vim-gitgutter
" ----------------------------------------------------------------------------
  
set updatetime=250

set signcolumn=yes

" ----------------------------------------------------------------------------
" ale
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" minibufexpl
" ----------------------------------------------------------------------------

inoremap <F6> <esc>:MBEToggle<cr>
nnoremap <F6> :MBEToggle<cr>

" ----------------------------------------------------------------------------
" gundo.vim
" ----------------------------------------------------------------------------

nnoremap <Leader>ud :GundoToggle<CR>

set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

if !strlen(finddir('~/.vim/undofiles'))
echo "undofiles[~/.vim/undofiles] not found. Now it's being created. Press ENTER or type command to continue."
!mkdir -p ~/.vim/undofiles
endif

if v:version >= 703
set undodir=~/.vim/undofiles
set undofile
set colorcolumn=+1 
endif

" ----------------------------------------------------------------------------
" ctrlsf.vim
" ----------------------------------------------------------------------------

nnoremap <c-f> :CtrlSF<CR>

" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------

let g:ctrlp_map = '<s-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vendor/bundle/*\|vendor/cache/*\|public\|spec)$',
  \ 'file': '\v\.(exe|so|dll|swp|log|jpg|png|json)$',
  \ }

" ----------------------------------------------------------------------------
" YouCompleteMe
" ----------------------------------------------------------------------------

set completeopt-=preview

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
inoremap <leader>; <C-x><C-o>

let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

" }}}
