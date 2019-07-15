function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function GenericRun()
		!urxvt -e cmake .	| tee cmake.log
		!urxvt -e make -j4	| tee make.log
		!urxvt -e ./main	| tee run.log
	endfunction
endfunction
