#!/bin/bash

[[ -z "$XDG_CONFIG_HOME" ]] &&
  XDG_CONFIG_HOME="$HOME/.config"

command -v mplayer >/dev/null 2>&1 || {
  echo "I require mplayer but it's not installed. Aborting." >&2
  exit 1; }

# path of movies
default_movies=/opt/ATV4
movies=${MOVIES_FOLDER:-$default_movies}

# day and night videos
DayArr=(
  AK_A004_C012_SDR_20191217_SDR_2K_HEVC.mov
  BO_A012_C031_SDR_20190726_SDR_2K_HEVC.mov
  BO_A014_C008_SDR_20190719_SDR_2K_HEVC.mov
  BO_A014_C023_SDR_20190717_F240F3709_SDR_2K_HEVC.mov
  BO_A018_C029_SDR_20190812_SDR_2K_HEVC.mov
  comp_1223LV_FLARE_v21_SDR_PS_FINAL_20180709_F0F5700_SDR_2K_HEVC.mov
  comp_A001_C004_1207W5_v23_SDR_FINAL_20180706_SDR_2K_HEVC.mov
  comp_A006_C003_1219EE_CC_v01_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
  comp_A007_C017_01156B_v02_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_A008_C007_011550_CC_v01_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
  comp_A009_C001_010181A_v09_SDR_PS_FINAL_20180725_SDR_2K_HEVC.mov
  comp_A012_C014_1223PT_v53_SDR_PS_FINAL_20180709_F0F8700_SDR_2K_HEVC.mov
  comp_A013_C012_0122D6_CC_v01_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
  comp_A083_C002_1130KZ_v04_SDR_PS_FINAL_20180725_SDR_2K_HEVC.mov
  comp_A103_C002_0205DG_v12_SDR_FINAL_20180706_SDR_2K_HEVC.mov
  comp_A105_C003_0212CT_FLARE_v10_SDR_PS_FINAL_20180711_SDR_2K_HEVC.mov
  comp_A108_C001_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov
  comp_A114_C001_0305OT_v10_SDR_FINAL_22062018_SDR_2K_HEVC.mov
  comp_C001_C005_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_C003_C003_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_C004_C003_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_CH_C002_C005_PSNK_v05_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
  comp_CH_C007_C004_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
  comp_CH_C007_C011_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
  comp_GL_G002_C002_PSNK_v03_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_GL_G004_C010_PSNK_v04_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
  comp_GMT308_139K_142NC_CARIBBEAN_DAY_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov
  comp_H004_C007_PS_v02_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_H004_C009_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_H005_C012_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_H007_C003_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_L007_C007_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_L010_C006_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_LA_A005_C009_PSNK_ALT_v09_SDR_PS_201809134_SDR_2K_HEVC.mov
  comp_LA_A006_C008_PSNK_ALL_LOGOS_v10_SDR_PS_FINAL_20180801_SDR_2K_HEVC.mov
  comp_LA_A008_C004_ALTB_ED_FROM_FLAME_RETIME_v46_SDR_PS_20180917_SDR_2K_HEVC.mov
  comp_LW_L001_C003__PSNK_DENOISE_v04_SDR_PS_FINAL_20180803_SDR_2K_HEVC.mov
  comp_N003_C006_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_N008_C009_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  CR_A009_C007_SDR_20191113_SDR_2K_HEVC.mov
  DB_D001_C001_2K_SDR_HEVC.mov
  DB_D001_C005_2K_SDR_HEVC.mov
  DB_D002_C003_2K_SDR_HEVC.mov
  DB_D008_C010_2K_SDR_HEVC.mov
  DL_B002_C011_SDR_20191122_SDR_2K_HEVC.mov
  FK_U009_C004_SDR_20191220_SDR_2K_HEVC.mov
  g201_AK_A003_C014_SDR_20191113_SDR_2K_HEVC.mov
  g201_CA_A016_C002_SDR_20191114_SDR_2K_HEVC.mov
  g201_TH_803_A001_8_SDR_20191031_SDR_2K_HEVC.mov
  g201_TH_804_A001_8_SDR_20191031_SDR_2K_HEVC.mov
  g201_WH_D004_L014_SDR_20191031_SDR_2K_HEVC.mov
  HK_H004_C001_2K_SDR_HEVC.mov
  HK_H004_C008_2K_SDR_HEVC.mov
  HK_H004_C010_2K_SDR_HEVC.mov
  HK_H004_C013_2K_SDR_HEVC.mov
  KP_A010_C002_SDR_20190717_SDR_2K_HEVC.mov
  LW_L001_C006_2K_SDR_HEVC.mov
  MEX_A006_C008_SDR_20190923_SDR_2K_HEVC.mov
  PA_A001_C007_SDR_20190717_SDR_2K_HEVC.mov
  PA_A002_C009_SDR_20190730_ALT01_SDR_2K_HEVC.mov
  PA_A004_C003_SDR_20190719_SDR_2K_HEVC.mov
  PA_A010_C007_SDR_20190717_SDR_2K_HEVC.mov
  RS_A008_C010_SDR_20191218_SDR_2K_HEVC.mov
  SE_A016_C009_SDR_20190717_SDR_2K_HEVC.mov
)

