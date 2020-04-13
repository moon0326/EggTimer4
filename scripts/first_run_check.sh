# -----------------------------------------
# EggTimer 4 for Alfred 4
# by Carl Smith (@CarlosNZ)
# -----------------------------------------

#First run check
if [ ! -e "$HOME/Library/Application Support/Alfred/Workflow Data/carlosnz.eggtimer4/version" ]; then
  ./scripts/first_install.sh
  exit
fi

ver=$(cat "$HOME/Library/Application Support/Alfred/Workflow Data/carlosnz.eggtimer4/version")
if [ $ver -lt 400 ]; then
  ./scripts/first_install.sh
fi
