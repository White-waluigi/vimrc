function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function! GenericRun()
		call system("urxvt -e sh -c \"cmake . || read\"") 
		if v:shell_error != 0
			sp cmake.log
			return
		endif

		call system("urxvt -e sh -c \"make -j4 | tee make.log\"") 
		if v:shell_error != 0
			sp make.log
			return
		endif
		
		call system("urxvt -e './main'")

	endfunction
endfunction
