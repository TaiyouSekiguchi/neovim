"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=/Users/sunsun/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/sunsun/.cache/dein')
	call dein#begin('/Users/sunsun/.cache/dein')
	call dein#load_toml('/Users/sunsun/.config/nvim/dein.toml', {'lazy': 0})
	call dein#load_toml('/Users/sunsun/.config/nvim/dein_lazy.toml', {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable


"End dein Scripts----------------------

"-------------------my_vimrc-------------------------

let mapleader = "\<SPACE>"

" setting
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set relativenumber
" 現在の行を強調表示
" set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable
"set background=dark
"let g:solarized_termcolors=256
colorscheme molokai

" Tab系
" 不可視文字を可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" jjでノーマルモードへ
inoremap <silent> jj <ESC>

" スワップファイルを作らない
set noswapfile
"　英語表記
let $LANG='en_US.UTF-8'

"　行頭、行末移動
noremap <S-h> 0
noremap <S-l> $

"　ページ移動
noremap <S-j> 7j
noremap <S-k> 7k
noremap <C-j> <C-f>
noremap <C-k> <C-b>

"　インクリメント、デクリメント
noremap + <C-a>
noremap - <C-x>

"　ペーストインデント自動化
nnoremap p ]p
nnoremap P ]P

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"　タブ
nnoremap <Leader>nb :tabe<CR>
noremap ]b :tabn<CR>
noremap [b :tabp<CR>

"　タグ作成
nnoremap <f5> :!ctags -R -f .tags<CR>
set tags=.tags;~
autocmd BufWritePost * call system("ctags -R -f .tags")
nnoremap ]t <C-]>
nnoremap [t <C-t>
nnoremap <Leader>vt :vsp<CR> :exe("tjump ".expand('<cword>'))<CR> <C-w>l

"　quickfix
nnoremap <f7> :make!<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

" terminal
set sh=zsh
nnoremap @t :tabe<CR>:terminal<CR>
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> jj <C-\><C-n>

" man
nnoremap <Leader>man <S-k>

" window
nmap <Leader>w [window]
noremap [window]h <C-w>h
noremap [window]j <C-w>j
noremap [window]k <C-w>k
noremap [window]l <C-w>l
noremap [window]q <C-w>q
noremap [window]v <C-w>v

"　予測変換
inoremap <C-k> <C-p>
inoremap <C-j> <C-n>

"-------------------my_vimrc-----------------------

"-------------------for Fern-----------------------

" <Leader>にSpaceキー割り当て
let mapleader = "\<Space>"
" 隠しファイルを表示する
let g:fern#default_hidden=1
" Fern .をSpace+eキーに置き換え
nnoremap <silent> <Leader>e :<C-u>Fern .<CR>

"-------------------for Fern-----------------------

"-------------------for Fern-preview---------------

function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

"-------------------for Fern-preview---------------

"-------------------for Ultisnips---------------

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit='vertical'

"-------------------for Ultisnips---------------
