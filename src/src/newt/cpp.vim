function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function! GenericRun()
		call system("urxvt -e sh -c \"cmake . || read && false\"") 
		if v:shell_error != 0
			return
		endif

		call system("urxvt -e sh -c \"make . || read && false\"") 
		if v:shell_error != 0
			return
		endif
		
		call system("urxvt -e './main'")

	endfunction
endfunction
