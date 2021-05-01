# xscreensaver-aerial
An xscreensaver that randomly selects one of the Apple TV4 HD aerial movies and plays it using mplayer.
* The day movies will play between the hours of 7 AM and 7 PM while the night movies will play thereafter.
* No movie should repeat until all of the respective movies have cycled through once. After that, the queue will reset and continue playing in a random fashion.
* No excessive HDD usage. When the display is told to sleep by xscreensaver, whatever video is currently playing will finish and another will NOT get called until the display is active again.

# Users of Windows or macOS
Xscreensaver is for linux and unix..
* macOS users can try [Aerial](https://github.com/JohnCoates/Aerial)
* Windows users can try [cDima/Aerial](https://github.com/cDima/Aerial)

# Dependencies
* coreutils
* mplayer
* wget
* xscreensaver

# Movies
There are 97 movies totally including:
* China
* Dubai
* Greenland
* Hawaii
* Hong Kong
* Liwa
* London
* Los Angeles
* New York City
* San Francisco
* ISS
* Undersea

# Installation
## Users of Arch Linux
Arch Linux users may simply download the PKGBUILD from the AUR (below) and build as usual. Follow the post install instructions.
* ![logo](http://www.monitorix.org/imgs/archlinux.png "arch logo") [xscreensaver-aerial](https://aur.archlinux.org/packages/xscreensaver-aerial) - this hack.

_Optional video packs useful to avoid multiple calls streaming from Apple (offline copies on your physical system)._
* ![logo](http://www.monitorix.org/imgs/archlinux.png "arch logo") [aerial-2k-videos](https://aur.archlinux.org/packages/aerial-2k-videos) - 2k videos require approx 16.3 GB of space.
* ![logo](http://www.monitorix.org/imgs/archlinux.png "arch logo") [aerial-4k-videos](https://aur.archlinux.org/packages/aerial-4k-videos) - 4k videos require approx 32.2 GB of space.

## Users of other distros
Users of other distros can manually complete these 2 steps:

Note that you don't actually need to install both unless you want to have support for both 2k videos and 4k videos.
1) If you want both the 2k and 4k versions:
 Copy `atv4-2k.sh` from this repo  to `/usr/lib/xscreensaver/atv4-2k` and make it executable by running the following as the root user.
 Copy `atv4-4k.sh` from this repo to `/usr/lib/xscreensaver/atv4-4k` and make it executable by running the following as the root user.

```
cp atv4-2k.sh /usr/lib/xscreensaver/atv4-2k && chmod +x /usr/lib/xscreensaver/atv4-2k
cp atv4-4k.sh /usr/lib/xscreensaver/atv4-4k && chmod +x /usr/lib/xscreensaver/atv4-4k
```

2) Edit ~/.xscreensaver to add support for it to see this script. Look for the line that beings with "programs:" and simply add the following to the file:
```
"ATV4-2k" atv4-2k \n\
"ATV4-4k" atv4-4k \n\
```

Optionally download the expected video content manually to save the bandwidth of repeatedly streaming them.
This screensaver expects them to be installed to `/opt/ATV4/` which should be world-readable. You may use the following to little script to obtain the videos and save them to this location.

Make sure that you have `wget` installed prior to running the script.
For only 2k videos use this script:
```
#!/bin/bash
# run this from /opt/ATV4/ which you created and assigned 755 premissions manually

#!/bin/bash

twok=(
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
    comp_DB_D008_C010_PSNK_v21_SDR_PS_20180914_F0F16157_SDR_2K_HEVC.mov
    comp_GL_G002_C002_PSNK_v03_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_GMT026_363A_103NC_E1027_KOREA_JAPAN_NIGHT_v17_SDR_FINAL_25062018_SDR_2K_HEVC.mov
    comp_GMT110_112NC_364D_1054_AURORA_ANTARTICA__COMP_FINAL_v34_PS_SDR_20181107_SDR_2K_HEVC.mov
    comp_GMT306_139NC_139J_3066_CALI_TO_VEGAS_v07_SDR_FINAL_22062018_SDR_2K_HEVC.mov
    comp_GMT308_139K_142NC_CARIBBEAN_DAY_v09_SDR_FINAL_22062018_SDR_2K_HEVC.mov
    comp_GMT312_162NC_139M_1041_AFRICA_NIGHT_v14_SDR_FINAL_20180706_SDR_2K_HEVC.mov
    comp_GMT314_139M_170NC_NORTH_AMERICA_AURORA__COMP_v22_SDR_20181206_v12CC_SDR_2K_HEVC.mov
    comp_GMT329_113NC_396B_1105_CHINA_v04_SDR_FINAL_20180706_F900F2700_SDR_2K_HEVC.mov
    comp_GMT329_113NC_396B_1105_ITALY_v03_SDR_FINAL_20180706_SDR_2K_HEVC.mov
    comp_GMT329_117NC_401C_1037_IRELAND_TO_ASIA_v48_SDR_PS_FINAL_20180725_F0F6300_SDR_2K_HEVC.mov
    comp_H004_C007_PS_v02_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_H004_C009_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_H005_C012_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_H007_C003_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_HK_H004_C001_PSNK_DENOISE_v14_SDR_PS_FINAL_20180731_SDR_2K_HEVC.mov
    comp_HK_H004_C008_PSNK_v19_SDR_PS_20180914_SDR_2K_HEVC.mov
    comp_HK_H004_C010_PSNK_v08_SDR_PS_20181009_SDR_2K_HEVC.mov
    comp_L007_C007_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_L010_C006_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_LA_A005_C009_PSNK_ALT_v09_SDR_PS_201809134_SDR_2K_HEVC.mov
    comp_LA_A006_C008_PSNK_ALL_LOGOS_v10_SDR_PS_FINAL_20180801_SDR_2K_HEVC.mov
    comp_LA_A008_C004_ALTB_ED_FROM_FLAME_RETIME_v46_SDR_PS_20180917_SDR_2K_HEVC.mov
    comp_LW_L001_C003__PSNK_DENOISE_v04_SDR_PS_FINAL_20180803_SDR_2K_HEVC.mov
    comp_LW_L001_C006_PSNK_DENOISE_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
    comp_N003_C006_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_N008_C009_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    CR_A009_C007_SDR_20191113_SDR_2K_HEVC.mov
    DB_D001_C001_2K_SDR_HEVC.mov
    DB_D001_C005_2K_SDR_HEVC.mov
    DB_D002_C003_2K_SDR_HEVC.mov
    DB_D011_C009_2K_SDR_HEVC.mov
    DL_B002_C011_SDR_20191122_SDR_2K_HEVC.mov
    FK_U009_C004_SDR_20191220_SDR_2K_HEVC.mov
    g201_AK_A003_C014_SDR_20191113_SDR_2K_HEVC.mov
    g201_CA_A016_C002_SDR_20191114_SDR_2K_HEVC.mov
    g201_TH_803_A001_8_SDR_20191031_SDR_2K_HEVC.mov
    g201_TH_804_A001_8_SDR_20191031_SDR_2K_HEVC.mov
    g201_WH_D004_L014_SDR_20191031_SDR_2K_HEVC.mov
    GL_G002_C002_2K_SDR_HEVC.mov
    GL_G004_C010_2K_SDR_HEVC.mov
    HK_H004_C001_2K_SDR_HEVC.mov
    HK_H004_C008_2K_SDR_HEVC.mov
    HK_H004_C010_2K_SDR_HEVC.mov
    HK_H004_C013_2K_SDR_HEVC.mov
    KP_A010_C002_SDR_20190717_SDR_2K_HEVC.mov
    LA_A005_C009_2K_SDR_HEVC.mov
    LA_A006_C008_2K_SDR_HEVC.mov
    LW_L001_C006_2K_SDR_HEVC.mov
    MEX_A006_C008_SDR_20190923_SDR_2K_HEVC.mov
    PA_A001_C007_SDR_20190717_SDR_2K_HEVC.mov
    PA_A002_C009_SDR_20190730_ALT01_SDR_2K_HEVC.mov
    PA_A004_C003_SDR_20190719_SDR_2K_HEVC.mov
    PA_A010_C007_SDR_20190717_SDR_2K_HEVC.mov
    RS_A008_C010_SDR_20191218_SDR_2K_HEVC.mov
    SE_A016_C009_SDR_20190717_SDR_2K_HEVC.mov
    DB_D011_C010_2K_SDR_HEVC.mov
    HK_B005_C011_2K_SDR_HEVC.mov
    LA_A009_C009_2K_SDR_HEVC.mov
    LA_A011_C003_2K_SDR_HEVC.mov
    comp_A015_C018_0128ZS_v03_SDR_PS_FINAL_20180709__SDR_2K_HEVC.mov
    comp_GL_G004_C010_PSNK_v04_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
    comp_GL_G010_C006_PSNK_NOSUN_v12_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
    comp_H012_C009_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_HK_B005_C011_PSNK_v16_SDR_PS_20180914_SDR_2K_HEVC.mov
    comp_L004_C011_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_L012_c002_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_LA_A006_C004_v01_SDR_FINAL_PS_20180730_SDR_2K_HEVC.mov
    comp_LA_A009_C009_PSNK_v02_SDR_PS_FINAL_20180709_SDR_2K_HEVC.mov
    comp_LA_A011_C003_DGRN_LNFIX_STAB_v57_SDR_PS_20181002_SDR_2K_HEVC.mov
    comp_N008_C003_PS_v01_SDR_PS_20180925_SDR_2K_HEVC.mov
    comp_N013_C004_PS_v01_SDR_PS_20180925_F1970F7193_SDR_2K_HEVC.mov
)

wget --no-clobber \
	http://sylvan.apple.com/Videos/comp_GMT307_136NC_134K_8277_NY_NIGHT_01_v25_SDR_PS_20180907_SDR_2K_AVC.mov

for i in "${twok[@]}"; do
	  wget --no-clobber http://sylvan.apple.com/Aerials/2x/Videos/"$i"
done

```

For only 4k videos use this script:
```
#!/bin/bash
# run this from /opt/ATV4/ which you created and assigned 755 premissions manually
fourk=(
    AK_A004_C012_SDR_20191217_SDR_4K_HEVC.mov
    BO_A012_C031_SDR_20190726_SDR_4K_HEVC.mov
    BO_A014_C008_SDR_20190719_SDR_4K_HEVC.mov
    BO_A014_C023_SDR_20190717_F240F3709_SDR_4K_HEVC.mov
    BO_A018_C029_SDR_20190812_SDR_4K_HEVC.mov
    comp_1223LV_FLARE_v21_SDR_PS_FINAL_20180709_F0F5700_SDR_4K_HEVC.mov
    comp_A001_C004_1207W5_v23_SDR_FINAL_20180706_SDR_4K_HEVC.mov
    comp_A006_C003_1219EE_CC_v01_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_A007_C017_01156B_v02_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_A008_C007_011550_CC_v01_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_A009_C001_010181A_v09_SDR_PS_FINAL_20180725_SDR_4K_HEVC.mov
    comp_A012_C014_1223PT_v53_SDR_PS_FINAL_20180709_F0F8700_SDR_4K_HEVC.mov
    comp_A013_C012_0122D6_CC_v01_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_A083_C002_1130KZ_v04_SDR_PS_FINAL_20180725_SDR_4K_HEVC.mov
    comp_A103_C002_0205DG_v12_SDR_FINAL_20180706_SDR_4K_HEVC.mov
    comp_A105_C003_0212CT_FLARE_v10_SDR_PS_FINAL_20180711_SDR_4K_HEVC.mov
    comp_A108_C001_v09_SDR_FINAL_22062018_SDR_4K_HEVC.mov
    comp_A114_C001_0305OT_v10_SDR_FINAL_22062018_SDR_4K_HEVC.mov
    comp_C001_C005_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_C003_C003_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_C004_C003_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_CH_C002_C005_PSNK_v05_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_CH_C007_C004_PSNK_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_CH_C007_C011_PSNK_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_DB_D008_C010_PSNK_v21_SDR_PS_20180914_F0F16157_SDR_4K_HEVC.mov
    comp_GL_G002_C002_PSNK_v03_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_GMT026_363A_103NC_E1027_KOREA_JAPAN_NIGHT_v17_SDR_FINAL_25062018_SDR_4K_HEVC.mov
    comp_GMT110_112NC_364D_1054_AURORA_ANTARTICA__COMP_FINAL_v34_PS_SDR_20181107_SDR_4K_HEVC.mov
    comp_GMT306_139NC_139J_3066_CALI_TO_VEGAS_v07_SDR_FINAL_22062018_SDR_4K_HEVC.mov
    comp_GMT307_136NC_134K_8277_NY_NIGHT_01_v25_SDR_PS_20180907_SDR_4K_HEVC.mov
    comp_GMT308_139K_142NC_CARIBBEAN_DAY_v09_SDR_FINAL_22062018_SDR_4K_HEVC.mov
    comp_GMT312_162NC_139M_1041_AFRICA_NIGHT_v14_SDR_FINAL_20180706_SDR_4K_HEVC.mov
    comp_GMT314_139M_170NC_NORTH_AMERICA_AURORA__COMP_v22_SDR_20181206_v12CC_SDR_4K_HEVC.mov
    comp_GMT329_113NC_396B_1105_CHINA_v04_SDR_FINAL_20180706_F900F2700_SDR_4K_HEVC.mov
    comp_GMT329_113NC_396B_1105_ITALY_v03_SDR_FINAL_20180706_SDR_4K_HEVC.mov
    comp_GMT329_117NC_401C_1037_IRELAND_TO_ASIA_v48_SDR_PS_FINAL_20180725_F0F6300_SDR_4K_HEVC.mov
    comp_H004_C007_PS_v02_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_H004_C009_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_H005_C012_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_H007_C003_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_HK_H004_C001_PSNK_DENOISE_v14_SDR_PS_FINAL_20180731_SDR_4K_HEVC.mov
    comp_HK_H004_C008_PSNK_v19_SDR_PS_20180914_SDR_4K_HEVC.mov
    comp_HK_H004_C010_PSNK_v08_SDR_PS_20181009_SDR_4K_HEVC.mov
    comp_L007_C007_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_L010_C006_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_LA_A005_C009_PSNK_ALT_v09_SDR_PS_201809134_SDR_4K_HEVC.mov
    comp_LA_A006_C008_PSNK_ALL_LOGOS_v10_SDR_PS_FINAL_20180801_SDR_4K_HEVC.mov
    comp_LA_A008_C004_ALTB_ED_FROM_FLAME_RETIME_v46_SDR_PS_20180917_SDR_4K_HEVC.mov
    comp_LW_L001_C003__PSNK_DENOISE_v04_SDR_PS_FINAL_20180803_SDR_4K_HEVC.mov
    comp_LW_L001_C006_PSNK_DENOISE_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_N003_C006_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_N008_C009_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    CR_A009_C007_SDR_20191113_SDR_4K_HEVC.mov
    DB_D001_C001_4K_SDR_HEVC.mov
    DB_D001_C005_4K_SDR_HEVC.mov
    DB_D002_C003_4K_SDR_HEVC.mov
    DB_D011_C009_4K_SDR_HEVC.mov
    DL_B002_C011_SDR_20191122_SDR_4K_HEVC.mov
    FK_U009_C004_SDR_20191220_SDR_4K_HEVC.mov
    g201_AK_A003_C014_SDR_20191113_SDR_4K_HEVC.mov
    g201_CA_A016_C002_SDR_20191114_SDR_4K_HEVC.mov
    g201_TH_803_A001_8_SDR_20191031_SDR_4K_HEVC.mov
    g201_TH_804_A001_8_SDR_20191031_SDR_4K_HEVC.mov
    g201_WH_D004_L014_SDR_20191031_SDR_4K_HEVC.mov
    GL_G002_C002_4K_SDR_HEVC.mov
    GL_G004_C010_4K_SDR_HEVC.mov
    HK_H004_C001_4K_SDR_HEVC.mov
    HK_H004_C008_4K_SDR_HEVC.mov
    HK_H004_C010_4K_SDR_HEVC.mov
    HK_H004_C013_4K_SDR_HEVC.mov
    KP_A010_C002_SDR_20190717_SDR_4K_HEVC.mov
    LA_A005_C009_4K_SDR_HEVC.mov
    LA_A006_C008_4K_SDR_HEVC.mov
    LW_L001_C006_4K_SDR_HEVC.mov
    MEX_A006_C008_SDR_20190923_SDR_4K_HEVC.mov
    PA_A001_C007_SDR_20190717_SDR_4K_HEVC.mov
    PA_A002_C009_SDR_20190730_ALT01_SDR_4K_HEVC.mov
    PA_A004_C003_SDR_20190719_SDR_4K_HEVC.mov
    PA_A010_C007_SDR_20190717_SDR_4K_HEVC.mov
    RS_A008_C010_SDR_20191218_SDR_4K_HEVC.mov
    SE_A016_C009_SDR_20190717_SDR_4K_HEVC.mov
    DB_D011_C010_4K_SDR_HEVC.mov
    HK_B005_C011_4K_SDR_HEVC.mov
    LA_A009_C009_4K_SDR_HEVC.mov
    LA_A011_C003_4K_SDR_HEVC.mov
    comp_A015_C018_0128ZS_v03_SDR_PS_FINAL_20180709__SDR_4K_HEVC.mov
    comp_GL_G004_C010_PSNK_v04_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_GL_G010_C006_PSNK_NOSUN_v12_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_H012_C009_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_HK_B005_C011_PSNK_v16_SDR_PS_20180914_SDR_4K_HEVC.mov
    comp_L004_C011_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_L012_c002_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_LA_A006_C004_v01_SDR_FINAL_PS_20180730_SDR_4K_HEVC.mov
    comp_LA_A009_C009_PSNK_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
    comp_LA_A011_C003_DGRN_LNFIX_STAB_v57_SDR_PS_20181002_SDR_4K_HEVC.mov
    comp_N008_C003_PS_v01_SDR_PS_20180925_SDR_4K_HEVC.mov
    comp_N013_C004_PS_v01_SDR_PS_20180925_F1970F7193_SDR_4K_HEVC.mov
    comp_CH_C007_C011_PSNK_v02_SDR_PS_FINAL_20180709_SDR_4K_HEVC.mov
)

for i in "${fourk[@]}"; do
	  wget --no-clobber http://sylvan.apple.com/Aerials/2x/Videos/"$i"
done
```

Now you can select it from `xscreensaver-demo` like any other. Enjoy!
