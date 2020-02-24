ghc := stack ghc --

recent:
	$(ghc) `ls -tr *.hs|tail -1` && ./`ls -tr | tail -1`

clean:
	find . -perm -700 -type f -delete
	- rm ./*.hi ./*.o 2>/dev/null
