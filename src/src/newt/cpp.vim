function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function! GenericRun()
		system("urxvt -e cmake .	\| tee cmake.log") 
		if v:shell_error!=0
			sp cmake.log
		endif
		system("urxvt -e make -j4	\| tee make.log")
		if v:shell_error!=0
			sp make.log
		endif
		system("urxvt -e ./main		\| tee run.log")
		if v:shell_error!=0
			sp run.log
		endif
	endfunction
endfunction
