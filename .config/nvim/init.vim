source $HOME/.config/nvim/plug-config/coc.vim
set encoding=utf-8
set number relativenumber
syntax enable
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=7
set backspace=indent,eol,start
filetype plugin on
set nohlsearch
set hidden
set nowrap
set iskeyword-=_

"Python
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'ThePrimeagen/harpoon'
Plug 'simrat39/rust-tools.nvim'

call plug#end()

"Ale config
call ale#Set('python_flake8_options', '--config=$HOME/.config/flake8')
let g:ale_fixers = {"python": ["black", "isort"]}
let g:ale_linters = {"python": ["flake8", "mypy"]}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_python_auto_pipenv = 1
let g:ale_python_flake8_use_global = 1

nmap <silent> <C-q> <Plug>(ale_previous_wrap)
nmap <silent> <C-e> <Plug>(ale_next_wrap)
nmap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> fr :ALEFindReferences<CR>

" LSP

let g:completion_enable_snippet = 'UltiSnips'
let g:python3_host_prog = '/Users/mariebisbo/.pyenv/shims/python'

" colorscheme nord
colorscheme gruvbox
set background=dark

" Remappings

let mapleader = " "
map <C-p> :Files<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

nnoremap Y y$

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

"Set depending on mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

" Nercommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

let g:UltiSnipsExpandTrigger = "<nop>"

" Telescope

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fw <cmd>Telescope grep_string<cr>

lua << EOF
require('telescope').setup {
  extensions = {
    fzy_native = {
      override_generic_sorter = true,  
      override_file_sorter = true,     
                                       
    }
  }
}

require('telescope').load_extension('fzy_native')
EOF

