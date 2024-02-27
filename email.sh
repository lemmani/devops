#!/bin/bash
echo "Subject: Test Email" > email.txt
echo "" >> email.txt
echo "Hello, this is a test email sent from the terminal." >> email.txt
echo "Regards," >> email.txt
echo "Your Name" >> email.txt
echo "" >> email.txt

# Send the email
cat email.txt | mail -s "Test Email" lemmanuelf@gmail.com

