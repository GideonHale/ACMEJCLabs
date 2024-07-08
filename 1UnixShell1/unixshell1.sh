#!/bin/bash

# remove any previously unzipped copies of Shell1/
if [ -d Shell1 ];
then
  echo "Removing old copies of Shell1/..."
  rm -r Shell1
  echo "Done"
fi

# unzip a fresh copy of Shell1/
echo "Unzipping Shell1.zip..."
unzip -q Shell1
echo -e "Done\n"

: ' Problem 1: In the space below, write commands to change into the
Shell1/ directory and print a string telling you the current working
directory. '

echo "**Problem 1**"
echo -e "Navigating to \"Shell1/\"..."
cd Shell1/
echo "Current Directory:"
pwd
echo -e "** Problem 1 done **\n"

: ' Problem 2: Use ls with flags to print one list of the contents of
Shell1/, including hidden files and folders, listing contents in long
format, and sorting output by file size. '

echo "** Problem 2 **"
echo "Printing contents of \"Shell1/\"..."
ls -alsS
echo -e "** Problem 2 done **\n"

: ' Problem 3: Inside the Shell1/ directory, delete the Audio/ folder
along with all its contents. Create Documents/, Photos/, and
Python/ directories. Rename the Random/ folder as Files/. '

echo "** Problem 3 **"
echo -e "Deleting \"Audio/\" recursively..."
rm -rv Audio/
echo -e "Creating \"Documents/\"..."
mkdir Documents/
echo -e "Creating \"Photos/\"..."
mkdir Photos/
echo -e "Creating \"Python/\"..."
mkdir Python/
echo -e "Renaming \"Random/\" as \"Files\"..."
cp -rv Random/ Files/
rm -rv Random/
echo -e "** Problem 3 done **\n"

: ' Problem 4: Using wildcards, move all the .jpg files to the Photos/
directory, all the .txt files to the Documents/ directory, and all the
.py files to the Python/ directory. '

echo "** Problem 4 **"
mv -v *.jpg Photos/
mv -v *.txt Documents/
mv -v *.py Python/
echo "Shell1/ contents:"
ls -l
echo -e "** Problem 4 done **\n"

: ' Problem 5: Move organize_photos.sh to Scripts/, add executable
permissions to the script, and run the script. '

echo "** Problem 5 **"
echo "Current location: $(find ./* -name "organize_photos.sh" -type f)"
mv -v $(find ./* -name "organize_photos.sh" -type f) Scripts/
chmod a-r Scripts/organize_photos.sh
ls -l Scripts/organize_photos.sh
echo "Adding execute permissions to all..."
chmod a+x Scripts/organize_photos.sh
ls -l Scripts/organize_photos.sh
echo "\"Photos/\" contents:"
ls -l Photos/
echo "Misplaced photos in \"Files/\":"
for subdir1 in Files/*; do
    if [ -d ${subdir1} ]; then
        for subdir2 in ${subdir1}/*; do
            if [ -d ${subdir2} ]; then
                for subdir3 in ${subdir2}/*; do
                    if [ -d ${subdir3} ]; then
                        for subdir4 in ${subdir3}/*; do
                            if [ -d ${subdir4} ]; then
                                for subdir5 in ${subdir4}/*; do
                                    if [ -d ${subdir5} ]; then
                                        echo "Sorry, we don't go deeper than level 5"
                                    else
                                        if [[ "$subdir5" == *.jpg ]]
                                        then ls -l ${subdir5}
                                        fi
                                    fi
                                done
                            else
                                if [[ "$subdir4" == *.jpg ]]
                                then ls -l ${subdir4}
                                fi
                            fi
                        done
                    else
                        if [[ "$subdir3" == *.jpg ]]
                        then ls -l ${subdir3}
                        fi
                    fi
                done
            else
                if [[ "$subdir2" == *.jpg ]]
                then ls -l ${subdir2}
                fi
            fi
        done
    else
        if [[ "$subdir1" == *.jpg ]]
        then ls -l ${subdir1}
        fi
    fi
done
echo "Moving to \"Photos/\"..."
bash Scripts/organize_photos.sh
echo "\"Photos/\" contents:"
ls Photos/
echo -e "** Problem 5 done **\n"

: ' Problem 6: Copy img_649.jpg from UnixShell1/ to Shell1/Photos, making
sure to leave a copy of the file in UnixShell1/.'



# remove any old copies of UnixShell1.tar.gz
if [ ! -d Shell1 ];
then
  cd ..
fi

if [ -f UnixShell1.tar.gz ];
then
  echo "Removing old copies of UnixShell1.tar.gz..."
  rm -v UnixShell1.tar.gz
  echo "Done"
fi

# archive and compress the Shell1/ directory
echo "Compressing Shell1/ Directory..."
tar -zcpf UnixShell1.tar.gz Shell1/*
echo "Done"
