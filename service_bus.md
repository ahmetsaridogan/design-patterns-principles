# Service Bus Nedir?

Service Bus, bir yazılım mimarisi tasarımıdır ve uygulamalar arasında iletişim kurmak için kullanılan bir mesajlaşma çözümüdür. Service Bus, gönderen ve alıcılar arasında mesajlar aracılığıyla bilgi paylaşımını sağlar.

#### Örneğin
* Bir e-ticaret sitesi, bir ödeme işlemi tamamlandığında sipariş işlemini tamamlamak için kullanılabilir. 
* Bir uygulama, bir veritabanı veya bir web servisi gibi diğer uygulamalarla etkileşimde bulunmak için de kullanılabilir.
* Bir işletmenin farklı bölümleri arasında veri paylaşımı yapmak için kullanılabilir. İşletmenin Finans, IK ve Müşteri hizmetleri gibi farklı bölümleri arasında veri paylaşımı yapmak için kullanılabilir. IK bir personeli işten çıkışını yaparken Finans bölümüne bildirim gönderir, personelin çıkış işlemleri ve ücret ödemeleri tamamlayabilir

## Örnek Araçlar
0 - RabbitMQ: RabbitMQ, açık kaynaklı bir mesajlaşma aracıdır. Yüksek ölçeklenebilirlik ve dayanıklılık sunar. Farklı uygulama bileşenleri arasında veri alışverişini kolaylaştırabilir.

RabbitMQ dezavantajları
  restart edildiğinde tüm mesajların kaybolması
  queue içinde fitreleme veya update doğrudan yapılmıyor, Data flow veya processing frameworklerine ihtiyaç var. (Apache Beam, Spark, Flink vs.)

1 - Apache Kafka: Apache Kafka, yüksek ölçeklenebilirlik ve dayanıklılık sunan bir mesajlaşma sistemi olarak popülerdir. Hızlı ve güvenilir bir şekilde mesajları işleyebilir ve farklı uygulama bileşenleri arasında veri alışverişini kolaylaştırabilir.

2 - Azure Service Bus: Azure Service Bus, Microsoft tarafından sunulan bir hizmettir ve farklı uygulama bileşenleri arasında iletişimi kolaylaştırmak için kullanılır. Azure Service Bus, mesajların kuyruklarda toplanması, iletimi ve işlenmesi için kullanılabilir.

3 - Amazon Simple Queue Service (SQS): Amazon SQS, farklı uygulama bileşenleri arasında mesajlaşmayı kolaylaştıran bir hizmettir. Farklı özellikler sunan iki farklı kuyruk tipi sunar: standart ve FIFO.

4 - Apache ActiveMQ: Apache ActiveMQ, JMS (Java Message Service) API'sini destekleyen bir mesajlaşma aracıdır. Çeşitli programlama dilleri ve protokoller arasında veri alışverişini sağlar.

5- NSQ: NSQ, dağıtık ve ölçeklenebilir bir mesajlaşma platformudur. Yüksek performans, güvenilirlik ve ölçeklenebilirlik sunar. Düşük gecikme süreleri, yüksek güvenilirlik ve ölçeklenebilirlik nedeniyle popüler bir seçimdir.
