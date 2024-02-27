greeting="Hello"

echo " $greeting , $1!"

echo " $whoami"

if [ -n "$2" ]; then 

	echo "you also mentioned '$2'"
else 
	echo "No second argument was provided."

fi 

echo " total number of arguments = $#"
