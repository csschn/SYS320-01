#! /bin/bash
clear

# filling courses.txt
bash Courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

echo -n "Please Input an Instructor Full Name: "
read instName

echo ""
echo "Courses of $instName :"
cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
sed 's/;/ | /g'
echo ""

}

function courseCountofInsts(){

echo ""
echo "Course-Instructor Distribution"
cat "$courseFile" | cut -d';' -f7 | \
grep -v "/" | grep -v "\.\.\." | \
sort -n | uniq -c | sort -n -r 
echo ""

}

# TODO - 1
# Make a function that displays all the courses in given location
# function dislaplays course code, course name, course days, time, instructor
# Add function to the menu
# Example input: JOYC 310
# Example output: See the screenshots in canvas
function displayCourseLocation(){
read -p "Enter the class location: " location
echo "Courses in $location :"
cat "$courseFile" | grep "$location" | cut -d';' -f 1,2,5,6,7 | tr ';' ' | ' 
echo ""
}

# TODO - 2
# Make a function that displays all the courses that has availability
# (seat number will be more than 0) for the given course code
# Add function to the menu
# Example input: SEC
# Example output: See the screenshots in canvas
function displayCourseAvailability() {
read -p "Enter the subject name: " subject
echo "Courses in $subject :"
cat "$courseFile" | awk -F ';' '$4 > 0 {print $0, $1, $4, $5, $6}' | grep "$subject" 
echo ""
}

while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display all courses in given location"
	echo "[4] Display all courses that have availability for given course"

	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts

	elif [[ "$userInput" == "3" ]]; then
		displayCourseLocation

	elif [[ "$userInput" == "4" ]]; then

		displayCourseAvailability
	else
		echo "Input was invalid"
	# TODO - 3 Display a message, if an invalid input is given
	fi
done
