let g:loaded_python3_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let mapleader = "\<Space>"
let g:airline_powerline_fonts = 1

let g:blamer_enabled = 1
let g:blamer_delay = 100


let NERDTreeShowHidden=1

set tags=tags
set number
set shiftwidth=4 

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to local denifition
noremap <leader>w gd
noremap <leader>s g*

" Go to coc definition jump
nnoremap <C-]> <Plug>(coc-definition)
nnoremap <C-[> <C-o>

" neovim shortcuts
nnoremap <leader>ff :FZF<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>

let g:NERDTreeWinSize=30
nnoremap <C-w> :NERDTreeToggle<CR>
nnoremap <C-s> :NERDTreeFind<CR>
nnoremap <leader>r :NERDTreeFind<CR>
nnoremap <C-r> :RG<CR>

" Edit & Reload vim config
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vr :so $MYVIMRC<CR>

" Vim Key Map
nnoremap <leader>o a<Enter><Esc>

" Show Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Dart Format Key Map
nnoremap <leader>df :DartFmt<CR>

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

call plug#begin("~/.vim/plugged")
 " Plugin Section "
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'kylechui/nvim-surround'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'scrooloose/nerdtree'

 " coc for tslinting, auto complete and prettier
 Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
 " coc extensions
 let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-eslint', 'coc-prettier']
 let g:coc_node_path = '/usr/local/bin/node'
 " vim-tsx will do all the coloring for jsx in the .tsx file
 Plug 'ianks/vim-tsx'
 " typescript-vim will do all the coloring for typescript keywords
 Plug 'leafgarland/typescript-vim'
 Plug 'dart-lang/dart-vim-plugin'

 " == AUTOCMD ================================ 
 " by default .ts file are not identified as typescript and .tsx files are not
 " identified as typescript react file, so add following
 au BufNewFile,BufRead *.ts setlocal filetype=typescript
 au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

 Plug 'APZelos/blamer.nvim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'voldikss/vim-floaterm'
 Plug 'tpope/vim-fugitive'
 Plug 'vijaymarupudi/nvim-fzf'
 Plug 'folke/zen-mode.nvim'	

call plug#end()

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix
