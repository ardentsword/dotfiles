#! /bin/sh

stow -nv $1 2>&1 \
  | sed -n 's/  \* existing target is neither a link nor a directory: //p' \
  | while read i; do 
	echo Backup up ../$i to ../$i.back
    mv ../$i ../$i.back
    #rm -f ../$i
done
stow $1

