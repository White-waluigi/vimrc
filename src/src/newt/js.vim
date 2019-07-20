function SetupJS()
	!cp -a ~/.config/nvim/src/newt/js/. .
	e main.js
	function! GenericRun()
		let l:res = ECom("firefox main.html") 
	endfunction
	call MapRun()
endfunction
