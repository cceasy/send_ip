content="$(ifconfig | grep netmask | sed -e 's/^[ \t]*//g' -e 's/\n/ /g' | cut -d ' ' -f2)"
previous_content=$(cat /home/pi/cron/send_ip/myip.txt)
if [ "$content"x != "$previous_content"x ]; then
echo "+$content+$previous_content+"
echo $content > /home/pi/cron/send_ip/myip.txt
echo "$(cd /home/pi/cron/send_ip && git add . && git commit -m 'update ip' && git push origin master)"
fi
