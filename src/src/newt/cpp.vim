function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function! GenericRun()
		system("urxvt -e cmake .") 
		system("urxvt -e make -j4")
		system("urxvt -e ./main")
	endfunction
endfunction
