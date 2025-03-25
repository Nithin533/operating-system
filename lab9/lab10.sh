#!/bin/bash
# Shell Script for Piping Commands
# Usage: ./piping_commands.sh

# Function to display the contents of the current directory
list_directory_contents() {
    echo "Listing contents of the current directory:"
    ls -l
    echo ""
}

# Function to filter and sort directory contents
filter_and_sort_contents() {
    read -p "Enter a pattern to filter files (e.g., .txt for text files): " pattern
    echo "Filtering and sorting files with pattern '$pattern'..."
    # Use ls, grep, and sort in a pipeline
    ls -l | grep "$pattern" | sort
    echo ""
}

# Function to search for a particular folder
search() {
    read -p "Enter the directory to start the search (e.g., /home/user): " search_dir
    read -p "Enter the folder name you're searching for: " folder_name

    # Use the find command to search for the folder
    find "$search_dir" -type d -name "$folder_name" 2>/dev/null
    echo ""
}

# Function to count files and directories
count() {
    file_count=$(find . -type f | wc -l)
    dir_count=$(find . -type d | wc -l)
    dir_count=$((dir_count - 1)) # Exclude the current directory

    echo "Number of files: $file_count"
    echo "Number of directories: $dir_count"
    echo ""
}

# Function to count executable files
execute() { # Corrected function name to avoid typo.
    executable_count=$(find . -type f -executable | wc -l)
    echo "Number of executable files: $executable_count"
    echo ""
}

# Main menu for user interaction
echo "Piping Commands Manager"
echo "1. List contents of the current directory"
echo "2. Filter and sort directory contents"
echo "3. Search for a folder"
echo "4. Count files and directories"
echo "5. Number of executable files" # Corrected Menu text.
echo "6. Exit"

# Loop until the user chooses to exit
while true; do
    read -p "Select an option (1-6): " option # Corrected menu option range.
    case $option in
        1) # List directory contents
            list_directory_contents
            ;;
        2) # Filter and sort directory contents
            filter_and_sort_contents
            ;;
        3) # Search for a folder
            search
            ;;
        4) # Count files and directories
            count
            ;;
        5) # Number of executable
            execute # Corrected function name.
            ;;
        6) # Exit
            echo "Exiting the Piping Commands Manager. Goodbye!"
            exit 0
            ;;
        *) # Invalid option
            echo "Invalid option. Please select 1-6." # Corrected menu option range.
            ;;
    esac
done
