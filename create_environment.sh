#!/bin/bash

echo "Enter your name:"
read userName

# Define base directory
BASE_DIR="submission_reminder_${userName}"

echo "Creating project directory: $BASE_DIR"
mkdir -p "$BASE_DIR"/{app,modules,assets,config}

# Create and populate config.env
cat <<EOL > "$BASE_DIR/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Create and populate submissions.txt
cat <<EOL > "$BASE_DIR/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Israel, Shell Navigation, not submitted
Grace, Git, not submitted
Joy, Shell Basics, submitted
Nathaniella, Shell Navigation, not submitted
Shelia, Shell Permissions, submitted
EOL

# Create and populate functions.sh
cat <<EOL > "$BASE_DIR/modules/functions.sh"
#!/bin/bash

function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    while IFS=, read -r student assignment status; do
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file")
}
EOL

# Create and populate reminder.sh
cat <<EOL > "$BASE_DIR/app/reminder.sh"
#!/bin/bash

source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOL

# Create an empty startup.sh file

cat <<EOL > "$BASE_DIR/startup.sh"
#!/bin/bash

echo "Starting Submission Reminder App..."
bash app/reminder.sh
EOL

# Make scripts executable
chmod +x "$BASE_DIR/app/reminder.sh"
chmod +x "$BASE_DIR/modules/functions.sh"
chmod +x "$BASE_DIR/startup.sh"

echo "Environment setup complete!"

