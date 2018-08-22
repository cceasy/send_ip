cd /home/pi/cron/send_ip
content="$(ifconfig | grep netmask | sed -e 's/^[ \t]*//g' | cut -d ' ' -f2)"
echo $content > tmp
content=$(cat tmp)
previous_content=$(cat myip.txt)
if [ "$content"x != "$previous_content"x ]; then
echo $content > myip.txt
rm -f tmp
git add . && git commit -m 'update ip' && git push origin master
fi
