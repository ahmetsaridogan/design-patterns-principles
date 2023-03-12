# Array (Diziler)

Birden çok bilgiyi bir arada tutmak için diziler kullanılır.
Bilgisayar = Ekran, klavye, fare, masa vb.

### Array (Dizi)
Array (Dizi), dezavantajlarından biri olan hafıza problemi, hali hazırda bir klavye, bir mouse ve bir ekranımız var. Yeni bir harici bir klavye veya fare aldığımızda daha büyük bir masaya ihtiyacımız var. 
Bir yerden bir yere taşırken zaman ve güç kaybına uğruyoruz.

### Dynamic Arrays  (Dinamik Diziler)
Yeni bir eleman için boşta yer tutmasından ötürü esnektir. 
Örneğin, bazı mutfak masaları açılan sürgülü bir yapıya sahiptir. Masanın küçük kaldığı durumlarda büyütmek için kullanılır. Dinamik dizilerde aynı mantığa sahiptir. Yeni elemanlar için yer tutarlar.

Dezavantajlarından biri ise hafızada fazladan yer kaplaması, gerçekleşecek olan bir diğer olayı engelleyebilir. 
Nasıl mı? Masa örneğinde Bir Misafirlerin işi çıkması durumunda fazladan yer kapladık ve hareket kabiliyetimizi kaybettik.


# Linked List (Bağlı Liste)
Listeyi bütün olarak yani, yan yana zorunluluğu olmadan veri tutmamızı sağlayan yapılardır. Yeni gelen eleman için hafıza'da yeni bir alan açmamız gerekmez. Array'dan farklı olarak evet elemanlar hafıza içerisinde dağılmış olabilir, fakat son gelen eleman kendinden bir önceki elemana adresini bildirmek zorundadır.

Referans tipte verileri tutarlar. [1, #pid1], [2, #pid2], [3, null] gibi. [(Data, Heap), Next] şeklinde tutulurlar.


# Linked List vs Array

### Array
* Arrayin istediğimiz elemanına sabit sürede erişebiliriz. (Random Access)
* Sadece elemanı tuttuğumuz için daha az yer kaplar.
* Daha çok statik durumlarda daha performanslıdır.
* Hafızada blok olarak yer tutulması gerekir.
* Arrayler ise 15. elemana direkt erişebiliriz.
* Memory locality (Hafıza yerelleşmesi) için daha uygun.
  
### Linked List
* Eleman ekleme ve silme işlemlerinde array'e göre daha kolay/hızlıdır.
* Elemanların bir blok olarak tutulması gerekmiyor, hafızada blok olarak yer yoksada kullanılabilir.
* Linked listler, eleman ile birlikte adress tuttuğundan dolayı hafızada daha fazla yer kaplar.
* Linked listlerde 15. elemana gitmek için birbirine bağlı olan elemanları ziyaret etmek gerek
* Ekleme, çıkarma fazla olan durumlarda daha performanslıdır.

# Stack (Yığın)
LIFO (Last In First Out) mantığı ile çalışır. Eleman topluluğundan oluşan yapıdır, 
Kitapları üst üste koymak gibi düşünebiliriz. Son eklenen eleman ilk çıkarılır.

* Push: Stack'e eleman eklemek için kullanılır.
* Pop: Stack'ten eleman çıkarmak için kullanılır.

# Queue (Kuyruk)
FIFO (First In First Out) mantığı ile çalışır. Eleman topluluğundan oluşan yapıdır,
Kuyruğa giren ilk kişi ilk çıkar.

* Enqueue: Queue'a eleman eklemek için kullanılır.
* Dequeue: Queue'dan eleman çıkarmak için kullanılır.

```ruby
class Queue
  # Bir boş dizi oluşturur.
  def initialize
    @queue = []
  end
  
  # Kuyruğa yeni bir öğe ekler.
  def enqueue(item)
    @queue.push(item)
  end
  
  # Kuyruktan bir öğe çıkarır ve onu döndürür.
  def dequeue
    @queue.shift
  end
  
  # Kuyruktaki öğelerin sayısını döndürür.
  def size
    @queue.length
  end
  
  # Kuyruğun boş olup olmadığını kontrol eder.
  def empty?
    @queue.empty?
  end
  
  # Kuyruktaki ilk öğeyi döndürür, ancak onu kuyruktan çıkarmaz
  def peek
    @queue.first
  end
end
```
### Kullanımı
```ruby
queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

puts queue.peek # 1
puts queue.dequeue # 1
puts queue.dequeue # 2
puts queue.empty? # false
puts queue.size # 1
```

# Hash Table (Hash Tablosu)
### Hash Function + Array = Hash Table
Hash tablosu, anahtar ve değer ikililerinden oluşan bir veri yapısıdır.

Ürün listesi düşünelim, ürün adı ve fiyatları.
* Key (Anahtar): Ürün adı, 
* Value (Değer): Ürün fiyatı

# Hash Function

```ruby
hash = {elma: 10, armut: 20}

# * Hash Function her seferinde aynı girdiye aynı sonucu vermeli
hash[:elma] 
# Out: 10

# * Farklı girdiler farklı çıktılar versin istiyoruz
hash[:muz] = 30
# Out: 30
```

# Hash Collision (Çarpışma)
Hash Function farklı iki değerden aynı sayı üretilirse bu duruma Collison (çarpışma) denir.
Collision olduğun durumlar Linked List olarak tutulabilir.

* Hash Function'lar bazen farklı durumlar için farklı sonuçlar üretemeyebilir. Örnek olarak araçları bir hash function dan geçirelim. Bu fonksiyonumuz son harflerine göre bir değer atıyor. Örneğin, motor ve tır için aynı değerleri ataması collision'a neden oluyor.

* Collision sorunuyla az karşılaşabilmek için kaliteli bir hash function olmalı. Bu sayede verimli bir Hash Table elde etmiş oluyoruz.

*Çarpışma sayısı arttıkça aradığımız şeyi bulma hızı azalır.
