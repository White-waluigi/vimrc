function SetupJS()
	!cp -a ~/.config/nvim/src/newt/js/. .
	e main.js
	function! GenericRun()
		silent !nohup firefox main.html &
	endfunction
	call MapRun()
endfunction
