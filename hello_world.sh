#!/bin/bash


#example hello world 
STRING="Hello World"
# print variable on a screen
echo $STRING

# conditions 
Age=17
if [ "$Age" -ge 18 ]; then
    echo "You can vote"
else
    echo "You cannot vote"    
fi


# declare  variable
Name="SATYAJIT GHOSH"
Age=20
echo "The name is $Name and Age is $Age"



# scopes 
var1="Apple" #global variable
myfun(){
    local var2="Banana" #local variable
    var3="Cherry" #global variable
    echo "The name of first fruit is $var1"
    echo "The name of second fruit is $var2"
}
myfun #calling function

echo "The name of first fruit is $var1"
#trying to access local variable
echo "The name of second fruit is $var2"
echo "The name of third fruit is $var3"



# input and output 
echo "Enter filename"
read filename

if [ -e $filename ]
then
echo "$filename is exits on the directory"
cat $filename

else
    cat > $filename  #use  >> to append  
    echo "File created"
fi



# cases 
Name="Satyajit"
case "$Name" in
    #case 1
    "Rajib") echo "Profession : Software Engineer" ;;
    
    #case 2
    "Vikas") echo "Profession : Web Developer" ;;
    
    #case 3
    "Satyajit") echo "Profession : Technical Content Writer" ;;
esac



# cd: Change the directory to a different location.
# ls: List the contents of the current directory.
# mkdir: Create a new directory.
# touch: Create a new file.
# rm: Remove a file or directory.
# cp: Copy a file or directory.
# mv: Move or rename a file or directory.
# echo: Print text to the terminal.
# cat: Concatenate and print the contents of a file.
# grep: Search for a pattern in a file.
# chmod: Change the permissions of a file or directory.
# sudo: Run a command with administrative privileges.
# df: Display the amount of disk space available.
# history: Show a list of previously executed commands.
# ps: Display information about running processes.






#!/bin/bash

# set -x ### to debug 
# set -e ### to exit after any failed command

# Your script goes here

