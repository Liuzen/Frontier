# _Sentiment Analysis from New York Times and Twitter_ 

## _Project Member_
| No | Foto Profile | Nama Lengkap | Github ID | Nomor Induk Mahasiswa |
| ------ | ------ | ------ | ------ | ------ |
| 1. | <img src="https://avatars.githubusercontent.com/elaine05" width=100 height=100 /> | Nathania Serafina | <a title="elaine05" href="https://github.com/elaine05">@elaine05</a> | 00000015730 | 
| 2. | <img src="https://avatars.githubusercontent.com/liuzen" width=100 height=100/> | Hendrian Lunardi | <a title="@liuzen" href="https://github.com/liuzen">@liuzen</a> | 00000012778 |
| 3. | <img src="https://avatars.githubusercontent.com/se4lonline" width=100 height=100/> | Leonardo Jivalino | <a title="@se4lonline" href="https://github.com/se4lonline">@se4lonline</a> | 00000015443 |

## Instalasi
- Kloning _repository_ ini
  - `git clone https://github.com/Liuzen/Frontier`
- Buka RStudio dan buka file R yang terdapat pada _directory_ tersebut
- Instal beberapa _package_:
  - `shiny` dengan perintah `install.packages("shiny")`
  - `wordcloud2` dengan perintah `install.packages("wordcloud2")`
  - `shinythemes` dengan perintah `install.packages("shinythemes")`
  - `twitteR` dengan perintah `install.packages("twitteR")`
  - `stringr` dengan perintah `install.packages("stringr")`
  - `ROAuth` dengan perintah `install.packages("ROAuth")`
  - `RCurl` dengan perintah `install.packages("RCurl")`
  - `ggplot2` dengan perintah `install.packages("ggplot2")`
  - `reshape` dengan perintah `install.packages("reshape")`
  - `tm` dengan perintah `install.packages("tm")`
  - `RJSONIO` dengan perintah `install.packages("RJSONIO")`
  - `purrr` dengan perintah `install.packages("purrr")`
  - `broom` dengan perintah `install.packages("broom")`
  - `gridExtra` dengan perintah `install.packages("gridExtra")`
  - `plyr` dengan perintah `install.packages("plyr")`
  - `tidyverse` dengan perintah `install.packages("tidyverse")`
  - `tidytext` dengan perintah `install.packages("tidytext")`
  - `qdap` dengan perintah `install.packages("qdap")`
  - `Cairo` dengan perintah `install.packages("Cairo")`
  - `openssl` dengan perintah `install.packages("openssl")`
  - `httpuv` dengan perintah `install.packages("httpuv")`
  - `dplyr` dengan perintah `install.packages("dplyr")`
  - `lubridate` dengan perintah `install.packages("lubridate")`
  - `jsonlite` dengan perintah `install.packages("jsonlite")`
  - `tidyr` dengan perintah `install.packages("tidyr")`
  - `stringr` dengan perintah `install.packages("stringr")`
  - `rtimes` dengan perintah `install.packages("rtimes")`
  

## _Packages_

- twitteR

twitteR adalah R package yang menyediakan akses ke API Twitter sehingga memungkinkan kita melakukan crawling data pada Twitter. Untuk mendapatkan API key dan access token dari Twitter, masuk ke halaman website https://apps.twitter.com/.

- rtimes

rtimes adalah R package yang menyediakan akses ke API New York Times sehingga memungkinkan kita melakukan crawling data pada New York Times. Untuk mendapatkan API key dari New York Times, masuk ke halaman website https://developer.nytimes.com/.

- stringr

Package stringr digunakan untuk membersihkan serta melakukan persiapan data dan menangani masalah string yang umum, yaitu untuk menghasilkan output string yang lebih bersih dan rapi.

- shiny

Shiny adalah Paket R untuk menyebarkan aplikasi web menggunakan back-end R. Shiny membawa semua kelebihan R ke aplikasi web sederhana dengan interaktivitas, input user, dan visualisasi interaktif.

- wordcloud2

Wordcloud2 adalah representasi visual dari data teks. Tag biasanya kata tunggal, dan pentingnya setiap tag ditunjukkan dengan ukuran font atau warna.

- ROAuth

Menyediakan interface ke spesifikasi OAuth 1.0 yang memungkinkan user untuk mengotentikasi melalui OAuth ke server pilihan mereka.

- RCurl

Menyediakan fungsi untuk memungkinkan seseorang menyusun permintaan HTTP umum dan menyediakan fungsi yang mudah digunakan untuk mengambil URI, mendapatkan & mengirim formulir, dll. Dan memproses hasil yang dikembalikan oleh server Web. Hal Ini memberikan kendali yang baik atas koneksi HTTP / FTP / ... dan bentuk permintaan sambil menyediakan tingkat interface yang lebih tinggi daripada yang tersedia dengan hanya menggunakan koneksi soket R.
  
- ggplot2

ggplot 2 adalah paket visualisasi data yang disempurnakan untuk R. ggplot2 dapat membuat grafis multi-layered yang menakjubkan dengan mudah.

- reshape

reshape memungkinkan Anda secara fleksibel merestrukturisasi dan menggabungkan data hanya dengan menggunakan dua fungsi, yaitu melt dan cast. reshape pada dasarnya memungkinkan kita untuk mengatur ulang data kita sesuai dengan hirarki yang dibutuhkan.

