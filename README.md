# Sentiment Analysis from New York Times and Twitter 

## _Project Member_
| No | Photo Profile | Full Name | Github ID | Student ID |
| ------ | ------ | ------ | ------ | ------ |
| 1. | <img src="https://avatars.githubusercontent.com/elaine05" width=100 height=100 /> | Nathania Serafina | <a title="elaine05" href="https://github.com/elaine05">@elaine05</a> | 00000015730 | 
| 2. | <img src="https://avatars.githubusercontent.com/liuzen" width=100 height=100/> | Hendrian Lunardi | <a title="@liuzen" href="https://github.com/liuzen">@liuzen</a> | 00000012778 |
| 3. | <img src="https://avatars.githubusercontent.com/se4lonline" width=100 height=100/> | Leonardo Jivalino | <a title="@se4lonline" href="https://github.com/se4lonline">@se4lonline</a> | 00000015443 |

## Installation
- Clone this repository
  - `git clone https://github.com/Liuzen/Frontier`
- Open RStudio and open R File from the directory
- Install some packages:
  - `shiny` dengan perintah `install.packages("shiny")`
  - `wordcloud2` with command `install.packages("wordcloud2")`
  - `shinythemes` with command `install.packages("shinythemes")`
  - `twitteR` with command `install.packages("twitteR")`
  - `stringr` with command `install.packages("stringr")`
  - `ROAuth` with command `install.packages("ROAuth")`
  - `RCurl` with command `install.packages("RCurl")`
  - `ggplot2` with command `install.packages("ggplot2")`
  - `reshape` with command `install.packages("reshape")`
  - `tm` with command `install.packages("tm")`
  - `RJSONIO` with command `install.packages("RJSONIO")`
  - `purrr` with command `install.packages("purrr")`
  - `broom` with command `install.packages("broom")`
  - `gridExtra` with command `install.packages("gridExtra")`
  - `plyr` with command `install.packages("plyr")`
  - `tidyverse` with command `install.packages("tidyverse")`
  - `tidytext` with command `install.packages("tidytext")`
  - `qdap` with command `install.packages("qdap")`
  - `Cairo` with command `install.packages("Cairo")`
  - `openssl` with command `install.packages("openssl")`
  - `httpuv` with command `install.packages("httpuv")`
  - `dplyr` with command `install.packages("dplyr")`
  - `lubridate` with command `install.packages("lubridate")`
  - `jsonlite` with command `install.packages("jsonlite")`
  - `tidyr` with command `install.packages("tidyr")`
  - `stringr` with command `install.packages("stringr")`
  - `rtimes` with command `install.packages("rtimes")`
  
## Packages

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


## Flowchart of Twitter Sentiment Analysis 

![Flowchart process 1](https://github.com/Liuzen/Frontier/blob/master/Image/Drawing1.jpg)

## Flowchart of New York Times Sentiment Analysis 

![Flowchart process 2](https://github.com/Liuzen/Frontier/blob/master/Image/Drawing2.jpg)

## Screenshots

### Top Trending Tweets Today

![SS1](https://github.com/Liuzen/Frontier/blob/master/Image/1.png)

### WordCloud

![SS2](https://github.com/Liuzen/Frontier/blob/master/Image/2.png)
![SS3](https://github.com/Liuzen/Frontier/blob/master/Image/3.png)

### Histogram

![SS4](https://github.com/Liuzen/Frontier/blob/master/Image/4.png)
![SS5](https://github.com/Liuzen/Frontier/blob/master/Image/5.png)
![SS6](https://github.com/Liuzen/Frontier/blob/master/Image/6.png)
![SS7](https://github.com/Liuzen/Frontier/blob/master/Image/7.png)

### Table

![SS8](https://github.com/Liuzen/Frontier/blob/master/Image/8.png)

### Top Tweeters

![SS9](https://github.com/Liuzen/Frontier/blob/master/Image/9.png)
![SS10](https://github.com/Liuzen/Frontier/blob/master/Image/10.png)

### Top Hashtags of User

![SS11](https://github.com/Liuzen/Frontier/blob/master/Image/11.png)

### Article

![SS12](https://github.com/Liuzen/Frontier/blob/master/Image/12.jpg)
![SS13](https://github.com/Liuzen/Frontier/blob/master/Image/13.jpg)

### Article Table

![SS14](https://github.com/Liuzen/Frontier/blob/master/Image/14.jpg)


