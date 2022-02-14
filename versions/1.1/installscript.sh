#!/bin/bash
#------Updating Packages and Installing Dependencies
echo "Updating Packages ......"; sudo apt update &> /dev/null
sudo apt install bc &> /dev/null
echo "Installing Dependencies ......"; sudo apt install python3 &> /dev/null
#------Setting Needed Varibles and Creating the Script's Directory
PCUSER=`whoami`
SCRIPTDIR="/home/$PCUSER/.scriptmail-dependencies"
mkdir $SCRIPTDIR
cd $SCRIPTDIR
#-----Downloading Scripts from Github
wget -q https://raw.githubusercontent.com/rodrigomaia06/sendmailwarningmem/main/versions/1.1/checkmem_activatepy.sh
echo "Downloading Needed Files ......";wget -q https://raw.githubusercontent.com/rodrigomaia06/sendmailwarningmem/main/versions/1.1/sendmailwarningmem.py
#------Making the Scripts Executable
chmod +x checkmem_activatepy.sh
chmod +x sendmailwarningmem.py
#-------Replacing Personal Varibles in Scripts
sed -i 's,###script_directory###,'"$SCRIPTDIR"',' checkmem_activatepy.sh

read -p "Warning Percentage: " -r
sed -i 's,###ram_percentage_warning###,'"$REPLY"',' checkmem_activatepy.sh
sed -i 's,###percentage_warning###,'"$REPLY"',' sendmailwarningmem.py

read -p "Sender's Gmail: " -r
sed -i 's,###sender_email###,'"$REPLY"',' sendmailwarningmem.py

read -p "Sender's Gmail Password: " -r
PASSWORD_BASE64B=$(echo -n $REPLY | base64)
sed -i 's,###password_base64###,'"$PASSWORD_BASE64B"',' sendmailwarningmem.py

read -p "Recipient Email: " -r
sed -i 's,###rec_email###,'"$REPLY"',' sendmailwarningmem.py
#--------Adding Cronjob
read -p "Interval to Check Memory(5,10,15,30): " -r
echo "Updating Crontab ......";(crontab -l 2>/dev/null; echo "*/$REPLY * * * * /bin/bash /home/$PCUSER/.scriptmail-dependencies/checkmem_activatepy.sh") | crontab -; sleep 1
echo "Setup Complete!"; sleep 1
