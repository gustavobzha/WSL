"this disables compatibility with vi, 
"so if it's not set most upgrades from vim is disabled
set nocompatible

"this ativates the plugin files and inent files 
filetype indent plugin on

"permitis the syntax highlighted
syntax on

"set mouse support
"set mouse=a

"set a column in the cursor
set cursorcolumn

"set the color for the column
hi CursorColumn ctermbg=8

"set the number in the left as relative
set relativenumber

"set the indentation as automatic
set autoindent

"try to separate the indentation by type
set smartindent

" put the number in left n cursor line as the corect line
set nu

"permits usage for clipboard of system in vim and vice-versa
set clipboard+=unnamedplus

"set the table to stop in 8 spaces
set tabstop=8
set shiftwidth=4

" if you want to run vim in a terminal
set termguicolors 

"put no background for vim
hi Normal guibg=NONE ctermbg=NONE

"set max number of times the key can be pressed
"let g:hardtime_maxcount=3

"show msg when hardtime is on
"let g:hardtime_showmsg=1

"auto ativate hardtime
"let g:hardtime_default_on=1

" run the fixers when save
let g:ale_fix_on_save=1

"set vim to hidden markdown  (for json is quotes for example)simbols unless are set
set conceallevel=2

"hidde cursor when visual insert or normal
set concealcursor=vin



"put f6 to try fix current file
nmap <F6> <Plug>(ale_fix)

"opens firefox with markdown code when opened .MD file
let vim_markdown_preview_toggle=1
let vim_markdown_preview_browser='Firefox'


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



"set the colorscheme for vim
colorscheme one
set background=dark


" set a preview search
set inccommand=split

nnoremap <Leader>ev :vsplit ~/.config/nvim/init.vim
nnoremap <Leader>sv :source ~/.config/nvim/init.vim


nnoremap <C-f> :Rg<space>
 
"Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

"Set right margin column in vim
set colorcolumn=80

"Emmet shortcuts
"let g:user_emmet_mode='n' "only enable normal mode functions.
let g:user_emmet_leader_key='<A-,>'


" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> C <Plug>(fern-action-new-dir)
  nmap <buffer> c <Plug>(fern-action-new-file)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark-toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END


" Copy Matches Regex
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
