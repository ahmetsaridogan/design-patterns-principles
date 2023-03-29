# Array (Diziler)

Birden çok bilgiyi bir arada tutmak için diziler kullanılır.
Bilgisayar = Ekran, klavye, fare, masa vb.

### Array (Dizi)
Array (Dizi), dezavantajlarından biri olan hafıza problemi, hali hazırda bir klavye, bir mouse ve bir ekranımız var. Yeni bir harici bir klavye veya fare aldığımızda daha büyük bir masaya ihtiyacımız var. 
Bir yerden bir yere taşırken zaman ve güç kaybına uğruyoruz.

### Dynamic Arrays  (Dinamik Diziler)
Yeni bir eleman için boşta yer tutmasından ötürü esnektir. 
Örneğin, bazı mutfak masaları açılan sürgülü bir yapıya sahiptir. Masanın küçük kaldığı durumlarda büyütmek için kullanılır. Dinamik dizilerde aynı mantığa sahiptir. Yeni elemanlar için yer tutarlar.

Dezavantajlarından; 
* Biri ise hafızada fazladan yer kaplaması, gerçekleşecek olan bir diğer olayı engelleyebilir. Nasıl mı? Masa örneğinde Bir Misafirlerin işi çıkması durumunda fazladan yer kapladık ve hareket kabiliyetimizi kaybettik.
* Bir diğer eksiside tutulan yerden daha fazla eleman gelirse, bu sefer o blok komple taşınmak zorunda kalıyor

Avantajlarından;
* Array'lerin birbirine bağlı olması ulaşılabilirliğini kolaylaştırır. Klavye-Mouse-Monitör örneğimiz olsun. Hepsi bir masada bulununca ulaşılması kolaydır. (Masa = Array, Klavye-Mouse-Monitör = Array Elemanı)

```ruby
# yeni bir dinamik dizi oluşturma
dynamic_array = []
# yeni bir dizi oluşturma
my_array = [1, 2, 3, 4, 5]

# diziye eleman ekleme
my_array.push(6)
my_array << 7

# dizi elemanlarını güncelleme
my_array[0] = 0
my_array[-1] = 8

# dizi elemanlarını silme
my_array.delete_at(2)
my_array.delete(5)

# dizi elemanlarını sıralama
my_array.sort!

# dizi elemanlarını tersine çevirme
my_array.reverse!

# dizi elemanlarını filtreleme
my_array.select! { |element| element > 3 }

# dizi elemanlarını ekrana yazdırma
puts my_array
```

# Linked List (Bağlı Liste)
Listeyi bütün olarak yani, yan yana zorunluluğu olmadan veri tutmamızı sağlayan yapılardır. Yeni gelen eleman için hafıza'da yeni bir alan açmamız gerekmez. Array'dan farklı olarak evet elemanlar hafıza içerisinde dağılmış olabilir, fakat son gelen eleman kendinden bir önceki elemana adresini bildirmek zorundadır.

