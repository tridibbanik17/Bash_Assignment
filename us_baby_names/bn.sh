#!/bin/bash
if [[ $2 = "" ]]
then
    echo "bn <year> <assigned gender f|F|m|M|b|B>" >&2
    exit 1
elif [[ $2 = [^FfMmBb] ]]
then
    echo "Badly formatted assigned gender: $2" >&2
    echo "bn <year> <assigned gender f|F|m|M|b|B>" >&2
    exit 2
elif [[ $1 -gt 2022 || $1 -lt 1880 ]]
then 
    echo "No data for $1" >&2
    exit 4

else
    while read line
    do
        for word in $line
        do
            if [[ $word != ^[a-zA-Z]+$ ]]
            then 
                echo "Badly formatted name: $word" >&2
                exit 3
            fi

            file="yob$1.txt"
            findMale=$(cat $file | grep -P -i -o "^${word},M,")
            findFemale=$(cat $file | grep -P -i -o "^${word},F,")

            if [[ $2 =~ ^[mM]$ ]]
            then
                gender="male"
                #check if the length of the string stored in the variable $find is zero.
                if [[ "$findMale" = "" ]]
                then
                    echo "$1: $word not found among $gender names."
                    
                else
                    totalNames=$(cat $file | grep ,$2, | wc -l) 
                    rank=$(cat $file | grep -P -i ",$2," | grep -P -o -i -n "^${word},$2," | cut -d: -f1)
                    echo "$1: $word ranked $rank out of $totalNames $gender names." 
                fi  

            elif [[ $2 =~ ^[fF]$ ]]
            then
                gender="female"
                if [[ "$findFemale" = "" ]]
                then
                    echo "$1: $word not found among $gender names."
                    
                else
                    totalNames=$(cat $file | grep ,$2, | wc -l) 
                    rank=$(cat $file | grep -P -i ",$2," | grep -P -o -i -n "^${word},$2," | cut -d: -f1)
                    echo "$1: $word ranked $rank out of $totalNames $gender names." 
                fi
            
            elif [[ $2 =~ ^[bB]$ ]]
            then 
                if [[ "$findMale" = "" ]]
                then
                    gender="male"
                    echo "$1: $word not found among $gender names."
                    
                else
                    gender="male"
                    totalNames=$(cat $file | grep ,M, | wc -l) 
                    rank=$(cat $file | grep -P -i ",M," | grep -P -o -i -n "^${word},M," | cut -d: -f1)
                    echo "$1: $word ranked $rank out of $totalNames $gender names." 
                fi

                if [[ "$findFemale" = "" ]]
                then
                    gender="female"
                    echo "$1: $word not found among $gender names."
                    
                else
                    gender="female"
                    totalNames=$(cat $file | grep ,F, | wc -l) 
                    rank=$(cat $file | grep -P -i ",F," | grep -P -o -i -n "^${word},F," | cut -d: -f1)
                    echo "$1: $word ranked $rank out of $totalNames $gender names." 
                fi
            fi
        done  
    done
fi