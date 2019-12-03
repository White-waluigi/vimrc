map <F2> <ESC>:wa <CR>
map <F8> <ESC>:tabn <CR>
map <F7> <ESC>:tabp <CR>
map <F3> <ESC>:silent !mocp -f<CR>
"map <F2> <ESC>:silent !mocp -p<CR>
map <F12> :qa!<CR>
map <F11> :exec "!gvim &"\| qa!<CR>
map <F10> :!date +\%R<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> :noh<CR>
map <C-B> :let filen=input("enter file name:") \| exec "!touch ".filen \| CtrlPClearAllCaches \| exec "e ".filen <CR>
noremap ;; :%s:::g<Left><Left><Left>
source $VIMRUNTIME/mswin.vim
behave mswin
set mouse=a

"set lines=100 columns=2999
call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")

set nowrap
set nolinebreak
set nolist
"set autowrite
set hidden
"set nohls
set hlsearch
highlight Normal guifg=white guibg=black
"colorscheme evening

set splitright
set splitbelow

au BufWinEnter * set number
set exrc
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set laststatus=2
set cursorline
let g:ycm_enable_diagnostic_signs=0
set completeopt-=preview

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15
"augroup ProjectDrawer
"autocmd!
"autocmd VimEnter * :Vexplore | wincmd l
"augroup END

"Autoload Javascript in browser
"runtime src/cpp.vim
"runtime src/jsexec.vim

runtime src/helper.vim
runtime src/newt/cpp.vim
runtime src/newt/java.vim
runtime src/newt/js.vim
runtime src/newt/python.vim

function MapRun()
	map <F5> :wa \| call GenericRun()<cr>
endfunction


function NewTrash(lang)
	cd ~/Documents/trash/vim
	let l:dir=system("echo $RANDOM")
	execute "!mkdir ".l:dir
	execute "cd ".l:dir

	if a:lang=="p"
		call SetupPy()
	endif
	if a:lang=="c"
		call SetupCPP()
	endif
	if a:lang=="j"
		call SetupJS()
	endif
endfunction

command! -nargs=1 Newt call NewTrash(<f-args>)


call plug#begin()
	Plug 'Valloric/YouCompleteMe'
    Plug 'tpope/vim-fugitive'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-dispatch'
	Plug 'itchyny/lightline.vim'
	Plug 'tikhomirov/vim-glsl'
"	Plug 'bbchung/clighter8'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'tandrewnichols/vim-determined'	
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
"	Plug 'neoclide/coc.nvim'
	Plugin 'mechatroner/rainbow_csv'
call plug#end()

highlight MatchParen ctermbg=2
let g:ctrlp_map = 'ä'
let g:ctrlp_cmd = 'CtrlP'

map ö : CtrlPClearAllCaches<CR>


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
"set guioptions+=b
"let g:ctrlp_show_hidden = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
inoremap · ->
