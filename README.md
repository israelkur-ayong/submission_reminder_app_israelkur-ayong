# Submission Reminder App

# Overview

The Submission Reminder App is a Bash-based automation project that creates a ready-to-run application environment for a submission reminder system. The app sets up a directory structure, populates it with configuration files, student submission records and scripts to display reminders for assignments.

# Directory Structure
Once you run the setup script, a directory named `submission_reminder_{YourName}` will be created, containing the following subdirectories and files:

submission_reminder_{YourName}/ ├── app/ │ └── reminder.sh # Displays assignment details and student reminders ├── config/ │ └── config.env # Contains configuration variables (e.g., assignment name, days remaining) ├── modules/ │ └── functions.sh # Provides helper functions to process student data ├── assets/ │ └── submissions.txt # A CSV file with student submission records └── startup.sh # Launches the application by running reminder.sh


## Prerequisites
To run the project, you need:
- Operating System: Linux/macOS (or Windows with WSL/Git Bash)
- Shell: Bash (`bash` must be installed)
- Permissions: Ensure you have execution rights for scripts (`chmod +x`)


## How to Run Submission Reminder Application

## 1. Set Up the Environment
- Open a terminal and navigate to your project directory.
- Run the `create_environment.sh` script:
  ```bash
  chmod +x create_environment.sh
  ./create_environment.sh
  Run the provided setup script to create the project environment:
  ```bash
  chmod +x create_environment.sh
  ./create_environment.sh

## 2. Navigate to Your Directory
- Change Directory:
  Move into the newly created project folder:
  cd submission_reminder_{YourName}

## 3. Start the Application
- Run the Startup Script:
Execute the startup script to launch the reminder app:
./startup.sh

## Example Output
When you run the startup.sh script, you should see an output similar to:

Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
Reminder: Israel has not submitted the Shell Navigation assignment!
Reminder: Nathaniella has not submitted the Shell Navigation assignment!

=================================================================
Thank you for using the Submission Reminder App. Happy scripting!
