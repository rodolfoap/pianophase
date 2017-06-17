genabc(){
cat << EOF > $1.abc
	X:1
	T:Piano Phase
	M:4/4
	L:1/4
	Q:1/4=$2
	K:C
	| b'''' z z z | z z z z | z z z z |
	|: E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c :|
	Q:1/4=$3
EOF
	for a in {1..57}; do
	  echo "|: E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c :|" >> $1.abc
	done

cat << EOF >> $1.abc
	Q:1/4=$2
	| E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c |
	| E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c | E^FB^c d^FE^c B^Fd^c32 |
	| z z z z | z z z z | z z z z | z z z z |
EOF

	abc2midi $1.abc -o $1.mid &>/dev/null
	timidity $1.mid -Ow -o $1.wav;
}
genabc piano1 456 456
genabc piano2 456 457

rm piano_phase.wav
ffmpeg -i piano1.wav -i piano2.wav -filter_complex "[0:a][1:a]amerge=inputs=2,pan=stereo|c0<c0+c1|c1<c2+c3[aout]" -map "[aout]" piano_phase.wav
mplayer piano_phase.wav
#/usr/bin/play -V -M piano1.wav piano2.wav

