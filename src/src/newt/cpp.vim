function SetupCPP()
	!cp -a ~/.config/nvim/src/cpp/. .
	e main.cpp
	function GenericRun()
		!urxvt -e cmake ..
		!urxvt -e make -j4
		!urxvt -e ./main
	endfunction
endfunction
