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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:pymode_rope_complete_on_dot = 0

" let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" store vim swap files on different location
set backupdir=/home/yuyao/.vim/.temp//
set directory=/home/yuyao/.vim/.temp//

set number

" Hotkey mapping
map <C-n> :NERDTreeToggle<CR>
