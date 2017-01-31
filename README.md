# xscreensaver-aerial
An xscreensaver that randomly selects one of the Apple TV4 HD aerial movies and plays it using mpv. 
* The day movies will play between the hours of 7 AM and 7 PM while the night movies will play thereafter.
* No movie should repeat until all of the respective movies have cycled through once. After that, the queue will reset and continue playing in a random fashion.
* No excessive HDD usage. When the display is told to sleep by xscreensaver, whatever video is currently playing will finish and another will NOT get called until the display is active again.

# Dependencies
* coreutils
* mpv
* xscreensaver

# Installation
## Users of Arch Linux
Arch Linux users may simply download the PKGBUILD from the AUR (below) and build as usual. Follow the post install instructions.

## Arch Linux Packages
* https://aur.archlinux.org/packages/xscreensaver-aerial
* https://aur.archlinux.org/packages/xscreensaver-aerial-videos (optional to avoid bandwidth of streaming from apple)

## Users of other distros
Users of other distros can manually complete these 2 steps:

1) Copy `atv4.sh` from this repo  to `/usr/lib/xscreensaver/atv4` and make it executable by running the following as the root user:
```
cp atv4.sh /usr/lib/xscreensaver/atv4 && chmod +x /usr/lib/xscreensaver/atv4
```

2) Edit ~/.xscreensaver to add support for it to see this script. Look for the line that beings with "programs:" and simply add the following to the file:
```
"ATV4" atv4 \n\
```

Optionally download the expected video content manually to save the bandwidth of repeatedly streaming them.
This screensaver expects them to be installed to `/opt/ATV4` which should be world-readable. You may use the following to little script to obtain the videos and save them to this location. Make sure that you have `wget` installed prior to running the script:
```
#!/bin/sh
# run this from /opt/ATV4 which you created and assigned 755 premissions manually

url="http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos"
for i in b10-1.mov b10-2.mov b10-3.mov b10-4.mov b1-1.mov b1-2.mov b1-3.mov b1-4.mov \
	b2-1.mov b2-2.mov b2-3.mov b2-4.mov b3-1.mov b3-2.mov b3-3.mov b4-1.mov b4-2.mov \
	b4-3.mov b5-1.mov b5-2.mov b5-3.mov b6-1.mov b6-2.mov b6-3.mov b6-4.mov b7-1.mov \
	b7-2.mov b7-3.mov b8-1.mov b8-2.mov b8-3.mov b9-1.mov b9-2.mov b9-3.mov \
	comp_GL_G004_C010_v03_6Mbps.mov comp_DB_D011_D009_SIGNCMP_v15_6Mbps.mov \
	comp_HK_H004_C008_v10_6Mbps.mov comp_LA_A009_C009_t9_6M_tag0.mov \
	comp_C002_C005_0818SC_001_v01_6M_HB_tag0.mov comp_GL_G010_C006_v08_6Mbps.mov \
	comp_LW_L001_C006_t9_6M_tag0.mov comp_DB_D011_C010_v10_6Mbps.mov \
	comp_LA_A005_C009_v05_t9_6M.mov comp_HK_B005_C011_t9_6M_tag0.mov \
	plate_G002_C002_BG_t9_6M_HB_tag0.mov comp_C007_C011_08244D_001_v01_6M_HB_tag0.mov \
	comp_LA_A006_C008_t9_6M_HB_tag0.mov comp_DB_D001_C001_v03_6Mbps.mov \
	comp_HK_H004_C010_4k_v01_6Mbps.mov comp_LA_A008_C004_ALT_v33_6Mbps.mov \
	comp_DB_D002_C003_t9_6M_HB_tag0.mov comp_C007_C004_0824AJ_001_v01_6M_HB_tag0.mov \
	comp_DB_D001_C005_t9_6M_HB_tag0.mov comp_HK_H004_C013_t9_6M_HB_tag0.mov \
	comp_DB_D008_C010_v04_6Mbps.mov; do
	wget "$url/$i"
	chmod 644 $(pwd)/$i
done
```
Now you can select it from `xscreensaver-demo` like any other. Enjoy!
