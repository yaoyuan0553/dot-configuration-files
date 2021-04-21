set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

call plug#begin('~/.vim/plugged')

"Plug 'davidhalter/jedi-vim'

" Plug 'Valloric/YouCompleteMe'

" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plug 'jeaye/color_coded'

" Plug 'zxqfl/tabnine-vim'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'justinmk/vim-syntax-extra'

" syntastic
Plug 'vim-syntastic/syntastic'

" ccls language server

" coc 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'MaskRay/ccls'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Kotlin
Plug 'udalov/kotlin-vim'

" C++ semantic highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'

" aosp
Plug 'rubberduck203/aosp-vim'

"easymotion
Plug 'easymotion/vim-easymotion'

Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree'

Plug 'preservim/nerdcommenter'

Plug 'vim-airline/vim-airline'
" airline themes
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

" auto pair
Plug 'jiangmiao/auto-pairs'

Plug 'python-mode/python-mode'

" TypeScript  support
Plug 'leafgarland/typescript-vim'

" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" vue support
" Plug 'posva/vim-vue'

" visual studio color theme
" Plug 'tomasiser/vim-code-dark'
Plug 'yaoyuan0553/vim-code-dark'

" C++ highlight
" Plug 'octol/vim-cpp-enhanced-highlight'

" C++ format
Plug 'rhysd/vim-clang-format'

" Haskell support
Plug 'dag/vim2hs'

" Markdown preview
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}

" color for color codes
" Plug 'chrisbra/Colorizer'

" systemd
Plug 'Matt-Deacalion/vim-systemd-syntax'


call plug#end()

" " All of your Plugs must be added before the following line
" call vundle#end()            " required
filetype plugin indent on    " required
syntax on

set backspace=indent,eol,start

" pymode
let g:pymode_options_max_line_length=100

" turn on rope
" let g:pymode_rope = 1
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_lint_ignore = ["E111","E114","E251", "E231", "E501", "W0401"]

"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_global_ycm_extra_conf = '/home/yuan/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_global_ycm_extra_conf = '$HOME/.ycm_extra_conf.py'
let g:ycm_clangd_binary_path = '/usr/bin/clangd-11'

" nnoremap <F12> :YcmCompleter GoToDeclaration<CR>


" vim2hs options
set nofoldenable    "disable folding

" C++ enhanced highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1


" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" store vim swap files on different location
" mkdir if not exists
silent !mkdir -p ~/.vim/.temp
set backupdir=~/.vim/.temp//
set directory=~/.vim/.temp//

set number

set background=dark
set t_Co=256

" set ycm error highlight color
highlight YcmErrorSection guibg=yellow

" highlight search
set hlsearch 
set incsearch
nnoremap <esc><esc> :silent! nohls<cr>

" fzf search
map <Leader>f :Files<CR>

" Nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>


" Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" pymode auto pep8 fix
map <Leader>8 :PymodeLintAuto<cr>

" copy/paste to/from xclip (system clipboard)
map <F7> :w !xclip<CR><CR>
vmap <F7> :w !xclip<CR><CR>
map <S-F7> :r!xclip -o<CR>

" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" C++ formatter settings
"
let g:clang_format#style_options = {
        \ "AccessModifierOffset" : -4,
        \ "BreakBeforeBraces" : "Custom",
        \ "BraceWrapping" : {
            \ "AfterFunction" : "true",
            \ "AfterEnum" : "true",
            \ "AfterClass" : "false",
            \ "AfterStruct" : "false",
            \ "AfterNamespace" : "true"
        \ },
        \ "ColumnLimit" : 0,
        \ "AllowShortIfStatementsOnASingleLine" : "true",
        \ "AllowShortFunctionsOnASingleLine" : "Inline",
        \ "IndentCaseLabels" : "false",
        \ "Standard" : "C++11"}
"autocmd FileType c,cpp ClangFormatAutoEnable
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp let g:airline_theme = 'codedark'
autocmd FileType c,cpp colorscheme codedark 

au FileType cpp let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})

" ccls keybinds
"

nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> <C-F12> <Plug>(coc-references)
" nn <silent> K :call CocActionAsync('doHover')<cr>

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" bases
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> xB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> xt <Plug>(coc-type-definition)<cr>
nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

nn xx x

" coc.vim settings
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <C-F6> <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

hi CocFloating ctermbg=8

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'


" Colorizer
let g:colorizer_auto_filetype='css,html,vim'

" let synhere = synID(line("."), col("."), 1)
" let oldcolor = synIDattr(synIDtrans(synhere), "fg")
" let what = synIDattr(synhere, "name")
" echo ":highlight " . what . " ctermfg=" . oldcolor

let g:AutoPairsShortcutFastWrap = '<Leader>e'

" wrap lines for vimdiff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
