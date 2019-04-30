au BufReadPost,BufNewFile *.html call SetupJS()
function SetupJS()
	map <F5> :call Printcmd("firefox ".@%) <CR>	
endfunction

