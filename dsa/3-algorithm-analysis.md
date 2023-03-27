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



# RAM Modeli

Farklı farklı bilgisayarlarda belli algoritmaları denemek pek yol göstermiyor, donanım spesifik oluyor. Bu yüzden bir hayali makine oluşturup onun üzerinden algoritmaları test edeceğiz.

* Genellenebilir bir analiz yapmak için, her algoritmayı aynı bilgisayar ile test ediyor gibi yapalım

* Bu hayali makineye RAM (Random Access Machine) deniyor, Pc'deki RAM (memory) ile aynı şey değil

# RAM'in Özellikleri
Bu RAM modelinde Analiz yaparken bir bu varsayımlardan yola çıkacağız

* Her işlem (+, -, and, or vb.) 1 birim zaman alır
* Döngüler 1 birim zaman değil, içerisinde kaç defa işlem varsa iterasyon sayısı * işlem sayısı kadar birim zaman alır
* Hafızadan her okuma işlemi içinde 1 birim zaman alır

# Time Complexity (Zaman Karmaşıklığı)
Algoritmanın verimli olması için belli kurallar vardır.
Bir algoritmanın çalışma zamanının veya işlem adımlarının niceliksel bir ölçüsüdür. Bu, verilerin boyutuna veya inputun büyüklüğüne bağlı olarak bir algoritmanın ne kadar zaman alacağını tahmin etmeye yarar.

Time Complexity, Big O gösterimi kullanılarak ifade edilir ve genellikle algoritmanın en kötü durumda çalışma zamanını belirtir. Big O gösterimi, bir algoritmanın en kötü durumda kaç adım yürütebileceğini belirlerken, bir algoritmanın işlem adımlarını veri boyutuna göre ne kadar hızlı artırabileceğini de gösterir.

* Kullanacağımız algoritmayı analiz etmek istiyoruz. Problem aynı olsa da farklı inputlar için algoritmamız farklı performans senaryoları üretebilir.

* Diyelim ki bir kelimenin anlamını sözlükte arıyoruz, Arama için sayfalara tek tek bakıyoruz, burada algoritmamız sayfalara tek tek bakması, input da arağımız kelime

* Aradığımız kelimenin boyutu aynı olsa bile hangi harfle başladığına göre yapacağımız işlem (sayfa çevirme) sayısı değişebilir. Yani input algoritmamızın yapacağı işlem sayısını etkilebiliyor.

* Bu yüzden analizimizi 3 ana başlığa aytırabiliriz, worst case, avarage case, best case

## Worst case: 
Vereceğimiz input, algoritmamızı en yavaş (en fazla işlem yapacak) şekilde çalıştırdığını durumdur,
Örneğin; aradığımız kelime "z" ile başlaması gibi.

- Her algoritmaya göre worst case farklı, sözlüğe baştan değil de sondan bakmaya başlasaydık, "z" ile başlaması worst case olmazdı.

## Avarage case:
Genel olarak beklediğimiz durum, verilen inputlar sonucunda kaç sayfa çevireceğimiz yada kaç tane işlem yapacağımız durum.
En zor analiz edilen durum

## Best case:
Vereceğimiz inputun algoritmamızı en hızlı şekilde çalıştırdığı durum,
Örneğin "a" inputu sözlükte bir kaç sayfa çevirerek sonuca ulaşıyorum


* Algorimamızın çalışmasını en iyi yansıtan average case, ama bu durumu analiz etmek diğerlerine göre çok daha zor. Inputların geldiği dağılımı bili ona göre analiz etmek gerekiyor.

# Big O notation (Büyük O gösterimi)
