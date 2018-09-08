" 2018/09/08
" vim用設定ファイル
" プラグイン管理にはdeinを使用 (プラグインは~/.cache/reposに保存される)
" dein.tomlは~/.vimfilesに置く

if &compatible
    set nocompatible
endif

"deinの設定{{{

"dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

"プラグイン読み込み&キャッシュ作成
let s:toml_file = expand('~/.vimfiles/dein.toml')
"let s:toml_lazy_file = expand('~/.vimfiles/dein_lazy.toml')
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file,       {'lazy':0})
    "call dein#load_toml(s:toml_lazy_file,  {'lazy':1})
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on

"不足プラグインの自動インストール
if dein#check_install()
    call dein#install()
endif

" }}}



" 基本設定 {{{

" #### 基本事項 ####
set backspace=start,eol,indent "BSで先頭、改行、インデント削除可能

" #### Encode ####
" 下記の指定は環境によって文字化けする可能性がある
scriptencoding utf-8
set encoding=UTF-8 
set fileencodings=UTF-8,cp932,sjis,utf-16le
set termencoding=UTF-8
set fileformats=unix,dos

" #### 表示設定 ####
set number "行番号表示
set title "編集中のファイル名を表示
set showmatch "カッコ入力時に対応する括弧を表示
syntax on "コード色分け
set tabstop=4 "インデントをスペース４個
set shiftwidth=4
set expandtab "ソフトtab
set smartindent "オートインデント
set list listchars=tab:>-,trail:-,eol:↲  "不可視文字を表示
set cursorline "カーソル行ハイライト
set hlsearch " 検索時にハイライト化する
set incsearch " インクリメンタルに検索する

" #### カラースキーム ####
set t_Co=256 "256色モード
colorscheme jellybeans

" #### マッピング ####
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l> "検索ハイライトの一時無効化を<Ctr+l>で実現, :nohを打つ必要がなくなる
inoremap <C-j> <esc> "インサートモードでCtrl+jでESC
noremap! <C-j> <esc> "挿入、コマンドライン
"}}}