Referans tipte verileri tutarlar. [1, #next->2], [2, #next->3], [3, null] gibi. [(Data, Heap), Next] şeklinde tutulurlar.


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

```ruby
class Node
  attr_accessor :data, :next_node
  
  def initialize(data)
    @data = data
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end
  
  def add_node(data)
    new_node = Node.new(data)
    
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end
  
  def remove_node(data)
    current_node = @head
    previous_node = nil
    
    while !current_node.nil? && current_node.data != data
      previous_node = current_node
      current_node = current_node.next_node
    end
    
    if current_node.nil?
      return
    end
    
    if previous_node.nil?
      @head = current_node.next_node
    else
      previous_node.next_node = current_node.next_node
    end
    
    if current_node.next_node.nil?
      @tail = previous_node
    end
  end
  
  def print_list
    current_node = @head
    
    while !current_node.nil?
      puts current_node.data
      current_node = current_node.next_node
    end
  end
end

# örnek kullanım
list = LinkedList.new
list.add_node("hello")
list.add_node("world")
list.add_node("ruby")
list.print_list
list.remove_node("world")
list.print_list
```

# Stack (Yığın)
LIFO (Last In First Out) mantığı ile çalışır. Eleman topluluğundan oluşan yapıdır, 
Kitapları üst üste koymak gibi düşünebiliriz. Son eklenen eleman ilk çıkarılır.

* Push: Stack'e eleman eklemek için kullanılır.
* Pop: Stack'ten eleman çıkarmak için kullanılır.


```ruby
class Stack
  # Bir boş dizi oluşturur.
  def initialize
    @stack = []
  end
  
  # Yığıta yeni bir öğe ekler.
  def push(item)
    @stack.push(item)
  end
  
  # Yığıttan bir öğe çıkarır ve onu döndürür.
  def pop
    @stack.pop
  end
  
  # Yığıttaki öğelerin sayısını döndürür.
  def size
    @stack.length
  end
  
  # Yığın boş olup olmadığını kontrol eder.
  def empty?
    @stack.empty?
  end
  
  # Yığının en üstündeki öğeyi döndürür, ancak onu yığından çıkarmaz.
  def peek
    @stack.last
  end
end
```
### Kullanımı
```ruby
stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)

puts stack.peek # 3
puts stack.pop # 3
puts stack.pop # 2
puts stack.empty? # false
puts stack.size # 1
```

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

Örneğin;
* Hash Table ürünlerin fiyatını ezbere bilen çalışan gibi düşünebiliriz

* Ürünlerin isimlerini ve fiyatlarını array'in elemanları olarak tutup bu sorunu çözebilirdik ama ürünlerin array'de tek tek aramak yerine ananın aradığımız ürünün fiyatını bulmak istiyoruz.

* Başlangıç olarak ürün sayısına eşit boş bir array olsun,

* Ürünlerin isimlerini bir fonksiyona sokup çıktılar alalım, Ürün adını vereceğiz bize çıktı olarak index versin.

"Çay" -> [Function] -> 1
"Kahve" -> [Function] -> 0

* Fonksiyonun çıktılarını oluşturduğumuz array'in index'i olarak kullanıp, ürünlerin fiyatlarını bu indexlerde tutucağız

|0|1|2|
|-|-|-|
|15 TL|5 TL|-|
|Kahve|Çay|-|

* Array'ler bize kaçıncı eleman olursa olsun sabit sürede istenen lokasyondaki elemanı verebiliyordu

* Bu sabit sürede erişmeyi lokasyon bazlı değil, tanım bazlı kullanmak istiyoruz, Bize 3. elemanı getir değil, bize "Kahve"'ye karşılık gelen elemanı/fiyatı getir demek istiyoruz.

* Biri bize bir ürünün fiyatını sorduğunda bu ürünü oluşturduğumuz fonksiyona besleyip arraydeki index'i neredeymiş onu bulacağız.

* Bu fonksiyonu Hash Fuction, Hash Function + Array yapısına da Hash Table deniyor.

Ürün listesi düşünelim, ürün adı ve fiyatları.
* Key (Anahtar): Ürün adı, 
* Value (Değer): Ürün fiyatı

# Hash Function
* Hash Function her seferinde aynı girdiye aynı sonucu vermeli

* Farklı girdiler farklı çıktılar versin istiyoruz

* Hash Function'ın çıktılarının array'in boyutunda olmalı, Array 20 elemanlı H. Func. 30. index'i veremez

* Fonksiyona gönderilen anahtarlar aynı fakat sonuç farklı ise hash function değildir, bu duruma "Collision" deniyor.

```ruby
# basit bir hash fonksiyonu
def hash_function(key)
  # girdi dizisini karakterlerine ayır
  characters = key.split('')
  
  # karakter kodlarının toplamını al
  total = 0
  characters.each do |character|
    total += character.ord
  end
  
  # toplamın modunu alarak bir tam sayı çıktısı ver
  return total % 100

  # Hash Collision olsun isteyelim, bu için fonksiyon çıktısını bu şekilde deneyebiliriz.
  #return key.length % 10
end

# yeni bir hash tablosu oluşturma
hash_table = {}

# eleman ekleme
hash_table[hash_function("anahtar1")] = "değer1"
hash_table[hash_function("anahtar2")] = "değer2"
hash_table[hash_function("anahtar3")] = "değer3"

# elemanları güncelleme
hash_table[hash_function("anahtar1")] = "yeni_değer1"
hash_table[hash_function("anahtar4")] = "değer4"

# elemanları silme
# hash_table.delete(hash_function("anahtar2"))

# değerlere erişme
puts hash_table[hash_function("anahtar1")]
puts hash_table[hash_function("anahtar3")]

# tüm anahtar-değer çiftlerine erişme
hash_table.each do |key, value|
  puts "#{key}: #{value}"
end

## Bir Hash örneği
hash = {elma: 10, armut: 20}
hash[:elma] 
# Out: 10

hash[:muz] = 30
# Out: 30
```

# Hash Collision (Çarpışma)
Hash Function farklı iki değerden aynı sayı üretilirse bu duruma Collison (çarpışma) denir.
Collision olduğun durumlar Linked List olarak tutulabilir.

* Hash Function'lar bazen farklı durumlar için farklı sonuçlar üretemeyebilir. Örnek olarak araçları bir hash function dan geçirelim. Bu fonksiyonumuz son harflerine göre bir değer atıyor. Örneğin, motor ve tır için aynı değerleri ataması collision'a neden oluyor.

* Collision sorunuyla az karşılaşabilmek için kaliteli bir hash function olmalı. Bu sayede verimli bir Hash Table elde etmiş oluyoruz.

* Çarpışma sayısı arttıkça aradığımız şeyi bulma hızı azalır.

* Yukarıdaki örnekte Hash function içerinde, verilen anahtarı sayısına göre index dönersek "Collision" oluşabilir