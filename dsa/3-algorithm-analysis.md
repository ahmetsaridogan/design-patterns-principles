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
Karşılacağımız en kötü durum,
Vereceğimiz input, algoritmamızı en yavaş (en fazla işlem yapacak) şekilde çalıştırdığını durumdur,
Örneğin; aradığımız kelime "z" ile başlaması gibi.

- Her algoritmaya göre worst case farklı, sözlüğe baştan değil de sondan bakmaya başlasaydık, "z" ile başlaması worst case olmazdı.

## Avarage case:
Genel olarak beklediğimiz durum, verilen inputlar sonucunda kaç sayfa çevireceğimiz yada kaç tane işlem yapacağımız durum.
En zor analiz edilen durum

## Best case:
Vereceğimiz inputun algoritmamızı en hızlı şekilde çalıştırdığı durum,
Örneğin "a" inputu sözlükte bir kaç sayfa çevirerek sonuca ulaşıyorum

### Örnek Senaryo
Avarage case olarak baktığımız şey, alfabe a ile başlıyoruz z ile bitiyor bunun arasındaki hangi harf ile başlayan kelimeleri kaç sayfada yapıyor bakmak gibi bir şey değil, biz bunun ortalamasını alalım ne çok ne çok az gibi değil, burada bizim ihtiyaçımız olan şey inputlarını dağılımını bulmak lazım.

Neden böyle bir şey var, Çünkü Avarage case aslında belki şöyle bir şey var, Türkçede e harfi ile başlayan kelimeler daha çok belkide, çok fazla e harfiyle başlayan kelimemiz var diyelim, o zaman bizim input olarak beklediğimiz şeyler e harfiyle başlaması daha yüksek olasılıklı olan şeyler olacak belkide, o yüzden belkide Avarage case etkisi e ile başlayanlar daha fazla olacak, 

Biz çünkü "e" ile başlayan daha çok şey bekliyoruz gibi bir durum var, o yüzden bizim burada bu kadar basit değil, a ve z tam ortasını alalım gibi bir durum değil Avarage case.

Avarage case bizim inputlarımızın genel olarak gerçek hayatta bekleyeceğimiz şey inputların dağılımı ile alakalı bir şey ve bu dağılımı bulmak bunlar üzerinde analizler yapmak genelde Worst case'den ve Best case'den daha zor oluyor.

* Algorimamızın çalışmasını en iyi yansıtan average case, ama bu durumu analiz etmek diğerlerine göre çok daha zor. Inputların geldiği dağılımı bilip ona göre analiz etmek gerekiyor.

* Genellikle Worst case'in analizi yapıldığı görülür. Worst case'e göre analiz yaparsak, performansımız için üst sınır çizmiş oluruz. Böylece worst case için bizi tatmin eden bir algoritmamız varsa, Avarage vase zaten bundan daha iyi (veya aynı) performans vereceği için o da bizi tatmin edecektir.


# Big O notation (Büyük O gösterimi)

* 100 sayfalık bir sözlük için iki farklı arama yöntemi düşünelim

* A algoritması tek tek sayfalara bakıyor.

* B algoritması sözlüğün alfabetik sıralanmış olduğundan yararlanarak en başta, en ortadaki sayfayı açıyor, eğer bu sayfadaki harfler aradığım kelimeden alfabetik olarak daha ilerdeyse sol tarafa aynısını yoksa sağ tarafa aynısını yapıyor.

* Böylece problem her seferinde yarı boyutuna inmiş oluyor.

* Birkaç durum üzerinden konuşalım. Diyelimki 100 sayfalık bir sözlüğümüz var. A algoritması en kötü durumda (aradaığım en son sayfadaysa) kaç işlem yapacak? 100 işlem yapacaktır. 

* B algoritması en kötü durumda kaç işlem yapar? 2n = 100 (ortalama 6,7 işlem)

* Bu örneğe bakarak RAM modeli üzerinde düşünürsek, 100/7  = (yaklaşık 15) hızında çıktı. A algoritması, B  algoritmasından 15 kat daha yavaş veya. B algoritması 15 katı daha hızlı, bu durum için bunu söyleyebiliriz.

* Şöyle düşünelim, sözlüğümüz 10.000 elemanlı olsa, A algoritması en kötü durumda 10.000 işlem yapar ama B algoritması 2x = 10.000 yaklaşık 13 işlem yapar. 10.000 / 13 yaklaşık 770 katı hızında gözüküyor.

* Bu yüzden algoritmaların sadece 1 input boyutuna göre karşılaştırmalarına bakıp kara veremeyiz, Genel yapsını bize gösterecek bir analize ihtiyaçımız var, işte burada Big O Notation devreye giriyor.

* Big O Notation algortimanın ne kadar sürede çalışacağını söylemeyecek, bize algoritmamızın çalışma zamanını inputun boyutu ile nasıl değişeceğini söyleyecek.

* Mesela sözlük örneğimizde input size'ımıza n dersek algoritmamızın en kötü durumda n işlem yaptığını söyleyebiliriz. Inputun n boyutunda olunca çalışma süremin de en kötü durumda n olmasını "O(n)" diye göstereceğiz, Aynı şekilde B algoritması için "O(log N)" diye gösterebiliriz.

* Big O notation'da yapılacak toplam işlem sayısının input size ile nasıl scale olacağına bakıyoruz. Bizim için bu fonksiyon yapısı önemli

* İşlem sayısı input size ile linear mı artıyor, karesi ile orantılı mı artıyor, yani logaritmik mi?

* Karakteristiği önemsediğimiz için 2n işlem yapan algoritmaya da n işlem yapan algoritmaya da O(n) diyoruz, ikisi de linear bir şekilde artıyor. Big O Notation bakarken kat sayıları önemli değil

* Analizimizin sonucu "2n^2 + 3n + 2" gibi bir şey çıktı diyelim. n büyüdükçe "3n + 2" nin etkisi 2n^2 'in yanında önemsiz kalacak. O yüzden dominant olanı Big O notation olarak yazabiliriz "O(n^2)"

* Burada "n^2" özel bir durum değil aynısını "2n", "3n", "1/2n" için de geçerli, onların da Big O Notation'o "O(n)". Yapı ne olursa olsun katsayı yazılmıyor.

* Bizim için önemli olan şey, bunun nasıl davrandığı linear mı? linear'se 2x eğilimi farklı oluyor ama yinede linear davranıyor. Biz inputumuzu değiştirdiğimizde linear bir davranış bekleyeceğiz, beklemeyecek miyiz? yoksa karesiyle artan bir artış bekleceğiz bunlar bizim için önemli. O yüzden Big O notationda kat sayılar önemli olmuyor.

https://medium.com/kodcular/nedir-bu-big-o-notation-b8b9f1416d30
