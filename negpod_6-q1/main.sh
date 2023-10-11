#!/bin/bash

# Function to create a student record
create_student() {
    read -p "Enter student email: " email
    read -p "Enter student age: " age
    read -p "Enter student ID: " student_id

    # Check if the student ID already exists
    if grep -q "$student_id" students-list_0923.txt; then
        echo "Student with ID $student_id already exists."
    else
        echo "$email $age $student_id" >> students-list_0923.txt
        echo "Student record added successfully."
    fi
}

# Function to view all student records
view_students() {
    echo "Student Email             Age  ID"
    echo "------------------------------------"
    cat students-list_0923.txt | while read line; do
        echo "$line"
    done
    echo "------------------------------------"
}

# Function to delete a student record by ID
delete_student() {
    read -p "Enter student ID to delete: " student_id
    # Use grep to filter out the student with the given ID
    grep -v "$student_id" students-list_0923.txt > temp.txt
    mv temp.txt students-list_0923.txt
    echo "Student with ID $student_id deleted successfully."
}

# Function to update a student record by ID
update_student() {
    read -p "Enter student ID to update: " student_id
    if grep -q "$student_id" students-list_0923.txt; then
        read -p "Enter new student email: " new_email
        read -p "Enter new student age: " new_age

        # Use sed to update the student record
        sed -i "/$student_id/c$new_email $new_age $student_id" students-list_0923.txt
        echo "Student with ID $student_id updated successfully."
    else
        echo "Student with ID $student_id does not exist."
    fi
}

# Main menu
while true; do
    echo "ALU Student Registration System"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            create_student
            ;;
        2)
            view_students
            ;;
        3)
            delete_student
            ;;
        4)
            update_student
            ;;
        5)
            echo "Exiting the application."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
done
