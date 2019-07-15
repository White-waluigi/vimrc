function SetupCPP()
	!cp -a src/cpp/. .
	e main.cpp
	function GenericRun()
		!urxvt -e cmake ..
		!urxvt -e make -j4
		!urxvt -e ./main






