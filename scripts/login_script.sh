# -----------------------------------------
# EggTimer 4 for Alfred 4
# by Carl Smith (@CarlosNZ)
# -----------------------------------------

#Load standard constants
source ./scripts/includes.sh

#Remove pesky hidden .DS_Store files
find $EGGWD -type f -name '.DS_Store' -exec rm -f {} \;

#script_dir=$(dirname "$0")

OLD_IFS=$IFS
IFS=$'\n'

sleep 30 #Pause to give enough time for other system processes to launch.

#Check for stopped timers
for timer in "$EGGWD"/running_timers/*; do
  timer_lines=($(cat "$timer"))
  #Check if timer's bash processID still exists, and resurrect if not.
  timer_status=$(ps -o etime= -p ${timer_lines[0]})
  if [ ! $timer_status ]; then
    ./scripts/timer_resurrect.sh "$timer" &
  fi
done

#Check for stopped auto-timers
for autotimer in "$EGGWD"/running_autotimers/*; do
  autotimer_lines=($(cat "$autotimer"))
  #Check if timer's bash processID still exists, and resurrect if not.
  timer_status=$(ps -o etime= -p ${autotimer_lines[0]})
  if [ ! $timer_status ]; then
    ./scripts/timer_resurrect.sh "$autotimer" &
  fi
done

#Check for stopped alarms
for alarm in "$EGGWD"/running_alarms/*; do
  alarm_lines=($(cat "$alarm"))
  #Check if timer's bash processID still exists, and resurrect if not.
  timer_status=$(ps -o etime= -p ${alarm_lines[0]})
  if [ ! $timer_status ]; then
    ./scripts/timer_resurrect.sh "$alarm" &
  fi
done
IFS=$OLD_IFS

exit
