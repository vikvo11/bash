#!/bin/bash
#grep -c 'libacl1' /var/log/bootstrap.log
#!/bin/bash
sudoCount=0
while read line; do
    sudoBool=0
    if [[ "$line" = *sudo* ]]; then
        sudoBool=1
        (( sudoCount++ ))
        # do something with sudobool ?
    fi
done < auth.log
echo "There were $sudoCount attempts to use sudo."                                         
