set fenc=utf-8
set number
"设置用中文帮助文档
set helplang=cn

" 开启语法高亮
syntax enable
syntax on


"设置混用vim/系统复制粘贴快捷键
set clipboard=unnamed

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
" 异步生成符号索引
Plug 'ludovicchabant/vim-gutentags'
" cpp高亮
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

"================================
" vim-gutentags设置
"================================
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"================================
" NERDTree
"================================

"<F3>打开NERDTree
map <F3> :NERDTreeToggle<CR>

"打开Vim时候自动打开NERDTree
"autocmd vimenter * NERDTree

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


"================================
" cpp 语法高亮设置
"================================
"高亮类，成员函数，标准库和模板
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
"文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
"let g:cpp_experimental_template_highlight = 1
