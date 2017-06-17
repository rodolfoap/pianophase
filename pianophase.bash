endphase() { kill $(ps fax|grep -v grep|grep -B2 play|grep bash|awk '{print $1}'); }
phase() { while :; do for n in E4 F#4 B4 C#5 D5 F#4 E4 C#5 B4 F#4 D5 C#5; do /usr/bin/play -qn synth $1 pluck $n; done; echo -n "[$1]"; done; }
phase 0.130 & phase 0.132
