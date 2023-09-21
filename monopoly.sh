#!/bin/bash

function clear_app() {
   local emulator="$1"
    local package_name="$2"
    echo "Clearing android data for $package_name"
        adb -s "$emulator" shell am force-stop "$package_name"
    adb -s "$emulator" shell pm clear "$package_name"
   
}

function open_link() {
    local emulator="$1"
    local link="$2"
    echo "Opening link to $link"
     adb -s "$emulator" shell am start -a android.intent.action.VIEW -d "$link"
}

counter=0

while [ true ]
do
    echo "Friend Count: $counter "

    clear_app "emulator-5556" "com.google.android.gms"
    clear_app "emulator-5556" "com.scopely.monopolygo"

    wait 

    open_link "emulator-5556" "https://s.scope.ly/9UJObZAS6zE"

    sleep 50

    ((counter++))
done
