# #! /bin/sh

# # Declare the variable, $Var with a string value
# Var=" PHP and MySQL "

# # Print the value of $Var before trimming
# echo "$Var are very popular now."

# #Remove the spaces from the variable
# Var=`echo $Var | sed -e 's/^[[:space:]]*//'`

# # Print the value of $Var after trimming
# echo "$Var are very popular now."



# # extract the protocol
# proto="$(echo $1 | grep :// | sed -e's,^\(.*://\).*,\1,g')"

# # remove the protocol -- updated
# url=$(echo $1 | sed -e s,$proto,,g)

# # extract the user (if any)
# user="$(echo $url | grep @ | cut -d@ -f1)"

# # extract the host and port -- updated
# hostport=$(echo $url | sed -e s,$user@,,g | cut -d/ -f1)

# # by request host without port
# host="$(echo $hostport | sed -e 's,:.*,,g')"
# # by request - try to extract the port
# port="$(echo $hostport | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"

# # extract the path (if any)
# path="$(echo $url | grep / | cut -d/ -f2-)"

# urlWithwww="https://www.google.com" 
# # urlWithAt="bob@yahoo.com"
# # echo "$urlWithwww" | sed 's/www.//'
# # echo "$urlWithwww"
# # withoutWWW=$(echo "$urlWithwww" | awk -F : '$1=="www"{echo $2}')
# # # withoutWWW2=echo "$urlWithwww" | sed 's/^.*www.//'
# # echo $withoutWWW
# # echo "https://www.google.com" | sed 's/^.*www.//'
# # echo "$urlWithwww" | sed 's/^/first/.*www.//'
# # echo "$urlWithwww" | sed 's/.*www.//'



# # echo "$urlWithwww" | sed 's/^.*www.//'
# # echo "$urlWithwww" | sed 's/^.*@//''

# stringWitoutWWW=$(echo "$urlWithwww" | sed 's/^.*www.//')
# echo $stringWitoutWWW




#!/bin/bash

# printError()
# {
#     echo $'\nThat website does not seem to exist.'
#     echo "Please use a real website in the format of:"
#     echo "www.website.com or website.com"
# }

# printNoArguments()
# {
#     echo "WARNING!!!!!!"
#     echo "Please supply a website URL in the format of:"
#     echo "www.website.com or website.com"
# }


# getSpecificLine()
# {
#     # sed -n 'Registry Domain ID:' $OUTPUT
#     INPUT='someletters_12345_moreleters.ext'
#     SUBSTRING=$(echo $INPUT| cut -d'_' -f 2)
#     echo $SUBSTRING
#     echo "Parameters are $1 and $2 "
# }

# runWhois()
# {
#     echo "running whois"
#     whoisOutput=$(whois "$1")
#     if [ "$?" == "0" ]; then
#         #command worked, kick out with whois output
#         echo "whois worked"
#         echo whoisOutput
#         return 0
#     fi
#     echo $whoisOutput

#     echo "maybe www"
#     stringWitoutWWW=$(echo "$urlWithwww" | sed 's/^.*www.//')
#     #echo $stringWitoutWWW
#     whoisOutput=$(whois $stringWitoutWWW)
#     if [ "$?" == "0" ]; then
#         #command failed, kick out and print error
#         echo "whois with www worked"
#         echo whoisOutput
#         return 0
#     fi
#     echo "maybe email address?"
#     stringWitoutAt=$(echo "$urlWithwww" | sed 's/^.*@//')
#     #echo $stringWitoutWWW
#     whoisOutput=$(whois $stringWitoutAt)
#     if [ "$?" == "0" ]; then
#         #command failed, kick out and print error
#         echo "whois with @ worked"
#         echo whoisOutput
#         return 0
#     fi

#     printError
#     return 1
# }



# runDataGather()
# {
#     OUTPUT=$($1)
#     whoisInfo=$(runWhois $OUTPUT)
#     #check to make sure that the whois command worked.

#     echo "$whoisInfo"
#     #echo "$whoisInfo" | grep Country
    
#     getSpecificLine "one" "two"

#     return 0
# }


# #program start here
# if [ $# -eq 0 ]
#   then
#     printNoArguments
#     exit
# fi

# echo "Grabbing information on the website: $1"

# runDataGather $1

# echo "This script was built and tested on whois-server version 1.102.2 (HEREFORD)"