NightArr=(
  DB_D011_C009_2K_SDR_HEVC.mov
  DB_D011_C010_2K_SDR_HEVC.mov
  LA_A009_C009_2K_SDR_HEVC.mov
  LA_A011_C003_2K_SDR_HEVC.mov
  comp_A015_C018_0128ZS_v03_SDR_PS_FINAL_20180709__SDR_2K_HEVC.mov
  comp_GL_G010_C006_PSNK_NOSUN_v12_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
  comp_GMT026_363A_103NC_E1027_KOREA_JAPAN_NIGHT_v17_SDR_FINAL_25062018_SDR_2K_HEVC.mov
  comp_GMT110_112NC_364D_1054_AURORA_ANTARTICA__COMP_FINAL_v34_PS_SDR_20181107_SDR_2K_HEVC.mov
  comp_GMT306_139NC_139J_3066_CALI_TO_VEGAS_v07_SDR_FINAL_22062018_SDR_2K_HEVC.mov
  comp_GMT307_136NC_134K_8277_NY_NIGHT_01_v25_SDR_PS_20180907_SDR_2K_AVC.mov
  comp_GMT312_162NC_139M_1041_AFRICA_NIGHT_v14_SDR_FINAL_20180706_SDR_2K_HEVC.mov
  comp_GMT314_139M_170NC_NORTH_AMERICA_AURORA__COMP_v22_SDR_20181206_v12CC_SDR_2K_HEVC.mov
  comp_GMT329_113NC_396B_1105_CHINA_v04_SDR_FINAL_20180706_F900F2700_SDR_2K_HEVC.mov
  comp_GMT329_113NC_396B_1105_ITALY_v03_SDR_FINAL_20180706_SDR_2K_HEVC.mov
  comp_GMT329_117NC_401C_1037_IRELAND_TO_ASIA_v48_SDR_PS_FINAL_20180725_F0F6300_SDR_2K_HEVC.mov
  comp_H012_C009_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_HK_B005_C011_PSNK_v16_SDR_PS_20180914_SDR_2K_HEVC.mov
  comp_L004_C011_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_L012_c002_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_LA_A006_C004_v01_SDR_FINAL_PS_20180730_SDR_2K_HEVC.mov
  comp_N008_C003_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
  comp_N013_C004_PS_v01_SDR_PS_20180925_F1970F7193_SDR_2K_HEVC.mov
)

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
    mplayer -nosound -really-quiet -nolirc -nostop-xscreensaver -wid "$XSCREENSAVER_WINDOW" -fs "$movies/$useit" &
  else
    # no file on filesystem so try to stream it
    APPLEURL="https://sylvan.apple.com/Aerials/2x/Videos"
    mplayer -nosound -really-quiet -nolirc -nostop-xscreensaver -wid "$XSCREENSAVER_WINDOW" -fs "$APPLEURL/$useit" &
  fi
  pid=$!
  wait $pid
  [ $? -gt 128 ] && { kill $pid ; exit 128; } ;
done

# vim:set ts=2 sw=2 et:
