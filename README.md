# xscreensaver-aerial
An xscreensaver that randomly selects one of the Apple TV4 HD aerial movies and plays it using mpv.
* The day movies will play between the hours of 7 AM and 7 PM while the night movies will play thereafter.
* No movie should repeat until all of the respective movies have cycled through once. After that, the queue will reset and continue playing in a random fashion.
* No excessive HDD usage. When the display is told to sleep by xscreensaver, whatever video is currently playing will finish and another will NOT get called until the display is active again.

# Dependencies
* coreutils
* mpv
* wget
* xscreensaver

# Movies
## 1080p version
There are 66 movies totally including the 13 shot from the International Space Station that Apple included with the tvOS 12.x release. These will play at both day and night.

## 4k version
There are 36 movies totally.

# Installation
## Users of Arch Linux
Arch Linux users may simply download the PKGBUILD from the AUR (below) and build as usual. Follow the post install instructions.

## Arch Linux Packages
* https://aur.archlinux.org/packages/xscreensaver-aerial
* https://aur.archlinux.org/packages/xscreensaver-aerial-videos (optional to avoid bandwidth of streaming from apple)

## Users of other distros
Users of other distros can manually complete these 2 steps:

Note that you don't actually need to install both unless you want to have support for both 1080p videos and 4k videos.
1) If you want both the 1080p and 4k versions:
 Copy `atv4-1080.sh` from this repo  to `/usr/lib/xscreensaver/atv4-1080` and make it executable by running the following as the root user.
 Copy `atv4-4k.sh` from this repo to `/usr/lib/xscreensaver/atv4-4k` and make it executable by running the following as the root user.

```
cp atv4-1080.sh /usr/lib/xscreensaver/atv4-1080 && chmod +x /usr/lib/xscreensaver/atv4-1080
cp atv4-4k.sh /usr/lib/xscreensaver/atv4-4k && chmod +x /usr/lib/xscreensaver/atv4-4k
```

2) Edit ~/.xscreensaver to add support for it to see this script. Look for the line that beings with "programs:" and simply add the following to the file:
```
"ATV4-1080" atv4-1080 \n\
"ATV4-4k" atv4-4k \n\
```

Optionally download the expected video content manually to save the bandwidth of repeatedly streaming them.
This screensaver expects them to be installed to `/opt/ATV4` which should be world-readable. You may use the following to little script to obtain the videos and save them to this location. 

Make sure that you have `wget` installed prior to running the script.
For only 1080p videos use this script:
```
#!/bin/sh
# run this from /opt/ATV4 which you created and assigned 755 premissions manually

_url1="http://a1.v2.phobos.apple.com.edgesuite.net/us/r1000/000/Features/atv/AutumnResources/videos/"
_url3="http://sylvan.apple.com/Aerials/2x/Videos/"

for i in b2-1.mov b5-1.mov b6-1.mov comp_GL_G010_C006_v08_6Mbps.mov b1-1.mov \
	b2-2.mov b4-1.mov b6-2.mov b7-1.mov b8-1.mov b1-2.mov b3-1.mov b5-2.mov \
	b6-3.mov b1-3.mov b2-3.mov b3-2.mov b4-2.mov b7-2.mov b1-4.mov b2-4.mov \
	b3-3.mov b4-3.mov b5-3.mov b6-4.mov b7-3.mov b8-2.mov b8-3.mov b9-2.mov \
	b9-3.mov b10-3.mov; do
	wget "$_url1/$i"
	chmod 644 $(pwd)/$i
done

for i in comp_CH_C007_C011_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov \
	comp_CH_C002_C005_PSNK_v05_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov \
	comp_CH_C007_C004_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov \
	DB_D008_C010_2K_SDR_HEVC.mov DB_D001_C001_2K_SDR_HEVC.mov \
	DB_D011_C010_2K_SDR_HEVC.mov DB_D002_C003_2K_SDR_HEVC.mov \
	DB_D001_C005_2K_SDR_HEVC.mov DB_D011_C009_2K_SDR_HEVC.mov \
	GL_G004_C010_2K_SDR_HEVC.mov GL_G002_C002_2K_SDR_HEVC.mov \
	HK_B005_C011_2K_SDR_HEVC.mov HK_H004_C010_2K_SDR_HEVC.mov \
	HK_H004_C013_2K_SDR_HEVC.mov HK_H004_C001_2K_SDR_HEVC.mov \
	HK_H004_C008_2K_SDR_HEVC.mov \
	comp_GMT312_162NC_139M_1041_AFRICA_NIGHT_v14_SDR_FINAL_20180706_SDR_2K_HEVC.mov \
	comp_A103_C002_0205DG_v12_SDR_FINAL_20180706_SDR_2K_HEVC.mov \
	comp_GMT306_139NC_139J_3066_CALI_TO_VEGAS_v07_SDR_FINAL_22062018_SDR_4K_HEVC.mov \
	comp_A108_C001_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov \
	comp_GMT308_139K_142NC_CARIBBEAN_DAY_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov \
	comp_GMT329_113NC_396B_1105_CHINA_v04_SDR_FINAL_20180706_F900F2700_SDR_2K_HEVC.mov \
	comp_A083_C002_1130KZ_v04_SDR_PS_FINAL_20180725_SDR_2K_HEVC.mov \
	comp_GMT329_117NC_401C_1037_IRELAND_TO_ASIA_v48_SDR_PS_FINAL_20180725_F0F6300_SDR_2K_HEVC.mov \
	comp_GMT026_363A_103NC_E1027_KOREA_JAPAN_NIGHT_v17_SDR_FINAL_25062018_SDR_2K_HEVC.mov \
	comp_A105_C003_0212CT_FLARE_v10_SDR_PS_FINAL_20180711_SDR_2K_HEVC.mov \
	comp_A009_C001_010181A_v09_SDR_PS_FINAL_20180725_SDR_2K_HEVC.mov \
	comp_A114_C001_0305OT_v10_SDR_FINAL_22062018_SDR_2K_HEVC.mov \
	comp_A001_C004_1207W5_v23_SDR_FINAL_20180706_SDR_2K_HEVC.mov \
	LA_A006_C008_2K_SDR_HEVC.mov LA_A009_C009_2K_SDR_HEVC.mov LA_A008_C004_2K_SDR_HEVC.mov \
	comp_LA_A006_C004_v01_SDR_FINAL_PS_20180730_SDR_2K_HEVC.mov LA_A005_C009_2K_SDR_HEVC.mov \
	LA_A011_C003_2K_SDR_HEVC.mov; do
	wget "$_url3/$i"
  chmod 644 $(pwd)/$i
done

```

For only 4k videos use this script:
```
#!/bin/sh
# run this from /opt/ATV4 which you created and assigned 755 premissions manually

_url2="http://sylvan.apple.com/Aerials/2x/Videos"

for i in  comp_CH_C007_C011_PSNK_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov \
	comp_CH_C002_C005_PSNK_v05_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov \
	comp_CH_C007_C004_PSNK_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov \
	DB_D008_C010_4K_SDR_HEVC.mov DB_D001_C001_4K_SDR_HEVC.mov DB_D011_C010_4K_SDR_HEVC.mov \
	DB_D002_C003_4K_SDR_HEVC.mov DB_D001_C005_4K_SDR_HEVC.mov DB_D011_C009_4K_SDR_HEVC.mov \
	GL_G004_C010_4K_SDR_HEVC.mov GL_G002_C002_4K_SDR_HEVC.mov HK_B005_C011_4K_SDR_HEVC.mov \
	HK_H004_C010_4K_SDR_HEVC.mov HK_H004_C013_4K_SDR_HEVC.mov HK_H004_C001_4K_SDR_HEVC.mov \
	HK_H004_C008_4K_SDR_HEVC.mov \
	comp_GMT312_162NC_139M_1041_AFRICA_NIGHT_v14_SDR_FINAL_20180706_SDR_4K_HEVC.mov \
	comp_A103_C002_0205DG_v12_SDR_FINAL_20180706_SDR_4K_HEVC.mov \
	comp_GMT306_139NC_139J_3066_CALI_TO_VEGAS_v07_SDR_FINAL_22062018_SDR_4K_HEVC.mov \
	comp_A108_C001_v09_SDR_FINAL_22062018_SDR_4K_HEVC.mov \
	comp_GMT308_139K_142NC_CARIBBEAN_DAY_v09_SDR_FINAL_22062018_SDR_4K_HEVC.mov \
	comp_GMT329_113NC_396B_1105_CHINA_v04_SDR_FINAL_20180706_F900F2700_SDR_4K_HEVC.mov \
	comp_A083_C002_1130KZ_v04_SDR_PS_FINAL_20180725_SDR_4K_HEVC.mov \
	comp_GMT329_117NC_401C_1037_IRELAND_TO_ASIA_v48_SDR_PS_FINAL_20180725_F0F6300_SDR_4K_HEVC.mov \
	comp_GMT026_363A_103NC_E1027_KOREA_JAPAN_NIGHT_v17_SDR_FINAL_25062018_SDR_4K_HEVC.mov \
	comp_A105_C003_0212CT_FLARE_v10_SDR_PS_FINAL_20180711_SDR_4K_HEVC.mov \
	comp_A009_C001_010181A_v09_SDR_PS_FINAL_20180725_SDR_4K_HEVC.mov \
	comp_A114_C001_0305OT_v10_SDR_FINAL_22062018_SDR_4K_HEVC.mov \
	comp_A001_C004_1207W5_v23_SDR_FINAL_20180706_SDR_4K_HEVC.mov \
	LW_L001_C006_4K_SDR_HEVC.mov LA_A006_C008_4K_SDR_HEVC.mov LA_A009_C009_4K_SDR_HEVC.mov \
	LA_A008_C004_4K_SDR_HEVC.mov comp_LA_A006_C004_v01_SDR_FINAL_PS_20180730_SDR_4K_HEVC.mov \
	LA_A005_C009_4K_SDR_HEVC.mov LA_A011_C003_4K_SDR_HEVC.mov; do
	wget "$_url2/$i"
	chmod 644 $(pwd)/$i
done
```

Now you can select it from `xscreensaver-demo` like any other. Enjoy!
