
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

runWhois()
{
    whoisOutput=$(whois $1)
    if [ "$?" == "0" ]; then
        #command worked, kick out with whois output
        echo "$whoisOutput"
        return 0
    fi

    stringWitoutWWW=$(echo "$1" | sed 's/^.*www.//')
    whoisOutput=$(whois $stringWitoutWWW)
    if [ "$?" == "0" ]; then
        #command failed, kick out and print error
        echo "$whoisOutput"
        return 0
    fi

    stringWitoutAt=$(echo "$1" | sed 's/^.*@//')
    whoisOutput=$(whois $stringWitoutAt)
    if [ "$?" == "0" ]; then
        #command failed, kick out and print error
        echo "$whoisOutput"
        return 0
    fi

    printError
    return 1
}

# getLine()
# {
#     textToRead="$1"
#     echo "this thang $textToRead"
#     echo $(echo "$whoisInformation" | awk -F : '$1=="$textToRead"{print $2}')
# }

SaveRelevantInfo()
{
    whoisInformation="$1"
    outputDestFile="$2"
    #"information is available here $1 and $2"
    #value=$(getLine "Registrant")
    returnValue=$(echo "$whoisInformation" | awk -F : '$1=="Registrar"{print $2}')
    echo $returnValue
    if [ "$returnValue" != "" ]; then
        echo "value: $returnValue"
    fi
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
    rawDestDir="./rawOutputFor$1.txt"
    echo "raw dest dir is: $rawDestDir"
    echo "$whoisInfo" >> $rawDestDir

    outputDestDir="./usefulInformationFor$1.txt"
    echo "output file for information is $outputDestDir"

    echo "TODO VICTOR CHANGE THE HEADER HERE" >> "$outputDestDir"

    SaveRelevantInfo "$whoisInfo" "$outputDestDir"

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