function ECom(com)
	let l:file=system("mktemp")
	"system("urxvt -e sh -c \"".com.";echo $? > ".l:file."\"")
	call system ("terminal -e sh -c '".a:com.";echo \$? > ".l:file."'")



	return system("cat ".l:file)
endfunction
