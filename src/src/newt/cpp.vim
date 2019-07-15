function SetupCPP()
	!cp -a ~/.conf/nvim/src/cpp/. .
	e main.cpp
	function GenericRun()
		!urxvt -e cmake ..
		!urxvt -e make -j4
		!urxvt -e ./main
	endfunction
endfunction
