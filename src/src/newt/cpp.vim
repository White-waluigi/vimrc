function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function GenericRun()
		let g:res1=System("!urxvt -e cmake .	| tee cmake.log") 
		let g:res2=System("!urxvt -e make -j4	| tee make.log")
		let g:res3=System("!urxvt -e ./main		| tee run.log")
	endfunction
endfunction
