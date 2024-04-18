## Pendahuluan
* *Folder `build`,`.dart_tool` dan `pubspec.lock` jangan Anda push*
* *Kami menggunakan sdk: '>=3.0.1 <4.0.0', untuk sdk flutter kami menggunakan 3.16.4, dan dengan bantuan tool FVM*
* *Pull projek ini terlebih dahulu*
* *Untuk menghapus folder caches mohon tulis pada cmd atau terminal Anda `flutter clean`*
    ```
    laptopTerminal % flutter clean
    ```
    *jika Anda menggunakan tool FVM maka Anda mohon tulis pada cmd atau terminal Anda `fvm flutter clean`*
    ```
    laptopTerminal % fvm flutter clean
    ```
* *projek Anda menjadi error, langka selanjudnya Anda tulis `flutter pub get` berfungsi untuk mendownload ulang package yang Anda gunakan*
    ```
    laptopTerminal % flutter pub get
    ```
    *jika Anda menggunakan tool FVM maka Anda tulis `fvm flutter pub get`, namun catatan sebelum itu anda harus telah mendownload versi yang sesuai pada projek ini `fvm install 3.16.4`, untuk melihat versi berapa yang anda download `fvm list` dan untuk menggunakan `fvm use 3.16.4`*
    ```
    laptopTerminal % fvm install 3.16.4

    laptopTerminal % fvm list

    laptopTerminal % fvm use 3.16.4

    laptopTerminal % fvm flutter pub get
    ```
* *langka terakhir jalankan Anda bias klik `F5` atau menggunakan cmd atau terminal `flutter run`*
    ```
    laptopTerminal % flutter run
    ```
    *jika Anda menggunakan tool FVM maka `fvm flutter run`*
    ```
    laptopTerminal % flutter run
    ```
    untuk Anda yang menggunakan tool FVM ingin run `F5` maka buat folder didalam folder `EXCELSA_BARU` namakan folder dengan `.vscode` dan buat file dengan format `.json` dengan nama `settings.json` untuk `"/Users/endrosatyo/fvm/versions/3.16.4"` tergantung Anda letakan dimana FVM
    ```json
    {
        "dart.flutterSdkPath": "/Users/endrosatyo/fvm/versions/3.16.4"
    }
    ```