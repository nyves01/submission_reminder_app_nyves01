#!/usr/bin/env bash

#a directory that will contain the name of the user

read -p "Enter your name: " username
mkdir -p "submission_reminder_${username}"


#creating more directories

ParentDir="submission_reminder_${username}"
mkdir -p "$ParentDir/app" "$ParentDir/modules" "$ParentDir/assets" "$ParentDir/config"

#inside of directories we created file but not empty

# create the reminder file
REMINDER="$ParentDir/app/reminder.sh"
if [ ! -s "$REMINDER" ]; then
	cat <<'EOL' > "$REMINDER"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"
EOL
chmod +x "$REMINDER"
fi

# create the Functions file
FUNCTION="$ParentDir/modules/functions.sh"
if [ ! -s "$FUNCTION" ];then
	cat <<'EOL' > "$FUNCTION"
#!/usr/bin/env bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines

    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL
chmod +x "$FUNCTION"
	fi

# we create the Submission file
SUBMISSION="$ParentDir/assets/submissions.txt"
if [ ! -s "$SUBMISSION" ];then
	cat <<'EOL' > "$SUBMISSION"

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Bosco, Git, submitted
Patient, Shell Navigation, not submitted
Milae, Shell Navigation, submitted
Beza, Emacs, submitted
kevih, Vi, submitted
EOL
fi

# we create the Config file
CONFIG="$ParentDir/config/config.env"
if [ ! -s "$CONFIG" ];then
	cat << 'EOL' > "$CONFIG"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL
fi



# Lastly we create the Startup file
STARTUP="$ParentDir/startup.sh"
if [ ! -s "$STARTUP" ]; then
	cat << 'EOL' > "$STARTUP"
#!/usr/bin/env bash

# Startup script for Submission Reminder App

cd "$(dirname "$0")"
echo -n "Starting the Submission Reminder App"
for i in {1..3}; do
    sleep 1         # wait 1 second
    echo -n "."     # print a dot without newline
sleep 2
done
echo                # move to a new line after the dots

echo" "

bash app/reminder.sh
EOL
chmod +x "$STARTUP"
fi

#Complete
echo "Environment setup complete!"

echo "Now Run '$ParentDir/startup.sh' to start the app."
