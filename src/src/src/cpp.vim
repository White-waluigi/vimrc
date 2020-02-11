au BufReadPost,BufNewFile *.cpp call SetupCpp()
function SetupCpp()
	map <F5> :call Printcmd("g++ ".@%." && ./a.out") <CR>	
endfunction

