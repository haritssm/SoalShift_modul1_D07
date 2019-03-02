# SoalShift_modul1_D07

### Soal No. 1

 Pada soal no 1 kita di suruh untuk mengembalikan file yang telah dienkripsi menggunakan bash script dan terdapat aturan bahwa file         tersebut dapat dienkripsi jika pukul 14:14, tanggal 14 bulan Februari atau hari Jumaat bulan Februari.
  
 ##### Penyelesaian:
  
  Kami mendecode setiap file tersebut menggunakan base64 dan mengembalikan dari nilai HEX menjadi gambar semula menggunakan hexdump.
  
  ##### Source Code : 
  
  ```
  unzip nature.zip
  cd nature
  src=pwd

  for f in *
  do
	  base64 -d $f | xxd -r > "new_$f"
	  rm $f
  done
  ```
  
  ```
  14 14 14 2 5 /bin/bash ...
  ```
  
  ##### Penjelasan : 
  File nature.zip diunzip, setelah itu setiap file yang terdapat pada folder nature akan didecode dan diganti namanya dengan format "new_*".
  
  ### Soal  No. 2
  
  Pada soal ini terbagi menjadi tiga bagian, yaitu A,B dan C.
  
  A. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
  
  B. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin A.
  
  C. Tentukan tiga product yang memeberikan penjualan(quantity) terbanyak berdasarakan tiga product line yang didapatkan pada soal poin
  
  ##### Penyelesaian : 
  
  A. Nama negara didapatkan dengan menggunakan awk yang tahunnya adalah 2012. Disini kami menggunakan array untuk menyimpan jumlah dari quantity yang memiliki indeks nama negara tersebut. Setelah itu akan dilooping untuk mencari nilai paling maksimum dalam array tersebut.

  ```
  awk -F "," '{ if($7=="2012") {a[$1]=a[$1]+$10} } END {for(b in a) {if(max<a[b]) {nama=b;max=a[b]} } print nama,max }' WA_Sales_Products_2012-14.csv
  ```
 
  B. Dari hasil poin A, yaitu United States, proses hampir sama dengan sebelumnya, nilai yang sesuai dengan kondisi akan di simpan dalam array. Dari hasil yang didapatakn akan di sorting berdasarkan quantitynya. Setelah disorting, untuk mendapatkan 3 baris pertama menggunakan awk dengan baris 1 sampai ketiga.
  
  ```
  awk -F "," '{ if( $1=="United States" && $7=="2012" ) {b[$4]=b[$4]+$10} } END {for(a in b) {print b[a],",",a} } ' WA_Sales_Products_2012-14.csv | sort -k 1 -n -r | awk -F "," 'NR==1, NR==3 {print $2,$1}'
  ```
  
  C. Pada poin C, kami menggunakan tiga awk untuk masing-masing product line, yang didapata dari poin B, proses yang digunakan sama denga nsebelumnya, yaitu mencari semua data yang sesuai kondisi dan simpan dalam array. Hasil tersebut di sort berdasar kan nilai quantitynya dan setalah intu di print baris pertamanya menggunakan awk.
  
  ```
  awk -F "," '{if($1=="United States" && $7=="2012" && $4=="Personal Accessories"){A[$5]=A[$5]+$10}} END{for(a in A){print A[a],",",a}}' WA_Sales_Products_2012-14.csv | sort -k 1 -n -r | awk -F "," 'NR==1 {print "Personal Accessories : ",$2}'

awk -F "," '{if($1=="United States" && $7=="2012" && $4=="Camping Equipment"){A[$5]=A[$5]+$10}} END{for(a in A){print A[a],",",a}}' WA_Sales_Products_2012-14.csv | sort -k 1 -n -r | awk -F "," 'NR==1 {print "Camping Equipment : ",$2}'

awk -F "," '{if($1=="United States" && $7=="2012" && $4=="Outdoor Protection"){A[$5]=A[$5]+$10}} END{for(a in A){print A[a],",",a}}' WA_Sales_Products_2012-14.csv | sort -k 1 -n -r | awk -F "," 'NR==1 {print "Outdoor Protection : ",$2}'
  ```
  
  ### Soal No.3
  
  Pada soal no 3 disuruh untuk membuat suatu password generator. Terdapat beberapa aturan dalam penyimpanan password tersebut, yaitu:
  
  a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file password1.txt
  
  b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file password2.txt den seterusnya.
  
  c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
  
  d. Password yang dihasilkan tidak boleh sama.
  
  ##### Penyelesaian : 
  
  Untuk penyelesaian soal no 3, kami mengenerate password acak menggunakan 'tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 12 ' dan dalam penyimpanan passwordnya kami mencek apakah terdapat file password$counter.txt, dimana $counter akan memberi tahu file keberapa, dan jika ada maka isi dari file tersebut dicek apakah password yang telah dibuat sama dengan yang ada dalam file. Hal ini dilakukan terus hingga tidak terdapat file dengan counter pada saat tersebut.
  
  ##### Source Code :
  
  ```
  pass=`tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 12`
#pass="PassAda"
echo $pass

counter=1

while true
do
	if [ ! -f `echo "password$counter.txt"` ]; then
		echo "Ga Ada"
		echo $pass > password$counter.txt
		break
	else
		echo "Ada"
		while read line; do
			if [ $line = $pass ]; then
				break
			fi
		done < password$counter.txt
		counter=$((counter+1))
	fi
done
  ```
  
  ### Revisi Soal 3
  
  Pada script sebelumnya, password yang dihasilkan ada yang tidak mengandung minimal 1 huruf kecil, 1 huruf besar dan 1 angka. Pada script revisi ini kami mampu untuk mendeteksi jika password yang dihasilkan telah memenuhi aturan tersebut. Cara yang kami gunakan adalah dengan mereturn apakah pada rentang 'a-z', 'A-Z' dan '0-9' terdapat pada password dengan cara grep -c -E "[a-z]+" dari password yang ada. Jika terdapat semua aturan tersebut makan akan mereturn nilai 1 dan jika tidak 0.
  
  ##### Source Code:
  ```
  #!/bin/bash

while true
do
	pass=`tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 12`
	#pass="PassAda"
	#echo $pass
	low=`echo $pass | grep -c -E "[a-z]+"`
	up=`echo $pass | grep -c -E "[A-Z]+"`
	num=`echo $pass | grep -c -E "[0-9]+"`
	#echo $low
	#echo $up
	#echo $num
	if [[ $low>0 && $up>0 && $num>0 ]]; then
		break
	fi
done

#echo $pass
counter=1

while true
do
	if [ ! -f `echo "password$counter.txt"` ]; then
		#echo "Ga Ada"
		echo $pass > password$counter.txt
		break
	else
		#echo "Ada"
		while read line; do
 			if [ $line = $pass ]; then
				break
			fi
		done < password$counter.txt
		counter=$((counter+1))
		#echo $pass >> password$counter.txt
		#break
	fi
done
  ```

  ### Soal No.4
  
  Pada soal no 4, kita dihasurkan membuat suatu backup file syslog setiap jam dengan format nama "jam:menit tanggal-bulan-tahun". Dan file tersebut dienkripsi dengan mengubah huruf b dengan menambahkan urutan huruf ben sesuai jam sekarang.
  
  ##### Penyelesaian : 
  
  Untuk menyelesaikan soal ini kami terlebih dahulu menyimpan informasii waktu saat ini. Setelah itu mengekstrak nilai jam sebagai variable penjumlah nantinya. Berikutnya kami menambah ascii huruf b dengan nilai jam sekarang. Seletah itu untuk mengubah huruf b pada syslog, kami menggunakan awk dengan "gsub("b",val)" dan menyimpan hasilnya kedalam suatu file log. Script ini juga dijalankan setiap jam menggunakan crontab.
  
  ##### Source Code : 
  
  ```
  file=`date +"%R_%d-%m-%Y.log"`
#echo $file
jam=`date +"%H" | cut -c 2`
jam=$((jam+98))
#echo $jam

if [ $jam -gt 122 ]
then
	jam=$((jam-26))
fi

#jam=71
char=`echo "$jam" | awk '{printf("%c",$0)}'`
#echo $char
ps aux | awk -v val=$char '{ gsub("b",val)} {print}' > $file
  ```
  ```
  0 */1 * * * /bin/bash ...
  ```

### Soal No. 5

Pada soal no 5 disuruh untuk menyimpan record dalam syslog yang memiliki kriteria sebagai berikut:

a. Tidak mengandung string "sudo" tetapi mengdung "cron"

b. jumlah field pada baris tersebut berjumlah kurang dari 13

c. Menyimpan record ke dalam file logs yang berdirektory /home/[user]/modul1

##### Penyelesaian : 

Untuk menyelesaiakan soal ini, kami menggunakan awk yang memiliki kondisi tidak mengdung /sudo/, mengdung /cron/ dan NF (menghitung jumlah field) < 13.

Soal ini juga mengharuskan menggunakan crontab dengan waktu per 6 menit antara menit ke 2-30.

##### Source Code : 

```
awk '{if($0 !~ /sudo/ && $0 ~ /cron/||/CRON/ && NF < 13) print $0}' /var/log/syslog > /home/haritssm/modul1/soal5.log
```

```
2-30/6 * * * * /bin/bash /home/haritssm/soal5.sh
```
