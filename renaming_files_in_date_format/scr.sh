#! usr/bin/bash
echo "Enter a directory"
read var1

for f in $var1/*
do
    echo "$f"
    if [[ $f == *"txt" ]]
    then
        echo "Renamed"
        mv --backup=numbered $f $var1/"$(stat $var1/*.txt --format='%Y' | { read Y; printf "%(%d%m%Y)T%s\n" $Y; }).txt";
    else
        echo "It's not a txt file"
    fi
done