- tm

tm adalah Kerangka untuk aplikasi text mining dalam R.

- RJSONIO

RJSONIO adalah paket yang memungkinkan konversi ke dan dari data dalam format notasi objek Javascript (JSON). Hal ini memungkinkan objek R untuk dimasukkan ke Javascript / ECMAScript / ActionScript code dan memungkinkan programmer R untuk membaca dan mengkonversi konten JSON ke objek R.

- purrr 

purrr meningkatkan toolkit pemrograman fungsional (FP) R dengan menyediakan seperangkat alat yang lengkap dan konsisten untuk bekerja dengan fungsi dan vektor.

- broom 

Package broom mengambil output fungsi built-in yang berantakan dalam R, seperti lm, nls, atau t.test, dan mengubahnya menjadi data frame yang rapi.

- gridExtra

gridExtra menyediakan sejumlah fungsi user-level untuk bekerja dengan grafik "grid", terutama untuk mengatur beberapa plot berbasis grid pada halaman, dan menggambar tabel.
  
- plyr

plyr adalah seperangkat alat yang menyelesaikan satu set masalah umum: Anda perlu memecahkan masalah besar menjadi bagian-bagian yang dapat dikelola, beroperasi pada masing-masing bagian dan kemudian meletakkan semua potongan kembali bersama.

- tidyverse

tidyverse adalah koleksi package R yang dirancang untuk data science. Semua paket berbagi filosofi yang mendasari dan API umum.

- tidytext

tidytext memungkinkan data mining untuk pengolah kata dan analisis sentimen menggunakan 'dplyr', 'ggplot2', dan alat-alat lain yang rapi.

- qdap

qdap berfungsi untuk mengotomatiskan banyak tugas yang terkait dengan analisis wacana kuantitatif dari transkrip berisi wacana termasuk jumlah frekuensi jenis kalimat, kata-kata, kalimat, giliran bicara, suku kata dan berbagai macam tugas analisis lainnya. Paket ini menyediakan alat penguraian untuk menyiapkan data transkrip.

- Cairo

Perangkat grafis R menggunakan perpustakaan grafis cairo untuk membuat bitmap berkualitas tinggi (PNG, JPEG, TIFF), vektor (PDF, SVG, PostScript) dan tampilan (X11 dan Win32) output.

- openssl

openssl adalah toolkit untuk Enkripsi, Tanda Tangan, dan Sertifikat Berdasarkan OpenSSL

- httpuv

httpuv menyediakan low-level socket dan dukungan protokol untuk menangani permintaan HTTP dan WebSocket langsung dari dalam R.

- dplyr

dplyr adalah iterasi dari plyr, memfokuskan hanya pada frame data. dplyr lebih cepat dan memiliki API yang lebih konsisten.

- lubridate

lubridate adalah package R yang memudahkan pekerjaan dengan tanggal dan waktu.

- jsonlite

Paket jsonlite adalah parser / generator JSON yang dioptimalkan untuk web. Kekuatan utamanya adalah bahwa ia mengimplementasikan pemetaan dua arah antara data JSON dan tipe data R yang paling penting.

- tidyr

tidyr memudahkan untuk merapikan data Anda. Data yang rapi adalah data yang mudah digunakan: mudah untuk melakukan munge (dengan dplyr), memvisualisasikan (dengan ggplot2 atau ggvis) dan memodelkan (dengan ratusan paket pemodelan R).


## Cara kerja _Sentiment Analysis_ pada Twitter

![Flowchart twitter](https://github.com/Liuzen/Frontier/blob/master/Image/Drawing1.jpg)

## Cara kerja _Sentiment Analysis_ pada New York Times

![Flowchart proses kerja](https://github.com/Liuzen/Frontier/blob/master/Image/Drawing2.jpg)

## _Screenshots_

### _Top Trending Tweets Today_

![SS1](https://github.com/Liuzen/Frontier/blob/master/Image/1.png)

### _WordCloud_

![SS2](https://github.com/Liuzen/Frontier/blob/master/Image/2.png)
![SS3](https://github.com/Liuzen/Frontier/blob/master/Image/3.png)

### _Histogram_

![SS4](https://github.com/Liuzen/Frontier/blob/master/Image/4.png)
![SS5](https://github.com/Liuzen/Frontier/blob/master/Image/5.png)
![SS6](https://github.com/Liuzen/Frontier/blob/master/Image/6.png)
![SS7](https://github.com/Liuzen/Frontier/blob/master/Image/7.png)

### _Table_

![SS8](https://github.com/Liuzen/Frontier/blob/master/Image/8.png)

### _Top Tweeters_

![SS9](https://github.com/Liuzen/Frontier/blob/master/Image/9.png)
![SS10](https://github.com/Liuzen/Frontier/blob/master/Image/10.png)

### _Top Hashtags of User_

![SS11](https://github.com/Liuzen/Frontier/blob/master/Image/11.png)

### _Article_

![SS12](https://github.com/Liuzen/Frontier/blob/master/Image/12.jpg)
![SS13](https://github.com/Liuzen/Frontier/blob/master/Image/13.jpg)

### _Article Table_

![SS14](https://github.com/Liuzen/Frontier/blob/master/Image/14.jpg)


