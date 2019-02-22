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
    
