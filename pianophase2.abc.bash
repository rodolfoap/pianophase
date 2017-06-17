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

ffmpeg -i piano1.wav -i piano2.wav -filter_complex "[0:a][1:a]amerge=inputs=2,pan=stereo|c0<c0+c1|c1<c2+c3[aout]" -map "[aout]" piano_phase.wav
mplayer piano_phase.wav
