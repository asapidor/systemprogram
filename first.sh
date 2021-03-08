#!bin/bash

echo "CD image creation program"
echo "with this program, you can create a CD image at the specified path to the file directory"
echo "Developer: Andreev Petr 737-1"

again=yes
data=$(date)

while [ "$again" = "yes" ]
do

 fab=yes
 while [ "$fab" = "yes" ]
 do
 echo "Enter to path to the folder: "
 read path

 if [ -e "$path" ]
 then
   echo "Such a directory exsist. Enter the name of the image of create: "
   read name
   if [ -e /home/"$name".iso ]
     then
     echo "The file already exists but we will create a file with the same name and today's date"
     name1="$name""$data"
     genisoimage -V "$name1" -r -o /home/"$name1".iso /"$path"
     echo "New disk image created. Would you like to contuine working in the program?[yes/any other character or character sequence]"
     read fab
   else
     genisoimage -V "$name" -r -o /home/"$name".iso /"$path"
     echo "Disk image created. Would you like to contuine working in the program?[yes/any other character or character sequence]"
     read fab
 fi
 else
   echo "Such a directory not exsist. Would you like to enter the path again?[Yes/any other character or character sequence]">&2
 read fab
 fi

done

 echo "Would you like to contuine working in the program?[yes/any other character or character sequence]"
 read again
done
