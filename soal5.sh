awk '{if($0 ~ /cron/ && $0 !~ /sudo/ && NF < 13) print $0}' /var/log/syslog > /home/gede/modul1/soal5.log
s
