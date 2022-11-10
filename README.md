## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
* Stateless widget bersifat statis, yaitu seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal.
* Stateful widget bersifat dinamis, yaitu dapat diperbaharui kapanpun dibutuhkan berdasarkan user actions atau ketika terjadinya perubahan data.
* Perbedaan stateless widget dan stateful widget adalah jika stateless widget tidak akan dapat dirubah, tetapi stateful widget dapat di rubah, misal update tampilan, merubah warna, menambah jumlah baris, dll.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* MaterialApp: untuk mengatur segala route, theme dari aplikasi.
* Scaffold: untuk menyediakan frameworks yang memungkinkan menambahkan elemen desain material umum seperti AppBar, Floating Action Buttons, Drawers, dll.
* AppBar: sebagai menu penunjuk atau dapat menampilkan beberapa navigasi dari aplikasi (biasanya ada di bagian atas).
* Text: untuk display dan style pada text.
* Column: untuk mengatur tata letak widget secara vertikal.
* Row: untuk mengatur tata letak widget secara horizontal.
* Padding: untuk menambahkan padding di dalam widget.
* Visibility: untuk mengatur show/hide.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
* setState() berfungsi untuk memberitahu widget bahwa ada object yang berubah pada State, kemudian akan melakukan build ulang pada Widget tersebut.
* Variabel yang terdampak dalam fungsi tersebut adalah variabel yang terdapat di stateful widget.Pada tugas ini, variabel yang terdampak adalah _counter.

## Jelaskan perbedaan antara const dengan final.
* Const: nilai dari variabel harus sudah di berikan value secara langsung dan harus sudah diketahui sewaktu compile time.
* Final: nilai dari variabel hanya bisa disetel sekali. Value pada final akan diketahui pada saat run-time.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
* Menjalankan perintah flutter create Counter_7 di CMD untuk generate proyek flutter.
* Masuk ke dalam direktori proyek dengan menjalankan perintah cs Counter_7.
* Menjalankan proyek dengan perintah flutter run.
* Buka file lib/main.dart di Android Studio.
* Menambahkan potongan kode berikut untuk menambahkan fungsi decreament counter
  ```
  void _decrementCounter() {
        setState(() {
          if (_counter > 0) _counter--;
        });
      }
  ```
* Menambahkan potongan kode berikut untuk memunculkan button "+" dan "-"
  ```
   floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 30),
                    // bonus
                    child: Visibility(
                      visible: _counter == 0 ? false : true,
                      child: FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                    )
                ),

                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ]
          ), // This trailing comma makes auto-formatting nicer for build methods.
  ```
* Menambahkan potongan kode berikut untuk memunculkan teks "ganjil" bewarna biru jika _counter bernilai ganjil, dan memunculkan teks "genap" bewarna merah jika _counter bernilai genap.
  ```
   if (_counter % 2 == 0)
              const Text(
                'GENAP',
                style: TextStyle(
                  color: Colors.red,
                ),
              )
     else
              const Text(
                'GANJIL',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
* Menambahkan potongan kode berikut untuk menghilangkan button "-" jika _counter bernilai -.
  ```
        child: Visibility(
                      visible: _counter == 0 ? false : true,
                      child: FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                    )
  ```