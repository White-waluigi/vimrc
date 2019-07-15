function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function! GenericRun()
		call system("urxvt -e 'cmake . \|  tee cmake.log'") 
		sp cmake.log
		return

		call system("urxvt -e 'make -j4 \| tee make.log'")
		if v:shell_error != 0
			sp cmake.log
			return
		endif
		call system("urxvt -e './main \| tee run.log'")
		if v:shell_error != 0
			sp cmake.log
			return
		endif
	endfunction
endfunction
