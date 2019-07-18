function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function! GenericRun()
		let l:res = ECom("cmake . || (read && false)") 
		if l:res != 0
			return
		endif
		let l:res = ECom("make -j4 || (read && false)") 

		if l:res != 0
			return
		endif

		call ECom("./main")
		

	endfunction
endfunction
