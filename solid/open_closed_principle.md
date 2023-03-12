# Open/Closed Principle (Açık/Kapalı Prensibi)

Open/Closed Prensibi (OCP), SOLID prensiplerinin bir parçasıdır ve bir sınıfın değişiklik yapılmasını gerektiren durumlar olmadan genişletilebilir olması gerektiğini önerir.
Bu prensip, bir sınıfın davranışını değiştirmek yerine, yeni davranışlar eklenerek genişletilmesini önerir.

#######
```ruby
# Kötü örnek - Kod, her yeni özellik eklenmesinde değiştirilmelidir
class Car
  def initialize(model, year, color)
    @model = model
    @year = year
    @color = color
  end

  def model
    @model
  end

  def year
    @year
  end

  def color
    @color
  end

  def start_engine
    puts "Engine started"
  end

  def stop_engine
    puts "Engine stopped"
  end

  def turn_on_lights
    puts "Lights turned on"
  end

  def turn_off_lights
    puts "Lights turned off"
  end
end
```
#######


Bu örnekte, Car sınıfı, bir aracın sahip olabileceği özellikleri ve davranışları içerir.
Ancak, her yeni özellik eklendiğinde, sınıfın kodunu değiştirmek gerekir.
Bu, sınıfın OCP prensibine uymadığı anlamına gelir.

#######
```ruby
# İyi örnek - Kod, yeni özellikler eklendiğinde değiştirilmemesi gereken şekilde tasarlanmıştır
class Car
  def initialize(model, year, color)
    @model = model
    @year = year
    @color = color
    @engine = Engine.new
    @lights = Lights.new
  end
  
  def model
    @model
  end
  
  def year
    @year
  end
  
  def color
    @color
  end
  
  def start_engine
    @engine.start
  end
  
  def stop_engine
    @engine.stop
  end
  
  def turn_on_lights
    @lights.turn_on
  end
  
  def turn_off_lights
    @lights.turn_off
  end
end

class Engine
  def start
    puts "Engine started"
  end
  
  def stop
    puts "Engine stopped"
  end
end

class Lights
  def turn_on
    puts "Lights turned on"
  end
  
  def turn_off
    puts "Lights turned off"
  end
end
```
#######

Bu örnekte, Car sınıfı, Engine ve Lights sınıflarını kullanarak aracın davranışlarını gerçekleştirir.
Yeni bir özellik eklendiğinde, sınıfın kodunu değiştirmek yerine, yeni bir sınıf oluşturarak veya mevcut bir sınıfı değiştirerek genişletmek mümkündür.
Bu, sınıfın OCP prensibine uyması anlamına gelir.
