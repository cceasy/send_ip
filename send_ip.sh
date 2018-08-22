#!/usr/bin/env bash
cd /home/pi/cron/send_ip
from_name="raspberry pi"
from="pi@raspberry.com"
to_name="cceasy"
to="jiahao.liu@hulu.com"
subject="New Raspberry Pi's IP"
content="$(ifconfig | grep netmask | sed 's/^[ \t]*//g' | cut -d ' ' -f2)"
echo $content > tmp
content=$(cat tmp)
previous_content=$(cat myip.txt)
rm -f tmp
if [ "$content"x != "$previous_content"x ]; then
echo $content > myip.txt
git add . && git commit -m 'update ip' && git push origin master
echo -e "To: \"${to_name}\" <${to}>\nFrom: \"${from_name}\" <${from}>\nSubject: ${subject}\n\n${content}" | /usr/sbin/sendmail -t
fi

