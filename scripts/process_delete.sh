# -----------------------------------------
# EggTimer 4 for Alfred 4
# by Carl Smith (@CarlosNZ)
# -----------------------------------------

#Load standard constants
source ./scripts/includes.sh

##RECENT TIMERS

timerfile="$1"

#Extract info from txt file
OLD_IFS=$IFS
IFS=$'\n'
timer_lines=($(cat "$timerfile"))
IFS=$OLD_IFS

rm -f "$timerfile" #Delete the timer file

#Notification
echo -n "\"${timer_lines[1]}\""$'\n'"deleted"
exit
