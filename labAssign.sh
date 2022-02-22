
#!/bin/bash

printError()
{
    echo $'\nThat website does not seem to exist.'
    echo "Please use a real website in the format of:"
    echo "www.website.com or website.com"
}



runDataGather()
{
    OUTPUT=$(whois $1)
    #check to make sure that the whois command worked.
    if [ "$?" != "0" ]; then
        #command failed, kick out and print error
        printError
        return 1
    fi
    # echo "$OUTPUT"
    # echo "$OUTPUT" | grep Country
    
    echo "$OUTPUT" 
    return 0
}


#program start here
echo "What website would you like to gather data from?"
read WEBSTITE_NAME
echo "Grabbing information on the website: $WEBSTITE_NAME"

runDataGather $WEBSTITE_NAME

echo "This script was built and tested on whois-server version 1.102.2 (HEREFORD)"
