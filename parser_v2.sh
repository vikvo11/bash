#!/bin/bash
#grep -c 'libacl1' /var/log/bootstrap.log
#!/bin/bash
Tet=$(grep -E -o "^[^^][0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.*]" access.log|uniq|more)
sudoCount=0
while read line; do
    sudoBool=0
    if [[ "$line" = *Dec* ]]; then
        sudoBool=1
        (( sudoCount++ ))
        # do something with sudobool ?
    fi
done <<<  "$Tet"
echo "There were $sudoCount attempts to use sudo."
