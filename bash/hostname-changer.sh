#!/bin/bash
#
# This script is for the bash lab on variables, dynamic data, and user input
# Download the script, do the tasks described in the comments
# Test your script, run it on the production server, screenshot that
# Send your script to your github repo, and submit the URL with screenshot on Blackboard

# RAJPREET KAUR

# Get the current hostname using the hostname command and save it in a variable
hname=`hostname`

# Tell the user what the current hostname is in a human friendly way
echo '============================'
echo 'Current Host: ' $hname

# Ask for the user's student number using the read command
echo '============================'
echo 'Enter your student number:'
read studentNumber
echo 'Your Student number:'
echo $studentNumber
# 200458082

# Use that to save the desired hostname of pcNNNNNNNNNN in a variable, where NNNNNNNNN is the student number entered by the user
echo '============================'
newhostname='pc'
newhostname+=$studentNumber
echo 'Concatinated Student Number:'
echo $newhostname

# If that hostname is not already in the /etc/hosts file, change the old hostname in that file to the new name using sed or something similar and
#     tell the user you did that
#e.g. sed -i "s/$oldname/$newname/" /etc/hosts
echo '============================='
sudo sed -i "s/$hname/$newhostname/" /etc/hosts && echo 'Tried to change old Hostname to New Host Name By changing /etc/hosts'

# If that hostname is not the current hostname, change it using the hostnamectl command and
#     tell the user you changed the current hostname and they should reboot to make sure the new name takes full effect
#e.g. hostnamectl set-hostname $newname
echo '=============================='
if [[ $hostname != $newhostname ]]; then
	hostnamectl set-hostname $newhostname && echo 'Changed hostname using hostnamectl command'
fi

#For Verification
echo '==============================='
echo 'Now Hostname: ' `hostname`
echo '==============================='


