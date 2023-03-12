# Liskov Substitution Principle (Liskov Yerine Koyma Prensibi)

Liskov Substitution Prensibi (LSP), SOLID prensiplerinin bir parçasıdır ve bir üst sınıfın her zaman alt sınıfları ile yer değiştirebilmesi gerektiğini önerir.
Bu prensip, alt sınıfların üst sınıfların yerine geçebileceği ve programın beklenen şekilde çalışması gerektiği anlamına gelir.

#######
```ruby
# Kötü örnek - Alt sınıf üst sınıfın davranışını bozar
class Rectangle
  attr_accessor :width, :height

  def area
    width * height
  end
end

class Square < Rectangle
  def width=(value)
    @width = value
    @height = value
  end

  def height=(value)
    @height = value
    @width = value
  end
end
```
#######

Bu örnekte, Square sınıfı Rectangle sınıfından türetilir. Ancak, Square sınıfı, Rectangle sınıfında kullanılan alan formülünü bozar. 
Çünkü, bir kare her zaman aynı genişliğe ve yüksekliğe sahip olmalıdır. 
Bu, bir kare nesnesinin beklendiği yerde, bir dikdörtgen nesnesinin kullanılması durumunda beklenmeyen sonuçlara yol açabilir.

#######
```ruby
# İyi örnek - Alt sınıf üst sınıfın davranışını bozmaz
class Shape
  def area
    raise NotImplementedError
  end
end

class Rectangle < Shape
  attr_accessor :width, :height

  def area
    width * height
  end
end

class Square < Shape
  attr_accessor :side

  def area
    side * side
  end
end
```
#######

Bu örnekte, Shape sınıfı, tüm şekillerin uygulaması gereken bir area yöntemine sahiptir.
Rectangle ve Square sınıfları Shape sınıfından türetilir ve area yöntemini uygular.
Bu, her iki sınıfın da area yöntemi aracılığıyla bir şekil olarak davranabileceği anlamına gelir.
Ayrıca, Square sınıfı Rectangle sınıfından türetilmez ve Rectangle sınıfından farklı davranışlar sergilemez.
Bu nedenle, Square sınıfı herhangi bir yerde bir Shape nesnesi beklenen yerde kullanılabilir.
