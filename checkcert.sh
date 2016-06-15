#!/bin/sh

#for domain in "$@"
renewed=0
for d in /etc/letsencrypt/live/*;
do
        domain=$(basename $d)
        echo $domain
        if test -r /etc/letsencrypt/live/$domain/fullchain.pem
        then
                echo "Checking cert for '$domain'"
                if openssl x509 -checkend 2592000 -noout -in /etc/letsencrypt/live/$domain/fullchain.pem
                then
                        echo "Cert good"
                else
                        echo "Cert will expire within 30 days or is already expired"
                        /certbot/letsencrypt-auto --renew-by-default certonly -a webroot --webroot-path /tmp/letsencrypt-auto --domains $domain --debug --rsa-key-size 4096
                        renewed=1
                fi
        else
                echo "Bad Domain/No Cert Found for Domain '$domain'"
        fi
done
if [ $renewed -eq 1 ];
then
        echo "Reloading NGinx..."
        service nginx reload
else
        echo "NGinx reload not required"
fi
