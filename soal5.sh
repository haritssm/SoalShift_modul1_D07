awk '{if($0 !~ /sudo/ && $0 ~ /cron/ && NF < 13) print $0}' /var/log/syslog > /home/haritssm/modul1/soal5.log
s
