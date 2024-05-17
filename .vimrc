filetype on
filetype indent on
filetype plugin on

syntax on
set background=light
set mouse=a
set number
set ai
set clipboard=unnamed
set hidden
" set relativenumber
"set macligatures
set guifont=Fira\ Code:h14
set cursorline
set shiftwidth=2
set tabstop=2
set expandtab
set nocompatible
set noswapfile
set nowrap
set termguicolors
set updatetime=300
set signcolumn=yes

let g:solarized_termcolors=256
let NERDTreeShowHidden=1
let mapleader = " "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
"Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomtom/tcomment_vim'
"Plugin 'trevorrjohn/vim-obsidian'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ap/vim-css-color'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mhinz/vim-startify'
Plugin 'w0rp/ale'
Plugin 'ntk148v/vim-horizon'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'yggdroot/indentline'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'raimondi/delimitmate'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-dispatch'
"Plugin 'preservim/vimux'
"Plugin 'christoomey/vim-tmux-runner'
"Plugin 'jgdavey/vim-turbux'
Plugin 'vim-test/vim-test'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'neoclide/coc.nvim'

" Ruby stuff
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'ngmy/vim-rubocop'
"Plugin 'neovim/nvim-lspconfig'
" Ruby stuff

Plugin 'easymotion/vim-easymotion'
Plugin 'wuelnerdotexe/vim-astro'
Plugin 'hashivim/vim-terraform'

" Themes
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'catppuccin/nvim'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
" Themes

call vundle#end()

"colorscheme brogrammer
colorscheme catppuccin-mocha

" Auto Correct
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❗'
let g:ale_sign_warning = '⚠️'
" Auto Correct

" Auto complete
inoremap <c-p> <nop>
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" Auto complete

" Ruby RSpec stuff
" Find the related Ruby spec for any file you open.
function RelatedSpec()
  let l:fullpath = expand("%:p")
  let l:filepath = expand("%:h")
  let l:fname = expand("%:t")
  let l:filepath_without_app = substitute(l:filepath, "app/", "", "")

  " Possible names for the spec/test for the file we're looking at
  let l:test_names = [substitute(l:fname, ".rb$", "_spec.rb", ""), substitute(l:fname, ".rb$", "_test.rb", "")]

  " Possible paths
  let l:test_paths = ["spec", "fast_spec", "test"]

  for test_name in l:test_names
    for path in l:test_paths
      let l:spec_path = path . "/" . l:filepath_without_app . "/" . test_name
      let l:full_spec_path = substitute(l:fullpath, l:filepath . "/" . l:fname, l:spec_path, "")
      if filereadable(l:spec_path)
        return l:full_spec_path
      end
    endfor
  endfor
endfunction

function RelatedSpecVOpen()
  let l:spec_path = RelatedSpec()
  if filereadable(l:spec_path)
    execute ":e " . l:spec_path
  endif
endfunction
" Ruby RSpec stuff

let g:go_fmt_command = "goimports"

let g:NERDTreeWinPos = "right"

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️ '
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_history_log_output = 1

" lightline
let g:lightline = {}
"let g:lightline.colorscheme = 'horizon'
let g:lightline.colorscheme='onehalfdark'

" or this line
let g:lightline = {'colorscheme' : 'horizon'}

nnoremap H ^
nnoremap L $
nnoremap <Leader>j j10j
nnoremap <Leader>k k10k
"
" Allow to leader fs to save files
map <Leader>fs :w<CR>

" Allow to switch to other windows using leader key
"map <Leader>wj <C-w>j
"map <Leader>wl <C-w>l
"map <Leader>wh <C-w>h
"map <Leader>wk <C-w>k
map <Leader>w\ :vsplit<CR>
map <Leader>wc :close<CR>

map <Leader><Tab> <C-^>

map <Leader>ft :NERDTreeToggle<CR>

" Searching for files and folders
map <Leader>pf :Files<CR>
map <Leader>ps :Rg<CR>
map <Leader>ss :BLines<CR>
map <Leader>bb :Buffers<CR>
map <Leader>bd :bd<CR>

let test#strategy = "neovim"
"let test#strategy = "basic"
let g:test#preserve_screen = 1
let test#ruby#rspec#executable = 'bundle exec rspec'
let g:test#echo_command = 0

map <Leader>t :TestNearest<CR>
map <Leader>T :TestFile<CR>
map <Leader>a :TestSuite<CR>
map <Leader>l :TestLast<CR>
map <Leader>g :TestVisit<CR>

map <Leader>vr :source ~/.vimrc<CR>
map <Leader>ve :e ~/.vimrc<CR>

" Ruby stuff
"map <Leader>r :RuboCop<CR>
map <Leader>rs :call RelatedSpecVOpen()<CR>
map <Leader>gd :call CocActionAsync('jumpDefinition')<CR>
"" Run test in tmux from command
let g:turbux_command_prefix = 'bundle exec'
let g:no_turbux_mappings = 0

autocmd BufEnter *.arb :setlocal filetype=ruby
autocmd BufEnter *.thor :setlocal filetype=ruby

function! HighlightRepeats() range
  syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()
hi link Repeat Statement
