#!/bin/bash

[[ -z "$XDG_CONFIG_HOME" ]] &&
	XDG_CONFIG_HOME="$HOME/.config"

command -v mpv >/dev/null 2>&1 || {
echo "I require mpv but it's not installed. Aborting." >&2
exit 1; }

# path of movies
movies=/opt/ATV4

# day and night videos
DayArr=(b1-1.mov b1-3.mov b2-1.mov b2-2.mov b3-2.mov b3-3.mov b4-1.mov b4-2.mov
b5-1.mov b5-2.mov b6-1.mov b6-3.mov b7-1.mov b7-2.mov b8-2.mov b8-3.mov b9-1.mov
b9-3.mov b10-1.mov b10-3.mov)
NightArr=(b1-2.mov b1-4.mov b2-3.mov b2-4.mov b3-1.mov b4-2.mov b5-3.mov
b6-2.mov b6-4.mov b7-3.mov b10-4.mov b9-2.mov b10-2.mov b8-1.mov)

# database files to allow for no repeats when playing videos
day_db=$XDG_CONFIG_HOME/.atv4-day
night_db=$XDG_CONFIG_HOME/.atv4-night

runit() {
	[[ -s "$day_db" ]] || echo ${DayArr[@]} | sed 's/ /\n/g' > "$day_db"
	[[ -s "$night_db" ]] || echo ${NightArr[@]} | sed 's/ /\n/g' > "$night_db"

	# set the time of day based on the local clock
	# where day is after 7AM and before 6PM
	hour=$(date +%H)
	if [ $hour -gt 19 -a $hour -lt 7 ]; then
		use_db=$night_db
	else
		use_db=$day_db
	fi

	# select at random a video to play from the day or night pools
	howmany=$(cat "$use_db"|wc -l)
	##echo "$use_db contains $howmany records"
	# two conditions:
	# 1) 1 line left (one vid) so use the vid and regenerate the list
	# 2) 2 or more lines left so select a random number between 1 and $howmany
	if [[ $howmany -eq 1 ]]; then
		# condition 1 is true
		useit=$(sed -n "1 p" "$use_db")

		# exclude the one we just picked to create the illusion that we NEVER repeat :)
		sed -i "/$useit/d" "$use_db"
	elif [[ $howmany -ge 2 ]]; then
		# condition 2 is true
		rndpick=1
		while [[ $rndpick -lt 2 ]]; do
			rndpick=$((RANDOM%$howmany+1))
		done
		useit=$(sed -n "$rndpick p" "$use_db")

		# exclude the one we just picked to create the illusion that we NEVER repeat :)
		sed -i "/$useit/d" "$use_db"
	fi
}

# this part taken from Kevin Cox
# https://github.com/kevincox/xscreensaver-videos

IFS=$'\n'
trap : SIGTERM SIGINT SIGHUP
while (true) #!(keystate lshift)
do
	runit
	[[ -f "$movies/$useit" ]] || { echo "Error: $movie/$useit is missing!" ; exit 1 ; }

	mpv --really-quiet --no-audio --fs --no-stop-screensaver --wid=$XSCREENSAVER_WINDOW $movies/$useit &
	pid=$!

	wait $pid
	[ $? -gt 128 ] && { kill $pid ; exit 128; } ;
done
