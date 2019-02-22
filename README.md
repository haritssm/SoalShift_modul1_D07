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
  
  ### Soal No.3 : 
  
  Pada soal no 3 disuruh untuk membuat suatu password generator. Terdapat beberapa aturan dalam penyimpanan password tersebut, yaitu:
  
  a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file password1.txt
  
  b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file password2.txt den seterusnya.
  
  c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
  
  d. Password yang dihasilkan tidak boleh sama.
  
  ##### Penyelesaian : 
  
