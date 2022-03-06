
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
    lineValue="$3"
    valueToSearchFor="$4"
    #"information is available here $1 and $2"
    # value=$(getLine "Registrant")
    # returnValue=$(echo "$whoisInformation" | awk -F : '$1=="Registrar"{print $2}')
    # if [ "$returnValue" != "" ]; then
    #     echo "value: $returnValue"
    # fi
    
    echo "$valueToSearchFor"
    #stringToUse='$1=='"${valueToSearchFor}"'{print $2}'
    stringPrefix='$1=="'
    stringSuffix='"{print $2}'
    stringToUse="${stringPrefix}${valueToSearchFor}${stringSuffix}"
    echo $stringToUse
    # returnValue=$(echo "$whoisInformation" | awk -F : '$1=="$valueToSearchFor"{print $2}')
    returnValue=$(echo "$whoisInformation" | awk -F : "$stringToUse")
    echo "return value is $returnValue"
    if [ "$returnValue" != "" ]; then
        echo "$lineValue: $returnValue"
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
    rawDestDir="./raw_output_for_$1.txt"
    echo "raw dest dir is: $rawDestDir"
    rm "$rawDestDir" &> /dev/null
    echo "$whoisInfo" >> $rawDestDir

    outputDestDir="./useful_information_for_$1.txt"
    
    echo "output file for information is $outputDestDir"
    rm "$outputDestDir" &> /dev/null
    echo "TODO VICTOR CHANGE THE HEADER HERE" >> "$outputDestDir"

    #SaveRelevantInfo "$whoisInfo" "$outputDestDir"
    SaveRelevantInfo "$whoisInfo" "$outputDestDir" "Starter" "Registrar" 
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