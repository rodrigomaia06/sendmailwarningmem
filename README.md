# sendmailwarningmem
Sends you an email when RAM on you PC is greater than a set value set by you. Written in BASH and Python.
Requirements:
  Having "Less Secure Apps" activated on sender's account: https://myaccount.google.com/lesssecureapps
  
  
Installation:
  Run the installscript.sh in the terminal:      ./installscript.sh
  Configure Crontab to run the memory script every 10 minutes:      
                                                                  crontab -e
                                                                  (select Nano)
                                                                  */10 * * * * /bin/bash /home/pi/checkmem-sendmail.sh          (in the end of the file)
                                                                  (Ctrl+X) + y + Enter
