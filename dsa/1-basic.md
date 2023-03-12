# Algoritma Nedir?

Algoritma basitçe bir işlemi yapmak için adım adım yol gösterilmesidir, belirli bir durumdan başlayıp belirli bir sonuçta biten problemlere çözüm getiren adımlardır, bunun bütününe adımlar dizisidir.

# Sayı Sistemi

(Binary) İkili sayısı sisteminde sayılar 2 tabanında yazılır. Bu yüzden, ikili sayılar 0 ve 1 kullanarak ifade edilir.

Sayıları ifade ederken genellikle onluk sayı sistemini kullanırız. Onluk sayı sisteminde aralığımız 0 dan 9 a kadar olmasından dolayı tek basamakta 10 farklı durumu ifade edebiliriz. 
İkili sistemde ise tek basamakta 2 farklı durum ifade edilir; 0 ve 1. Tek basamakta!

Onluk sayı sistemindeki bir sayı ikilik sisteme, ikilik sistemdeki bir sayı ise onluk sisteme dönüştürülebilir.

### Örnek: Onluk sistem'den -> ikilik sisteme geçiş

5 Sayısı ikilik sistemde 101 olarak ifade edilir. 
5 sayısını ikilik sistemde ifade etmek için 5 sayısını 2 ye bölerek kalanları birbirinin üstüne yazıyoruz. 5/2=2 kalan 1, 2/2=1 kalan 0, 1/2=0 kalan 1. 101 sayısı 5 sayısını ikilik sistemde ifade eder.


### Örnek: İkilik sistem'den -> onluk sisteme geçiş

101 sayısı onluk sistemde 5 sayısını ifade eder. 
101 sayısını onluk sistemde ifade etmek için 1*2^2 + 0*2^1 + 1*2^0 işlemini yaparak 5 sayısını elde ediyoruz.

Yüzler,    onlar,   birler basamağı
  1          0        1
(1*2^2) + (0*2^1) + (1*2^0) = 5


# Verilen Tutulması

Bilgisayar, yapısından dolayı içerisinde tutulabilecek veri miktarı sınırlıdır, verilerin en küçük yapı taşları bitlerdir. Bitleri bir hafıza gibi düşünebiliriz.

1 Bit -> 2^1 = 2 farklı durum ifade edebilir.
2 Bit -> 2^2 = 4 farklı durum ifade edebilir.
3 Bit -> 2^3 = 8 farklı durum ifade edebilir.
...
8 Bit -> 2^8 = 256 farklı durum ifade edebilir. 8 Bit ise 1 Byte'dır.


# Recursion (Özyineleme)

Bir problemin alt problemlere bölünüp hesaplanmasına, nerde son bulacağımı belirttiğimiz ifadelerdir

Örneğin; Faktöriyel hesaplama
  5!  = 5 * 4 * 3 * 2 * 1

```ruby
def factorial(n)
  return 1 if n == 1

  return n * factorial(n-1)
end
```




