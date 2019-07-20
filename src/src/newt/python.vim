function SetupPy()
	!cp -a ~/.config/nvim/src/newt/python/. .
	e main.py

	
	function! GenericRun()
		let l:res = ECom("python3 %||read") 
	endfunction
endfunction
