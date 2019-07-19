function SetupCPP()
	!cp -a ~/.config/nvim/src/newt/cpp/. .
	e main.cpp
	function! GenericRun()
		let l:res = ECom("cmake . && clear && make -j4 && clear && ./main") 
	endfunction
	call MapRun()
endfunction
