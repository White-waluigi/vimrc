function ECom(com)
	"let l:file=system("mktemp")
	"system("urxvt -e sh -c \"".com.";echo $? > ".l:file."\"")
	
	call system ("urxvtc -e sh -c '(".a:com.") || read  '")




	"return system("cat ".l:file)
endfunction
