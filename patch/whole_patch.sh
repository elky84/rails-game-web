#!/bin/bash

export WORKING=$WORKSPACE/GundamBase
export SRC=$WORKSPACE/Sunbee/web/patch
export OUTPUT=/Users/radicham/Library/Application\ Support/RadicalChamber/Sunbee

make_bundle_list()
{
	ruby -I "$WORKING/SazabiExcel" "$WORKING/SazabiExcel/ExcelReader_mac.rb" $1 $2 $3 $4 $5 $6 "$OUTPUT"
}


make_bundle_list "$SRC/BG_list.xlsx" "BG_LIST" "INDEX" "json_onlyfile" "_" "Android"
if [ "$?" = "0" ] ; then
	ruby "$SRC/bg_patch_mac.rb" DEV Android
else
	echo "fail"
fi


make_bundle_list "$SRC/effect_list.xlsx" "EFFECT_LIST" "INDEX" "json_onlyfile" "_" "Android"
if [ "$?" = "0" ] ; then
	ruby "$SRC/effect_patch_mac.rb" DEV Android
else
	echo "fail"
fi


make_bundle_list "$SRC/sound_list.xlsx" "SOUND_LIST" "INDEX" "json_onlyfile" "$WORKING/Sunbee/program" "Android"
if [ "$?" = "0" ] ; then
	ruby "$SRC/sound_patch_mac.rb" DEV Android "Sound/Clip/Area/"
	ruby "$SRC/sound_patch_mac.rb" DEV Android "Sound/Clip/SFX/"
	ruby "$SRC/sound_patch_mac.rb" DEV Android "Sound/Clip/Skill/"
	ruby "$SRC/sound_patch_mac.rb" DEV Android "Sound/Clip/Voice/"
else
	echo "fail"
fi

make_bundle_list "$SRC/spine_list.xlsx" "SPINE_LIST" "INDEX" "json_onlyfile" "$WORKING/Sunbee/program" "Android"

if [ "$?" = "0" ] ; then
	ruby "$SRC/spine_patch_mac.rb" DEV Android
else
	echo "fail"
fi


make_bundle_list "$SRC/texture_list.xlsx" "TEXTURE_LIST" "INDEX" "json_onlyfile" "$WORKING/Sunbee/program" "Android"
if [ "$?" != "0" ] ; then
	echo "fail"
fi

make_bundle_list "$SRC/texture_list.xlsx" "ALPHA_TEXTURE_LIST" "INDEX" "json_onlyfile" "$WORKING/Sunbee/program" "Android"
if [ "$?" != "0" ] ; then
	echo "fail"
fi

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Equipments/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Event/"

#ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Loading/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Mastery/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Scenario_Chr_Imgs/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Shop_Items/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Skills/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Skills/Buff/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Thumbnails/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Title/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Img_Textures/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Img_Textures/Ad_Img/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Img_Textures/Guide_UI_Img/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Img_Textures/Tutorial_Img/"

ruby "$SRC/texture_patch_mac.rb" DEV Android "UI/Textures/Icon/"
