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


set lines=100 columns=2999
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

function Killbuffer(buf)
	if bufwinnr(a:buf) > 0
		exec "bd! ".a:buf
	endif		
endfunction
function Printcmd(arg)
	"let logjob = job_start("cmake\ -Bbuild\ -H.\ &&\ cmake\ --build\ build/\ --\ -j4\ -w", {'out_io': 'buffer', 'out_name': 'buildwindow'})
	"set splitbelow
	"bd dummy
	"let logjob = job_start(["/bin/bash","-c",g:buildprg."| tail -f"],{'out_io': 'buffer', 'out_name': 'dummy'})
	"set splitbelow
	"20split | buffer dummy
	try	
		wa!
	catch
	endtry
	call Killbuffer("dummy")
	let oldval=&splitbelow
	set splitbelow
	"echo "executing: ".a:arg 	
	"A command prinitng itself partially while being executed in case you are confused
	"exec ":normal! A echo \"command:\'".a:arg."\'\" && ".a:arg
	let termjb=term_start(["bash","-c","echo \"command:\'".a:arg."\'\" && ".a:arg],{"term_rows":11,"term_name":"dummy"})
	echo "echo \"command:\'".a:arg."\'\" && ".a:arg
	wincmd p
	let &splitbelow=oldval
endfunction	
function Setupcpp(projname,exename)
	let g:cppstr=a:exename

	
	function Buildcpp()
		wa
		!mkdir build
		cd build
		!cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && make
		let cppoutp= system("cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . && make")  
		if v:shell_error
			echo "fail"
		else
			execute g:cppstr
		endif
		cd ..
	endfunction

	"let g:buildprg="cmake\ -Bbuild\ -H.\ &&\ cmake\ --build\ build/\ --\ -j4\ -w"
	let g:buildprg="cmake -Bbuild -H. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && cmake --build build/ -- -j4 -w && cp build/compile_commands.json ."
	let &makeprg=g:buildprg
	set makeprg=cmake\ -Bbuild\ -H.\ &&\ cmake\ --build\ build/\ --\ -j4\ -w
	

	map <S-F5>  :call Printcmd(g:buildprg) <CR>
	map <F5>	:call  Printcmd(g:buildprg."&& clear &&".g:cppstr) <CR>
	map <F6>	:call Killbuffer("dummy")<CR>
	map <C-F5> : echo "cleaning build" \| exec "!rm -rf build/" <CR>
	"map <F6> <ESC>:call Buildcpp() | execute g:cppstr	<CR>
endfunction





au BufReadPost,BufNewFile *.py call Setuppython()
function Setuppython()
	map <F5> :call Printcmd("python3 ".@%) <CR>	
endfunction

"Autoload Javascript in browser
runtime src/cpp.vim
runtime src/jsexec.vim


function NewTrash()
	cd /home/marvin/Documents/trash/vim
	let l:dir=system("echo $RANDOM")
	execute "!mkdir ".l:dir
	execute "cd ".l:dir
endfunction

command Newt call NewTrash()


call plug#begin()
    Plug 'Valloric/YouCompleteMe'
    Plug 'tpope/vim-fugitive'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-dispatch'
	Plug 'itchyny/lightline.vim'
	Plug 'tikhomirov/vim-glsl'
	Plug 'bbchung/clighter8'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'tandrewnichols/vim-determined'	
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

