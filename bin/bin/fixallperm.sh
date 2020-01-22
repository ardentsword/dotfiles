#/bin/sh

for D in `find ~/LetsTalk/projects/ -maxdepth 1 -mindepth 1 -printf '%f\n' -type d`
do
    echo "Fixing permissions of: ${D}"
    lt-dd project:fixpermissions -n -p "${D}"
done
