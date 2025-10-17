# submission_reminder_app_nyves01
# Submission Reminder App

This application tracks student assignment submissions and keeps you update.

---

## Step 1: Setup the Environment

Run the setup script to create the project directory, subdirectories, and necessary files:

```bash
chmod +x create_environment.sh
./create_environment.sh

A folder submission_reminder_nyves01 will be created.
It will contain all needed subdirectories (config, data, scripts) and files.
All .sh scripts inside will automatically be made executable.

Step 2: Run the Reminder App
Navigate into your new directory and start the app:

bash

cd submission_reminder_yourname/scripts
./startup.sh
This will show the current assignment and list students who have not submitted it yet.

Step 3: Change the Assignment Being Tracked
Go back to the main folder and run the copilot script:

bash

cd ../..
chmod +x copilot_shell_script.sh
./copilot_shell_script.sh
The script will detect your submission_reminder_ yourname folder automatically.
Type the name of the new assignment , for example:

nginx
Copy code
Shell Navigation
Shell Basics
Git
Emacs
Vi
After updating, go back into your submission folder and run:

bash

cd submission_reminder_<yourName>/scripts
./startup.sh
This will show the submission status for the new assignment.

Main Files
File	Description
create_environment.sh	Creates the full app environment and files.
copilot_shell_script.sh	Lets you change the tracked assignment.
startup.sh	Runs the reminder check for pending submissions.
functions.sh	Contains helper logic for checking submissions.
reminder.sh	Loads assignment and displays pending students.
config.env	Holds assignment settings and reminder interval.


Author: nyirihirwe yves
github: nyves01

project name: submission_reminder_app_nyves01  EOF ```
