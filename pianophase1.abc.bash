genabc(){
	cat << EOF > $1.abc
	X:1
	T:Piano Phase
	M:4/4
	L:1/4
	Q:1/4=$2
	K:C
	| b'''' z z z | z z z z | z z z z |
EOF
	for a in {1..52}; do
	  echo "|: E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c :|" >> $1.abc
	done

	abc2midi $1.abc -o $1.mid &>/dev/null
	timidity $1.mid -Ow -o $1.wav;
}
genabc piano1 400
genabc piano2 401

/usr/bin/play -V -M piano1.wav piano2.wav
