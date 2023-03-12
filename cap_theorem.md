"CAP teoremi" genellikle bilgisayar ağları ve dağıtık sistemler gibi bölünmüş sistemlerde veri konsantrasyonu ve yük dengesi konularında kullanılan bir teoridir.

CAP teoremi, bir bölünmüş sistemde aşağıdaki üç özelliğin sadece ikisinin eş zamanlı olarak garanti edilebileceğini belirtir:

* Consistency (Tutarlılık): Her istemcinin okuması veya yazması gerektiğinde her zaman en son güncellenmiş veriyi okumasına veya yazmasına izin verir. Her yerde aynı veriye sahip olur

* Availability (Erişilebilirlik): Her istemcinin istekleri için yanıt verme garantisi verir. Her zaman veriye erişilebilir olur

* Partition tolerance (Bölünme Toleransı): Ağda bir arıza veya gecikme olması durumunda bile sistem devam edebilir.
  
  Verinin network üzerinde dağıtılıp dağıtılamıyacağına bakılır, Yani elimizde bir veri var  network üzerinde farklı yerlere koyduğumuzda sistem çalışıcak mı? yoksa bütüncül olarak tek bir sunucuda mı durması gerekir
  Burada 2 sunucu var diyelim, ama tutarlılık olmazsa içerisindeki datalar farklı olabilir
  
Bu üç özellik, CAP olarak kısaltılır. CAP teoremi, bir bölünmüş sistem tasarımında, hangi özelliklerin öncelikli olduğunu seçerken dikkate alınması gerektiğini gösterir. Örneğin, bir bölünmüş sistemde partition tolerance öncelikliyse, tutarlılık ve erişilebilirlikte bazı kayıplar yaşanabilir.

Cassandra 
Eventual (weak, zayıf) Consistency, Availability, Partition Tolerance


CA: Sql Server, Mysql, Oracle, Psql, ...RDBMS 
CP: MongoDB, Redis, Memcached, ...NoSQL
AP: Cassandra, CouchDB, DynamoDB, Riak


## ACID & BASE
# ACID

* Atomic (Bölünmezlik): 
Transaction'ların bölünememesi, Örn; havale işlemi, gönderen hesapdaki para düşmesi, alıcı hesabın para artması gibi bir işlemde, bir kısmı başarılı olurken diğer kısmı başarısız olursa, işlem gerçekleşmemiş sayılır. Bu durumda işlemi geri almak gerekir. Bu durumda işlem atomik olmaz.

* Consistent (Tutarlılık):
Verinin tutarlı olması, örneğin bir hesapta 1000 TL varsa, bu hesaptan 500 TL gönderilirse, hesapta 500 TL kalmalıdır. Bu durumda işlem tutarlıdır.

* Isolated (Bağımsızlık, izolasyon):
Bir işin çalışması diğer işin çalışmasına etki etmemelidir. Örneğin bir hesaptan 500 TL gönderilirken, aynı anda başka bir hesaptan da 500 TL gönderilirse, bu durumda işlemler birbirinden bağımsız olmalıdır. Bu durumda işlemler bağımsızdır.

* Durable (Dayanıklılık):
Veritabanı göçse bile verilerin kaybolmaması, Verinin kalıcı olması, örneğin bir hesaptan 500 TL gönderildiğinde, bu işlem gerçekleştiğinde, veri tabanında bu işlem kaydedilmelidir. Bu durumda işlem dayanıklıdır.

# BASE
* Basic Availability (Temel Kullanılabilirlik): 
Büyük veri sistemlerinde, verilerin tutarlılığından ziyade, verilerin erişilebilirliği önemlidir. Bu durumda verilerin tutarlılığından ödün verilir.

* Soft state (Yumuşak durum):
Verisinin her zaman tutarlı-güncel olması gerekmez. Verinin tutarlılığı zamanla sağlanabilir.
Bir banka için hiç kullanışlı olmaz

* Eventual consistency (Sonunda/Nihai tutarlılık):
Verilerin bir şekilde tutarlı olması lazım, örneğin farklı farklı sunucularda verileri var, diyelim ki sistemi kapattık, şu an da consistency için bu sistemi çalıştırcaz, bu sunuculardan hangisi güncel, dolayısıyla sunucular birbirleriyle hesaplaşarak güncel veriyi bulacaklar, bu durumda veriler tutarlı olacak, sistem sadece bunu kontsatre olması gerekebilir
