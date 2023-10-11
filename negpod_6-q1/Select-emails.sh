#!/bin/bash

# Select and save emails

cut -d ',' -f 1 students-list_0923.txt > student-emails.txt

echo "Student emails saved to student-emails.txt."
