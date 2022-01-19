#--------SCRIPT - SEND EMAIL
#!/bin/bashPCUSER=`whoami`

echo "Updating Packages ......"; sudo apt update &> /dev/null
sudo apt install bc &> /dev/null
echo "Installing Dependencies ......"; sudo apt install python3 &> /dev/null

PCUSER=`whoami`
SCRIPTDIR="/home/$PCUSER/.scriptmail-dependencies"
mkdir $SCRIPTDIR
cd $SCRIPTDIR

wget https://github.com/VladimirBromley0750/sendmailwarningmem/blob/main/versions/1.0/checkmem_activatepy.sh &> /dev/null
echo "Downloading Needed Files ......";wget https://github.com/VladimirBromley0750/sendmailwarningmem/blob/main/versions/1.0/sendmailwarningmem.p &> /dev/null

chmod +x checkmem_activatepy.sh
chmod +x sendmailwarningmem.py

sed -i 's,###script_directory###,'"$SCRIPTDIR"',' checkmem_activatepy.sh

read -p "Warning Percentage: " -r
sed -i 's,###ram_percentage_warning###,'"$REPLY"',' checkmem_activatepy.sh
sed -i 's,###percentage_warning###,'"$REPLY"',' sendmailwarningmem.py

read -p "Sender's Gmail:  " -r
sed -i 's,###sender_email###,'"$REPLY"',' sendmailwarningmem.py

read -p "Sender's Gmail Password:  " -r
PASSWORD_BASE64B=$(echo -n $REPLY | base64)
sed -i 's,###password_base64###,'"$PASSWORD_BASE64B"',' sendmailwarningmem.py

read -p "Recipient Email:  " -r
sed -i 's,###rec_email###,'"$REPLY"',' sendmailwarningmem.py

echo "Setup Complete!"
sleep 1
