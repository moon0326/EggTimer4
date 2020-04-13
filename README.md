# EggTimer 4 for Alfred 4

### Installation

#### From Pacmax or Packal

1. Download the .alfredworkflow file and double click on it

#### From GitHub source

1. Download the version of release you want
2. Unzip the folder
3. Add folder to your `Alfred.alfredpreferences/workflows/` directory
   1. You can find this folder by going to `Alfred Preferences` > `Advanced` tab > `Syncing` header > `Reveal in Finder` button

### Basic Usage

The default keyword to use in Alfred is **timer**. In Alfred, set a timer with the following construction:

> **timer _MINUTES Your Reminder_**

For example:

> **timer 30 Game of Thrones time!**

And then, in 30 minutes time…

![](https://i.imgur.com/54jaJ0u.png)

…EggTimer pops up to tell you that it’s time for the [coolest-ever fictional dwarf](https://gameofthrones.fandom.com/wiki/Tyrion_Lannister) to start cutting people down to (his) size.

### Additional Features

Here is a very brief summary of some of the other things you can get EggTimer to do. For more detailed information, bring up the Help page by typing **timer help** into Alfred once it’s installed. (The Help page will load automatically the first time you run EggTimer.)

*   **timer** (with no additional parameters): Displays a list of currently running timers.
*   **timer every _MINUTES Your Reminder_**: Create an auto-repeating timer.
*   **timer kill**: Stop the last-completed auto-repeating timer.
*   **timer repeat _MINUTES_**: Repeat the last-completed timer. (Omit the **_MINUTES_** to use its previous duration.)
*   **timer snooze**: Repeat the last-completed timer for a preset duration. The default is 9 minutes.
*   **timer snooze _MINUTES_**: Set the snooze duration for future timers. (Omit the **_MINUTES_** to see the current value.)
*   **timer reset**: Cancel all running timers.
*   **timer about**: Shows basic info about EggTimer, including the version number.
