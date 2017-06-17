# Piano Phase, by Steve Reich

Computer-generated Steve Reich's Piano Phase is the best way to appreciate the marvelous patterns embedded into this beautiful piece. This small repository holds only my favorite renderings of the piece.

## The Piece

![Piano Phase minimalist cell](https://github.com/rodolfoap/pianophase/blob/master/img/pianophase.png)

Piano Phase, by Steve Reich is a contemporary minimalist music composition which is played on two pianos. Both pianos plays a small cell (see image) at slightly different tempos, a task that's very difficult to accomplish by human players. The auditive effects produced by the cell displacement in time produce amazing patterns.

What happens under the hood:

![Piano Phase patters displace](https://github.com/rodolfoap/pianophase/blob/master/img/pianophase_patterns.png)

See https://en.wikipedia.org/wiki/Piano_Phase

Despite some human interpretations are amazing (there are some people able to play the piece on two pianos alone!), personally I believe that computer-rendered versions offer the best results.

## A simple bash-interpreter

This first example uses the sox play function (/usr/bin/play)

```bash
phase() {
	while :; do
		for n in E4 F#4 B4 C#5 D5 F#4 E4 C#5 B4 F#4 D5 C#5; do
			/usr/bin/play -qn synth $1 pluck $n;
		done;
		echo -n "[$1]";
	done;
}
phase 0.13 & phase 0.131
```

You can play with the duration values of each note (in this case, 0.130 and 0.131).

See the pianophase.bash file. It includes a function to stop the loop. If not, you can always get the background player to the foreground in bash with CTRL-F, and then, use CTRL-C to stop it.

## An abc renderer

The second example is a bit more elaborated, uses abc notation (https://en.wikipedia.org/wiki/ABC_notation) to generate midi files, render them to audio with timidity++ and play or mix them. My rendering sends a very low note at the beginning, due to the current Debian/Jessie version of timidity++ introduces some initial noise. Remove it, if you don't have this issue.

* pianophase1.abc.bash plays both audio channels
* pianophase2.abc.bash renders a wav file
* pianophase3.abc.bash renders a wav file, includes 8 bars at the beginning and the end, as human players start and end. Tempo is a bit faster (456/2). A gnumeric sheet is included to calculate the right number of repetitions.

## A rendered example

* Here's a rendered version: https://github.com/rodolfoap/pianophase/raw/master/pianophase.mp3 , also in https://ydor.org/SteveReich/piano_phase.mp3
* A faster version: https://ydor.org/SteveReich/piano_phase456.mp3

Hope having the time to render more tests. Have ideas? Contributions are welcome.

Enjoy!

RodolfoAP (http://ydor.org)
