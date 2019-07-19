function ECom(com)
	"let l:file=system("mktemp")
	"system("urxvt -e sh -c \"".com.";echo $? > ".l:file."\"")
	
	echo ("urxvtc -hold  -e sh -c '(".a:com.") || read  '")
	call system ("urxvtc -hold  -e sh -c '(".a:com.") || read  '")





	"return system("cat ".l:file)
endfunction
