set fenc=utf-8
set number
"设置用中文帮助文档
set helplang=cn

"设置显示空格和tab
"set list
"set listchars=tab:>-,trail:-

"设置tab宽度为4字符
set ts=8 sts=4 sw=4 noexpandtab

" 插件设置
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
" NERDTree文件树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" NERDTree 中显示git信息
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

"================================
" NERDTree
"================================

"<F3>打开NERDTree
map <F3> :NERDTreeToggle<CR>

"打开Vim时候自动打开NERDTree
autocmd vimenter * NERDTree

" \ + r 定位当前文件所在目录，这个很有用
" 当前从左树进入，又要将当前目录定位到当前位置用这个
map <leader>r :NERDTreeFind<cr> <C-w><C-w>

"显示书签"
let NERDTreeShowBookmarks=1

" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" git显示
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}
