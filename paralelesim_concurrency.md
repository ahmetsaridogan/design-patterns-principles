# Paralelizm ve Concurrency Nedir?

Concurrency ile parallelism birbirinden ayrı şeyler bir kodun concurrently çalışıyor olduğunu söylemek o kodun parallel olarak çalıştığını göstermiyor.

# Concurrency

Concurrency, birden fazla işlemin aynı anda çalıştığı bir senaryodur. 
Bu, her bir işlemin farklı bir iş parçacığı, süreç veya thread'de çalıştırılabileceği anlamına gelir. 
Concurrency, programlarınızı daha etkili hale getirmenize ve daha hızlı yanıt vermenize yardımcı olabilir.

Bir process, işin bitmesi beklenmeden diğer iştende bir şeylerin yapılmasına bir oraya bir buraya geçmesine Concurrency deniyor. aynı anda muzik dinlemek ve bir dosya indirmek gibi.

* Aynı anda tek bir işin yapılması şartıyla birden fazla işlem yapılmasıdır.
Örneğin; 1 Elimde 2 deftere sırayla yazı yazıyorum


# Paralelizm 

Paralelizm, birden fazla işlemi aynı anda gerçekleştirme yeteneğidir.
Bu, bir işlemcinin birden fazla görevi eşzamanlı olarak gerçekleştirebilmesi anlamına gelir. 
Paralelizm, programlarınızı hızlandırmak için kullanılabilir ve özellikle çoklu çekirdekli işlemcilerde faydalıdır.

Makinada 2 adet cpu olsun, 1 proccess muzik dinliyor, 1 proccess dosya indiriyor.
İşte bu process işlemi sırasında gerçekten aynı anda farklı cpularda işlemler yapılmasına Parallelism deniyor.
Parallelism için multi core bir cpuya sahip olmanız gerekiyor.

* Aynı anda birden fazla işlem yapılmasıdır.
Örneğin; 2 Elimde 2 deftere aynı anda yazı yazıyorum

