set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

"Plugin 'davidhalter/jedi-vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-fugitive'

Plugin 'python-mode/python-mode'

" TypeScript  support
Plugin 'leafgarland/typescript-vim'

" vue support
Plugin 'posva/vim-vue'

" visual studio color theme
Plugin 'tomasiser/vim-code-dark'

" C++ highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" C++ format
Plugin 'rhysd/vim-clang-format'

" Haskell support
Plugin 'dag/vim2hs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_ignore = ["E111","E114","E251", "E231", "E501", "W0401"]

"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_global_ycm_extra_conf = '/home/yuan/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" vim2hs options
set nofoldenable    "disable folding

" C++ enhanced highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

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

" highlight search
set hlsearch 
set incsearch
nnoremap <esc><esc> :silent! nohls<cr>

" Hotkey mapping
map <C-n> :NERDTreeToggle<CR>

" pymode auto pep8 fix
map <Leader>8 :PymodeLintAuto<cr>

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
        \ "AllowShortIfStatementsOnASingleLine" : "true",
        \ "AllowShortFunctionsOnASingleLine" : "Inline",
        \ "IndentCaseLabels" : "false",
        \ "Standard" : "C++11"}
"autocmd FileType c,cpp ClangFormatAutoEnable
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
