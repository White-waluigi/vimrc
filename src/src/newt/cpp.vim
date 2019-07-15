function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function! GenericRun()
		let out= system("urxvt -e 'cmake . '") 
		new
		put =out
		return

		call system("urxvt -e 'make -j4 '")
		if v:shell_error != 0
			sp cmake.log
			return
		endif
		call system("urxvt -e './main'")
		if v:shell_error != 0
			sp cmake.log
			return
		endif
	endfunction
endfunction
