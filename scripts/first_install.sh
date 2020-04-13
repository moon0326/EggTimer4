# -----------------------------------------
# EggTimer 4 for Alfred 4
# by Carl Smith (@CarlosNZ)
# -----------------------------------------

#Load standard constants
source ./scripts/includes.sh

wfdir=$PWD #Get workflow directory

#Show documentation
#open ./docs/help.html 	#Not going to do this anymore until next significant release

##Build Eggtimer working folders in proper location
mkdir "$EGGPREFS"
mkdir "$EGGWD"
mkdir "$EGGWD"/running_timers
mkdir "$EGGWD"/running_autotimers
mkdir "$EGGWD"/running_alarms
mkdir "$EGGWD"/recent_timers
mkdir "$EGGWD"/last_completed_timer
mkdir "$EGGWD"/last_completed_autotimer
mkdir "$EGGWD"/last_completed_alarm
echo 9 >"$EGGPREFS"/snoozetimer.txt
echo "400" >"$EGGPREFS"/version
echo $wfdir >"$EGGPREFS"/eggwd.txt
cp -R scripts/login_check.workflow "$EGGPREFS"
rm -f "$EGGPREFS"/firstrun.log
rm -f "$EGGPREFS"/2.0beta4b_firstrun.log

#Ask user for permission to install launchd startup check
scriptstring="tell app \"System Events\" to display dialog \"Would you like EggTimer to resume your running timers when you log back in to your computer after a restart?

See documentation (“timer help” in Alfred) for more info.\" buttons {\"No thanks\", \"Do it!\"} default button {\"Do it!\"} with title \"EggTimer for Alfred\" with icon POSIX file \"$wfdir/resources/icon.icns\""

permission=$(osascript -e "$scriptstring")

if [ "$permission" = "button returned:Do it!" ]; then
  #Create plist for launchd item
  echo '<?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
  <dict>
     <key>Label</key>
     <string>net.philosophicalzombie.eggtimer</string>
    <key>ProgramArguments</key>
      <array>
      <string>automator</string>
      <string>'$EGGPREFS'/login_check.workflow</string>
      </array>
     <key>RunAtLoad</key>
     <true/>
  </dict>
  </plist>' >net.philosophicalzombie.eggtimer.plist

  mv net.philosophicalzombie.eggtimer.plist ~/Library/LaunchAgents
fi
