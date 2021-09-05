set runtimepath^=~/.vim runtimepath+=~/.vim/after
set ignorecase
let &packpath = &runtimepath
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

let g:matchparen_timeout = 5
let g:matchparen_insert_timeout = 5
let g:pyindent_searchpair_timeout = 50
let g:ranger_replace_netrw = 1 


syntax on
filetype on
filetype plugin on
set noerrorbells "No sounds when reaching EOF
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu "line numbers
set nu rnu " Relative line numbers
set number relativenumber
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch "While search you get results
set scrolloff=3 "Keep 3 lines while scrolling down
set sidescrolloff=4 " keep 4 lines on right scroll
set colorcolumn=80 " highlights column to the right of screen
set cursorline
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set completeopt=menu,noinsert,noselect
inoremap <c-c> <ESC>
vnoremap <Leader>y "+y
set encoding=UTF-8
set conceallevel=0

set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%=%l/%L


let g:polyglot_disabled = ['autoindent', 'python']

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'  " Linters and fixers
Plug 'lervag/vimtex' " Latex stuff
" Plug 'ryanoasis/vim-devicons' " Icons and stuff
Plug 'sheerun/vim-polyglot' " Better syntax highlighting

" Plug 'justinmk/vim-sneak'  " Search feature
Plug 'mbbill/undotree' "undo stuff
Plug 'lyuts/vim-rtags', {'for': ['cpp', 'c']} "great for C++
Plug 'majutsushi/tagbar'
"Plug 'osyo-manga/vim-anzu' " Search number with ale
Plug 'nathanaelkane/vim-indent-guides'
Plug 'codehearts/mascara-vim' " Italic stuff
" Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for better latex conceal
Plug 'preservim/nerdcommenter'  " Plug for easy commenting
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'jiangmiao/auto-pairs' " Auto brackets
Plug 'tpope/vim-surround'   " Adding and changing brackets
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"Plug 'clbeggs/vim-unicoder'  " Convert latex to unicode
"Plug 'JuliaEditorSupport/julia-vim'

" Colorschemes
"Plug 'morhetz/gruvbox'
"Plug 'sainnhe/gruvbox-material'
"Plug 'sainnhe/edge'
"Plug 'sainnhe/sonokai'
Plug 'arcticicestudio/nord-vim'
"Plug 'hzchirs/vim-material'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'nightsense/carbonized'
"Plug 'kuntau/ayu-vim' " Ayu colorscheme with italics
"Plug 'cocopon/iceberg.vim'
"Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"Plug 'tyrannicaltoucan/vim-deep-space'
call plug#end()


let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDToggleCheckAllLines = 1

" File Manager Ranger
"nnoremap <C-n> :Ranger<CR>
let g:ranger_map_keys=0
nnoremap <C-t> :Ranger<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Close nerd tree if it is the last window open.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" COCNVIM SETUP
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <C-j> <Plug>(coc-snippets-expand-jump)



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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)

" navigate chunks of current buffer
nmap gj <Plug>(coc-git-prevchunk)
nmap gk <Plug>(coc-git-nextchunk)




" Cosmetics
set termguicolors
set background=light
colorscheme nord
let g:mascara_italic = [ 'Statement', 'Comment', 'ErrorMsg', 'Identifier', 'Type' ] " Comments, error messages, line numbers
let g:mascara_apply_at_startup = 1 " Apply Mascara @ startup
"
"" ALE Linting and Fixing
" let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
highlight ALEWarning ctermbg=DarkMagenta gui=None
highlight ALEError ctermbg=Red gui=None
highlight ALEInfo ctermbg=LightGrey gui=None
highlight ALEStyleWarning ctermbg=LightGrey gui=None

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''"}
let g:AutoPairsFlyMode = 0
let g:ale_sign_error = ' E'
let g:ale_sign_warning = ' W'

" pyre is a linter, try and fix that
let g:ale_set_highlights = 0
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '▶ '

"##### ALE LINTER OPTIONS #####################################################
let g:ale_linters = {'python': ['pylint', 'flake8', 'mypy'],
            \'tex': [],
            \'go': ['gofmt', 'golint'],
            \'cpp':['cppcheck', 'clangd', 'cpplint'],
            \'c':['clangd', 'clangtidy'],
            \'rust': ['analyzer', 'cargo'], 
            \ 'cmake': ['cmakelint']}

" Python
let g:ale_python_pylint_options = "--generated-members=numpy.*, torch.*"  " Some numpy members couldn't be found

