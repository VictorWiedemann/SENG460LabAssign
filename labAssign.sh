
#!/bin/bash

runDataGather()
{
if whois $1 | grep Contact; then
    echo OK
else
    echo FAIL
fi

}



echo Hello World!

#LOCAL_TEXT ="Hello"

echo "What website would you like to gather data from?"
read WEBSTITE_NAME
echo "Grabbing information on: $WEBSTITE_NAME"






