SendMailWarningMem
======
Sends you an email when RAM on you PC is greater than a set value set by you. Written in BASH and Python.

## Prerequisites:
* Having "Less Secure Apps" activated on sender's account: https://myaccount.google.com/lesssecureapps

# Installation:

##Installing Files
```
$ wget https://github.com/VladimirBromley0750/sendmailwarningmem/releases/download/Stable/installscript.sh 
$ chmod +x installscript.sh
$ ./installscript.sh
```
##Configure Crontab to run the memory script every 10 minutes
```

$ crontab -e
(select Nano)
$*/10 * * * * /bin/bash /home/[user]/.scriptmail-dependencies/checkmem_activatepy.sh              (in the end of the file)

Exit - (Ctrl+X) + y + Enter
```
##Additional Information
* To check user's name run in the terminal: "whoami"

### Version 
* Version 1.0