" LateX
let g:ale_tex_chktex_options = "-n 1 -n 8"   " -n NUM supresses warnings for that error

" C++/C 
let g:ale_c_astyle_executable = "/usr/bin/astyle"
let g:ale_c_clangd_executable = "/usr/bin/clangd-12"
let g:ale_cpp_clangd_executable = "/usr/bin/clangd-12"
let g:ale_c_cppcheck_executable = "/usr/bin/cppcheck"
let g:ale_cpp_cppcheck_executable = "/usr/bin/cppcheck"
let g:ale_c_cppcheck_executable="/usr/local/bin/cppcheck"

"##### ALE FIXER OPTIONS ######################################################
cnoreabbrev Fix ALEFix
cnoreabbrev FIx ALEFix
cnoreabbrev FIX ALEFix
cnoreabbrev fix ALEFix


let g:ale_fixers = {'python': ['black', 
                    \ 'trim_whitespace', 'remove_trailing_lines',
                    \'isort'], 
                    \'c': ['clang-format'], 
                    \'cpp': ['clang-format'],
                    \'tex': [], 
                    \'rust': ['rustfmt', 'trim_whitespace'],
                    \'cmake': ['cmake-format']}

let g:ale_c_clangformat_options = "-style=file" 
let g:ale_c_clangformat_executable = "/usr/bin/clang-format-12"

let g:ale_rust_rustfmt_options = "--config tab_spaces=2"

let g:ale_cpp_parse_compile_commands=1
let g:ale_cpp_build_dir_names = ['build', 'bin', '.']

" ALE misc. options
let g:ale_echo_msg_format = '%linter%: %s [%code%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" C++ Fixers and Linters
" let g:ale_cpp_clangtidy_executable="/usr/bin/clang-tidy-9"
" let g:ale_c_clangtidy_executable="/usr/bin/clang-tidy-9"
" let g:ale_cpp_clangtidy_options = "--format-style=\"google\""
" let g:ale_cpp_clangtidy_checks = ["google-*", "performance-*", "readability-*", "bugprone-*", "boost-*", "modernize-*"]

" remap vim sneak to t
" nmap t <Plug>Sneak_s
" nmap T <Plug>Sneak_S
" vmap t <Plug>Sneak_s
" vmap T <Plug>Sneak_S

" LaTeX
" set conceallevel=2
" let g:tex_conceal="abdgm"
" set concealcursor="n"
let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
let g:latex_view_general_viewer = 'mupdf'
" VIMTEX COMPILER OPTIONS SET IN $HOME/.LATEXMKRC


let g:vimtex_compiler_method = "latexmk"

let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-shell-escape',
        \   '-synctex=1',
        \   '-verbose',
        \   '-interaction=nonstopmode',
        \ ],
        \}



" speeding up vimtex
let g:tex_fast=""
let g:vimtex_matchparen_enabled=0
let g:vimtex_matchparen_enabled=0

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
" Airline Stuff
"nmap n <Plug>(anzu-n-with-echo)
"nmap N <Plug>(anzu-N-with-echo)
"nmap * <Plug>(anzu-star-with-echo)
"nmap # <Plug>(anzu-sharp-with-echo)
"let g:airline#extensions#ale#enabled = 1
"let g:airline_extensions = []
"let g:airline_powerline_fonts = 1
"
"let g:airline_section_a = airline#section#create_right(['  ', 'mode',''])
"let g:airline_section_z = '%{anzu#search_status()}'
"let g:airline_section_x = 'ALE: %{LinterStatus()}'
"let g:airline_section_y = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
""let g:airline_section_z = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
"let g:airline_section_error = ''
"let g:airline_section_warning = ''
"let g:airline_highlighting_cache = 1

" Code
let g:python_highlight_space_errors = 0
let g:mkdp_browser = 'firefox'

"" Toggle Tagbar
nmap tt : TagbarToggle<CR>

"Allows rg to detect root, faster searching
if executable('rg')
    let g:rg_derive_root='true'
endif

"" IndentLine
"let g:indentLine_char = '∣'
"let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_first_char = '∣'
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'txt', 'tex', '']
let g:indent_guides_enable_on_vim_startup = 1
au TermEnter * IndentGuidesDisable
au TermLeave * IndentGuidesEnable
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
"
let g:ctrlp_user_command = [ '.git/' , 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " help ignore things we dont want to search for
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0

"" remove whitespace to left of line
let mapleader = " " "Set leader key
nnoremap <leader>le :left<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" fixes vim issue where it indents when you type :
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd FileType * set formatoptions-=cro


