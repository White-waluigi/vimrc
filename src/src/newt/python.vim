function SetupPy()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.py

	
	function! GenericRun()
		let l:res = ECom("python3 %||read") 
	endfunction
endfunction
