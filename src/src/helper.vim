function ECom(com)
	let l:file=system("mktemp")
	"system("urxvt -e sh -c \"".com.";echo $? > ".l:file."\"")
	call system ("urxvt -e sh -c '".a:com.";echo \$? > ".l:file."'")
	echo ("urxvt -e sh -c '".a:com.";echo \$? > ".l:file."'")

	return system("cat ".l:file)
endfunction
