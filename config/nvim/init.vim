let mapleader="\<Space>"
let maplocalleader="\\"

if &loadplugins
  if has('packages')
    " git submodule add --name xxx git@github.com:xxx.git config/nvim/pack/plugins/opt/xxx
    packadd! vim-colors-xcode
    packadd! nerdtree
    " packadd! nerdtree-tabs

    packadd! plenary
    packadd! telescope

    " packadd! copilot.vim
    " packadd! coq
    packadd! coc
    source ~/.config/nvim/coc.vim

    packadd! nerdcommenter
    source ~/.config/nvim/nerdcommenter.vim

    packadd! vim-surround
    packadd! vim-test
    " packadd! vim-ultest

    packadd! vim-rails
    packadd! vim-bundler
    packadd! vim-rake
    packadd! vim-slim
    packadd! vim-ruby
    packadd! vim-endwise
    packadd! vim-sensible
    packadd! vim-sleuth
    packadd! vim-obsession
    packadd! vim-fugitive
    packadd! vim-rhubarb

    packadd! vim-javascript
    packadd! typescript-vim
    packadd! vim-jsx-typescript
  endif
endif

set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
" set tabstop=2               " number of columns occupied by a tab 
" set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
" set expandtab               " converts tabs to white space
" set shiftwidth=2            " width for autoindents
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set noswapfile            " disable creating swap file
" set statusline=%{FugitiveStatusline()}
 
" open new split panes to right and below
set splitright
set splitbelow

if !isdirectory($HOME . '/.cache/vim/undodir')
    call mkdir($HOME . '/.cache/vim/undodir', 'p', 0700)
endif
set undodir=$HOME/.cache/vim/undodir " persistent undo
set undofile

" color schemes
if (has('termguicolors'))
  set termguicolors
endif
colorscheme xcodedark

" Code completion
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-solargraph']
let g:endwise_no_mappings = 1

" Telescope
lua << EOF
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      n = {
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
      },
      i = {
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
      },
    },
  }
}
EOF
nnoremap <leader>qq <cmd>Telescope grep_string<cr>
vnoremap <leader>qq "zy<cmd>exec 'Telescope grep_string default_text=' . escape(@z, ' ')<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fq <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>nn <cmd>NERDTreeFind<cr>
nnoremap <leader>nt <cmd>NERDTreeToggle<cr>

nnoremap <leader>qf <cmd>CocFix<cr>

nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

tmap <ESC> <C-\><C-n> " Escape :terminal
