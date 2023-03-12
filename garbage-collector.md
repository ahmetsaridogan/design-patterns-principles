# Garbage Collector Nedir? (Çöp Toplayıcı)

Garbage Collector (Çöp Toplayıcı), programlama dillerinde kullanılan bir özelliktir ve dinamik bellek yönetimini kolaylaştırmak için kullanılır.
Garbage Collector, bellekteki kullanılmayan nesneleri otomatik olarak tespit eder ve bu nesnelerin bellekten kaldırılmasını sağlar. Bu işlem, bellek sızıntılarını önleyerek programın daha verimli çalışmasını sağlar.

Genellikle C, C++ gibi dillerde elle yönetilmesi gereken bellek işlemleri için kullanılır. Garbage Collector, bu işlemleri otomatik olarak yapar.
Ruby, Python Java gibi dillerde ise manuel Garbage Collector kullanılmaz. Bu dillerde bellek yönetimi otomatik olarak yapılır.

## Garbage Collector'ın Çalışma Mantığı
Stack (Değer Tipleri)
Heap (Referans Tipleri)

Değer Tipleri (Stack)
```ruby
a = 10
b = 20

c = a + b
puts c
```
Hafıza Yapısı,
Stack   |  Heap
--------|--------
a = 10  |
b = 20  |
c = 30  |

Referans Tipleri (Heap)
```ruby
0: hi = "hi"
1:
2: dizi1  = [1,2]
3: dizi2  = dizi1
4:
5: dizi2[0] = 3
```

Hafıza Yapısı,
Stack        |  Heap
-------------|-----------
hi = "hi"    |
             |
dizi1   =>   | ------
             | [1,2]
dizi2   =>   | ------

- 2. ve 3. adımda dizi1 ve dizi2 aynı referansı gösteriyor. [1,2]
- 5. adımda dizi2'nin 0. elemanı 3 yapıldı. [3,2], ve referans tipli olduğundan dizi1'in 0. elemanı da 3 oldu. [3,2]

Peki GC burada nasıl davranıyor
Program çalışmaya devam ediyor ama method son geldiğinde hafızanın stack bölgesi boşaltılır. Heap bölgesinde ise dizi1 ve dizi2 referansları kaldı. Bu referanslar artık kullanılmıyor. 
GC belirli zaman aralıklarda heap bölgesini tarar ve stack bölgesinde işaret etmeyen çöpleri bellekten kaldırır.
