# Algoritma Analizi Giriş

* A noktasından B noktasına gitmek istiyorum. Birden çok yolla gidebilirim. Süre, yolun ücreti... gibi parametreleri değerlendirerek en uygun yolu seçebilirim.

* Algoritmalar için de bu geçerli, bir problemi çözen birden çok algoritma olabilir. Elimizdeki kaynaklara göre bizim için en uygun olanı seçebiliriz.
  
Kaynaklar: Programcının harcadığı süre, Kullanılan Hafıza, Programın çalışma zamanı

* Algoritma analizimiz, analizi yaptığımız bilgisayarın özelliklerinden ve programlama dilinden bağımsız olmalı ki genel bir sonuç elde edebilelim.

* Diyelim ki Kendi bilgisayarımızda A algoritması çalıştığında 3 dk'da çalıştı, başka birisi B algoritmasını denemiş ve 4 dk'da çalışmış, Belkide B algoritması benim bilgisayarımda 2 dk'da çalışacak.

* Aynı şey programlama dili için de geçerli, Belkide A algoritması daha iyi ama B daha hızlı bir programalama dilinde denendi, hangisi hızlı bunları karşılaştırmamak lazım.

* Bu yüzden bilgisayar özelliklerinden ve programalam dilinden bağımzı bir analiz yapmamız lazım.

# Bu Analizi Nasıl Yapacağız?

* Çalışma Süresi (Execution Time): Programalam dilinden ve kullanılan bilgisayarın özelliklerinden etkileniyor, o yüzden genelebilir DEĞİL! X

* İfade Sayısı: Programda kaç tane ifadenin çalıştığı (Bunu yap, bunları topla, bu kadar döngü çalıştır vs.). Programlama diline göre aynı işlem için çalışan ifade sayısı değişebilir, o yüzden genelebilir DEĞİL! X

* Büyüme Hızı (Rate of Growth): Programa verdiğimiz input boyutu ile çalışma zamanı fonksiyonel olarak birbirine bağlarsak bilgisayarlara ve progralama diline bağlı olmayan bir yapı oluşturmuş oluruz. :) 


