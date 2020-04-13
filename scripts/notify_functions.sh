notify() {

  #What is the chosen notification method?
  prefs=$(cat info.plist | tr -d '\n\t') #Load workflow's settings info
  if [[ "$prefs" = *'<key>output</key><integer>0</integer>'* ]]; then
    notification=default
  fi
  if [[ "$prefs" = *'<key>output</key><integer>1</integer>'* ]]; then
    notification=NC
  fi

  if [ $notification = default ]; then
    notpref=$(cat ../../preferences/notifications/prefs.plist | tr -d '\n\t')
    notification=NC
  fi

  if [ "$5" = alarm ]; then
    nc_icon="$PWD/resources/icon_alarm.icns"
    dummy_app="EggTimer Alarm"
  else
    nc_icon="$PWD/resources/icon.icns"
    dummy_app="EggTimer"
  fi

  if [ $notification = NC ]; then
    ./MountainNotifier/MountainNotifier "$dummy_app" "$2" "$3" "$4" "$nc_icon"
  fi
}
