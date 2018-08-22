#!/usr/bin/env bash

from_name="raspberry pi"
from="pi@raspberry.com"
to_name="cceasy"
to="jiahao.liu@hulu.com"
subject="New Raspberry Pi's IP"
content="$(ifconfig | grep netmask | sed 's/^[ \t]*//g' | cut -d ' ' -f2)"
previous_content=$(cat /home/pi/cron/send_ip/myip.txt)
if [ "$content"x != "$previous_content"x ]; then
echo $content > /home/pi/cron/send_ip/myip.txt
echo -e "To: \"${to_name}\" <${to}>\nFrom: \"${from_name}\" <${from}>\nSubject: ${subject}\n\n${content}" | /usr/sbin/sendmail -t
fi

