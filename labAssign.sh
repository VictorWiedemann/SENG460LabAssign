
#!/bin/bash

printError()
{
    echo $'\nThat website does not seem to exist.'
    echo "Please use a real website in the format of:"
    echo "www.website.com or website.com"
}

printNoArguments()
{
    echo "WARNING!!!!!!"
    echo "Please supply a website URL in the format of:"
    echo "www.website.com or website.com"
}


getSpecificLine()
{
    # sed -n 'Registry Domain ID:' $OUTPUT
    INPUT='someletters_12345_moreleters.ext'
    SUBSTRING=$(echo $INPUT| cut -d'_' -f 2)
    echo $SUBSTRING
    echo "Parameters are $1 and $2 "
}

runWhois()
{
    echo "runwhois"
    whoisOutput=$(whois $1)
    if [ "$?" == "0" ]; then
        #command worked, kick out with whois output
        echo "$whoisOutput"
        return 0
    fi

    echo "maybe www"
    stringWitoutWWW=$(echo "$1" | sed 's/^.*www.//')
    echo $stringWitoutWWW
    whoisOutput=$(whois $stringWitoutWWW)
    if [ "$?" == "0" ]; then
        #command failed, kick out and print error
        echo "whois with www worked"
        echo "$whoisOutput"
        return 0
    fi

    echo "maybe email address?"
    stringWitoutAt=$(echo "$1" | sed 's/^.*@//')
    echo $stringWitoutAt
    whoisOutput=$(whois $stringWitoutAt)
    if [ "$?" == "0" ]; then
        #command failed, kick out and print error
        echo "whois with @ worked"
        echo "$whoisOutput"
        return 0
    fi

    printError
    return 1
}

SaveRelevantInfo()
{
    whoisOutput=$1
    outputfile=$2
    echo "$whoisOutput and $outputfile"
    value=$(echo "$")
}


runDataGather()
{
    echo "runDataGather"
    whoisInfo=$(runWhois $1)
    if [ "$?" != "0" ]; then
        #command failed, kick out and print error
        echo printError
        return 0
    fi

    #check to make sure that the whois command worked.
    rawDestDir = "./rawOutputFor$1.txt"
    echo "raw dest dir is: $rawDestDir"
    echo "$whoisInfo" >> $rawDestDir

    outputDestDir = "./usefulInformationFor$1.txt"
    echo "output file for information is $outputDestDir"

    echo "TODO VICTOR CHANGE THE HEADER HERE" >> "$outputDestDir"

    echo "$whoisInfo"
    SaveRelevantInfo $whoisInfo $outputDestDir
    echo "running whois Info"
    echo "$whoisInfo"
    #echo "$whoisInfo" | grep Country
    
    getSpecificLine "one" "two"

    return 0
}


#program start here
if [ $# -eq 0 ]
  then
    printNoArguments
    exit
fi

echo "Grabbing information on the website: $1"

runDataGather $1

echo "This script was built and tested on whois-server version 1.102.2 (HEREFORD)"













































# if [ $# -eq 0 ]
#   then
#     printNoArguments
#     exit
# fi

# OUTPUT=$(whois $1)


# echo "Grabbing information on the website: $1"

# echo "$1"
# echo "running whois"
# whoisOutput=$(whois $1)
# if [ "$?" != "0" ]; then
#     echo "maybe www"
#     stringWithoutWWW=$(echo "$1" | sed 's/^.*www.//')
#     #echo $stringWithoutWWW
#     echo "$stringWithoutWWW"
#     whoisOutput=$(whois $stringWithoutWWW)
#     if [ "$?" != "0" ]; then
#         #command failed, kick out and print error
#         echo "maybe email address?"
#         stringWitoutAt=$(echo "$1" | sed 's/^.*@//')
#         whoisOutput=$(whois $stringWitoutAt)
#         if [ "$?" != "0" ]; then
#             #command failed, kick out and print error
#             echo "whois with @ worked"
#             echo "$whoisOutput"
#             printError
#             exit
#         fi
#     fi
# fi

# echo whoisOutput
# #check to make sure that the whois command worked.

# echo "running whois Info"
# echo "$whoisOutput"
# #echo "$whoisInfo" | grep Country

# getSpecificLine "one" "two"

# echo "This script was built and tested on whois-server version 1.102.2 (HEREFORD)"