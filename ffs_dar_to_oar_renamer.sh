#!/bin/bash

get_weapon () {
    local index=$1
    if [ ${1:0:1} -eq 0 ]
    then
        index=${1:1:1}
    fi
    local array=(
        "Fist Weapon"
        "Sword"
        "Dagger"
        "Waraxe"
        "Mace"
        "Greatsword"
        "Battleaxe"
        "Bow"
        "Staff"
        "Crossbow"
        "Warhammer"
        "Shield"
        "Alteration Magic"
        "Illusion Magic"
        "Destruction Magic"
        "Conjuration Magic"
        "Restoration Magic"
        "Scrolls"
        "Torch"
        "Spear"
        "Javelin"
        "Pike"
        "Halberd"
        "Rapier"
        "Quarterstaff"
        "Claw"
        "Scythe 1H"
        "Scythe 2H"
        "Whip"
        "Katana 1H"
        "Katana 2H"
        "Gun 1H"
        "Gun 2H"
        "Shortspear"
        "Poleaxe"
        "Club"
        "Half Pike"
        "Maul"
        "Hatchet"
        "Shortsword"
        "Glaive"
        "Longmace"
        "Curved Sword 1H"
        "Curved Sword 2H"
        "Trident"
    )

    echo ${array[$index]}
}

get_complexity () {
    local index=$1-1
    local array=(
        "Novice"
        "Apprentice"
        "Adept"
        "Expert"
        "Master"
    )
    echo ${array[$index]}
}

get_style () {
    local array=(
        "Single"
        "Dualwield"
        "Single&Shield"
    )
    echo ${array[$1]}
}

rename_folder () {
    
    local segment="${folder:0:7}"
    local weapon=$(get_weapon ${folder:1:2})
    local complexity=$(get_complexity ${folder:3:1})
    local style=$(get_style ${folder:4:1})
    echo "[$segment] - $weapon - $complexity - $style"
}

dir=$(basename "$(pwd)")
thisdate=$(date +%F_%R)
newdir="$dir ($thisdate)"

cp -r -v "$(pwd)/" "../$newdir"

workingdir="$(pwd) ($thisdate)"

for d in "$workingdir"/*/ ; do
    folder="$(basename "$d")"
    mkdir -p "$workingdir/Backup"

    if [ ${#folder} -eq 7 ] && [ ${folder:0:1} == "9" ]
    then
        newfolder=$(rename_folder)
        newfolderdir="$workingdir/$newfolder"
        mv -v "$d" "$newfolderdir"
        json="$newfolderdir/config.json"
        name=${newfolder%/}
        jq '.name = $newVal' --arg newVal "$name" "$json" > "$newfolderdir"/tmp.$$.json && mv "$newfolderdir"/tmp.$$.json "$json"
    else
        echo "Skipping and backing up $folder..."
        mv -v "$d" "$workingdir/Backup/"
    fi

done
