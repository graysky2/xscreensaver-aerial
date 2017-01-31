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
b9-3.mov b10-1.mov b10-3.mov comp_GL_G004_C010_v03_6Mbps.mov
comp_HK_H004_C008_v10_6Mbps.mov comp_C002_C005_0818SC_001_v01_6M_HB_tag0.mov
comp_LW_L001_C006_t9_6M_tag0.mov comp_LA_A005_C009_v05_t9_6M.mov
plate_G002_C002_BG_t9_6M_HB_tag0.mov comp_C007_C011_08244D_001_v01_6M_HB_tag0.mov
comp_LA_A006_C008_t9_6M_HB_tag0.mov comp_DB_D001_C001_v03_6Mbps.mov
comp_HK_H004_C010_4k_v01_6Mbps.mov comp_LA_A008_C004_ALT_v33_6Mbps.mov
comp_DB_D002_C003_t9_6M_HB_tag0.mov comp_C007_C004_0824AJ_001_v01_6M_HB_tag0.mov
comp_DB_D001_C005_t9_6M_HB_tag0.mov comp_HK_H004_C013_t9_6M_HB_tag0.mov
comp_DB_D008_C010_v04_6Mbps.mov)
NightArr=(b1-2.mov b1-4.mov b2-3.mov b2-4.mov b3-1.mov b4-2.mov b5-3.mov
b6-2.mov b6-4.mov b7-3.mov b10-4.mov b9-2.mov b10-2.mov b8-1.mov
comp_DB_D011_D009_SIGNCMP_v15_6Mbps.mov comp_LA_A009_C009_t9_6M_tag0.mov
comp_GL_G010_C006_v08_6Mbps.mov comp_DB_D011_C010_v10_6Mbps.mov
comp_HK_B005_C011_t9_6M_tag0.mov)

# database files to allow for no repeats when playing videos
day_db=$XDG_CONFIG_HOME/.atv4-day
night_db=$XDG_CONFIG_HOME/.atv4-night

runit() {
  [[ -s "$day_db" ]] || echo "${DayArr[@]}" | sed 's/ /\n/g' > "$day_db"
  [[ -s "$night_db" ]] || echo "${NightArr[@]}" | sed 's/ /\n/g' > "$night_db"

  # set the time of day based on the local clock
  # where day is after 7AM and before 6PM
  hour=$(date +%H)
  if [ "$hour" -gt 19 -o "$hour" -lt 7 ]; then
    use_db=$night_db
  else
    use_db=$day_db
  fi

  # select at random a video to play from the day or night pools
  howmany=$(wc -l "$use_db" | awk '{ print $1 }')
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
      rndpick=$((RANDOM%howmany+1))
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
  if [[ -f "$movies/$useit" ]]; then
    # file is on filesystem so just play it
    mpv --really-quiet --no-audio --fs --no-stop-screensaver --wid="$XSCREENSAVER_WINDOW" "$movies/$useit" &
  else
    # no file on filesystem so try to stream it
    APPLEURL="http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos"
    mpv --really-quiet --no-audio --fs --no-stop-screensaver --wid="$XSCREENSAVER_WINDOW" "$APPLEURL/$useit" &
  fi
  pid=$!
  wait $pid
  [ $? -gt 128 ] && { kill $pid ; exit 128; } ;
done

# vim:set ts=2 sw=2 et:
