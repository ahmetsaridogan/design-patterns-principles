# Interface Segregation Principle (Arayüz Ayırma Prensibi)

Interface Segregation Prensibi (ISP), SOLID prensiplerinin bir parçasıdır ve bir arayüzün mümkün olduğunca özelleştirilmiş parçalara bölünmesini önerir.
Bu prensibe göre, bir sınıfın kendi ihtiyaçlarını karşılamak için kullanmadığı özelliklerin zorunlu olarak uygulanması gereksizdir. Bu gereksiz özellikler, bağımlılık enjeksiyonu gibi tekniklerle sınıfa dayatılabilir, ancak bunun yerine daha iyi bir çözüm, bu özellikleri ayrı arayüzler haline getirmek ve sınıfın sadece kendi ihtiyaçlarını karşılayan arayüzleri uygulamasını sağlamaktır.
Bu şekilde, sınıfın gereksiz özelliklere olan bağımlılığı azalır ve daha esnek bir yapı oluşur.

#######
```ruby
# Kötü örnek - Tek bir arayüzde çok sayıda metod tanımlanmıştır
module Animal
  def breathe
    puts "Breathing..."
  end

  def eat
    puts "Eating..."
  end

  def move
    puts "Moving..."
  end
end

class Bird
  include Animal

  def fly
    puts "Flying..."
  end
end

class Fish
  include Animal

  def swim
    puts "Swimming..."
  end
end

class Human
  include Animal

  def talk
    puts "Talking..."
  end
end
```

#######

Bu örnek, Animal modülünde üç ayrı metodu bir arada bulundurur ve tüm hayvan sınıfları tarafından uygulanır. 
Ancak, bu yaklaşım ISP'yi ihlal eder çünkü tüm hayvanlar hareket eder, ancak tüm hayvanlar uçmaz veya yüzmeye ihtiyaç duymaz.
Bunun yerine, arayüzlerin daha özelleştirilmiş hale getirilmesi gerekir.

#######
```ruby
# İyi örnek - Arayüzler ISP prensibine uygun olarak ayrılmıştır
module Movable
  def move
    raise NotImplementedError
  end
end

module Flyable
  def fly
    raise NotImplementedError
  end
end

module Swimmable
  def swim
    raise NotImplementedError
  end
end

class Bird
  include Movable
  include Flyable

  def move
    puts "Flapping wings..."
  end

  def fly
    puts "Flying..."
  end
end

class Fish
  include Movable
  include Swimmable

  def move
    puts "Wiggling body..."
  end

  def swim
    puts "Swimming..."
  end
end

class Human
  include Movable

  def move
    puts "Walking..."
  end
end
```
#######

Bu örnekte, Animal modülünün yerini üç ayrı arayüz (Movable, Flyable ve Swimmable) almıştır.
Her hayvan sınıfı, kendi gereksinimlerine uygun olan arayüzleri uygular.
