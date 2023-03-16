# Creational Design Patterns Nedir? (Yaratıcı Tasarım Kalıpları)

Creational Design Patternler, nesnelerin yaratılmasını ve oluşturulmasını ele alan bir tasarım kalıbıdır. Bu tasarım kalıpları, nesnelerin yaratılması ile ilgili kod tekrarını azaltır, kodun bakımını kolaylaştırır ve nesne yaratma işlemini daha esnek hale getirir.

## Singleton (Tekil):
Bu kalıp, yalnızca bir örneği olan bir sınıf yaratmayı sağlar. Bu, bir uygulama içinde yalnızca bir örneğe ihtiyaç duyulduğu durumlarda faydalıdır. Örneğin, bir veritabanı bağlantısı nesnesi yalnızca bir kez yaratılabilir.

```ruby
class SingletonClass
  @@instance = nil
  
  def self.instance
    @@instance ||= new
  end
  
  private_class_method :new
end

# Kullanımı
singleton_obj = SingletonClass.instance
```

## Factory Method (Fabrika Yöntemi): 
Bu kalıp, bir sınıfın alt sınıfları tarafından oluşturulan nesnelerin yaratılmasını ele alır. Bu, oluşturulacak nesnelerin türüne bağlı olarak farklı bir alt sınıfın kullanılması gerektiği durumlarda faydalıdır. Örneğin, bir oyunun farklı düşman türlerinin yaratılması için Factory Method kullanılabilir.

```ruby
class CarFactory
  def create_car(car_type)
    case car_type
    when "sedan"
      Sedan.new
    when "suv"
      Suv.new
    else
      raise ArgumentError, "Invalid car type: #{car_type}"
    end
  end
end

class Sedan
  def drive
    puts "Driving sedan"
  end
end

class Suv
  def drive
    puts "Driving SUV"
  end
end

# Kullanımı
factory = CarFactory.new
car1 = factory.create_car("sedan")
car2 = factory.create_car("suv")

car1.drive # "Driving sedan" çıktısı verir
car2.drive # "Driving SUV" çıktısı verir
```

## Abstract Factory (Soyut Fabrika): 
Bu kalıp, ilgili nesnelerin bir arada yaratılmasını ele alır. Bu, bir uygulamanın farklı bileşenlerinde kullanılmak üzere uyumlu nesnelerin yaratılması gerektiği durumlarda faydalıdır. Örneğin, bir masaüstü uygulamasının kullanıcı arayüzü elemanlarını (butonlar, metin kutuları, vb.) yaratmak için Abstract Factory kullanılabilir.

```ruby
class GuiFactory
  def create_button
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_textbox
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class WindowsGuiFactory < GuiFactory
  def create_button
    WindowsButton.new
  end

  def create_textbox
    WindowsTextbox.new
  end
end

class MacGuiFactory < GuiFactory
  def create_button
    MacButton.new
  end

  def create_textbox
    MacTextbox.new
  end
end

class WindowsButton
  def click
    puts "Windows button clicked"
  end
end

class MacButton
  def click
    puts "Mac button clicked"
  end
end

class WindowsTextbox
  def type(text)
    puts "Windows textbox typed: #{text}"
  end
end

class MacTextbox
  def type(text)
    puts "Mac textbox typed: #{text}"
  end
end

# Kullanımı
factory = WindowsGuiFactory.new
button = factory.create_button
textbox = factory.create_textbox

button.click # "Windows button clicked" çıktısı verir
textbox.type("Hello") # "Windows textbox typed: Hello" çıktısı verir

factory = MacGuiFactory.new
button = factory.create_button
textbox = factory.create_textbox

button.click # "Mac button clicked" çıktısı verir
textbox.type("Hello") # "Mac textbox typed: Hello" çıktısı verir
```

## Builder (Yapılandırıcı):
Bu kalıp, bir nesnenin yapısını adım adım oluşturmayı ele alır. Bu, bir nesnenin yapısı karmaşık ve farklı parçaların bir araya gelmesiyle oluştuğunda faydalıdır. Örneğin, bir araba nesnesi yapmak için Builder kullanılabilir.

```ruby
class CarBuilder
  attr_accessor :brand, :model, :year, :color, :engine_size
  
  def build
    Car.new(brand, model, year, color, engine_size)
  end
end

class Car
  attr_reader :brand, :model, :year, :color, :engine_size
  
  def initialize(brand, model, year, color, engine_size)
    @brand = brand
    @model = model
    @year = year
    @color = color
    @engine_size = engine_size
  end
end

# Kullanımı
builder = CarBuilder.new
builder.brand = "Toyota"
builder.model = "Corolla"
builder.year = 2021
builder.color = "Silver"
builder.engine_size = 1.8

car = builder.build
puts "Brand: #{car.brand}"
puts "Model: #{car.model}"
puts "Year: #{car.year}"
puts "Color: #{car.color}"
puts "Engine size: #{car.engine_size}"
```

Bu örnekte, `CarBuilder` sınıfı bir araba nesnesi oluşturmak için kullanılan bir builder sınıfıdır. `build` metodunu kullanarak, tüm özellikleri atanmış bir `Car` nesnesi oluşturulur. Kullanıcı, `CarBuilder` örneği oluşturarak özellikleri tek tek belirleyebilir ve ardından `build` metodunu çağırarak son `Car` nesnesini alabilir. Bu yöntem, özelliklerin doğru sırayla atanmasını sağlar ve okunaklı bir kod yazmayı kolaylaştırır. 

## Prototype (Klon):
Bu kalıp, bir nesnenin önceden yaratılmış bir kopyasını kullanarak yeni bir nesne yaratmayı ele alır. Bu, bir uygulamanın farklı özelliklere sahip benzer nesneleri yaratması gerektiği durumlarda faydalıdır. Örneğin, bir grafik editörü programında birçok benzer şekil yaratmak için Prototype kullanılabilir.

```ruby
class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def clone
    return Person.new(@name, @age, @gender)
  end
end

person = Person.new("John", 25, "Male")
puts "Person 1: #{person.name}, #{person.age}, #{person.gender}"

person_clone = person.clone
puts "Person 2: #{person_clone.name}, #{person_clone.age}, #{person_clone.gender}"
```

`Person` nesnesinin bir örneği oluşturulur ve özellikleri belirtilir. Daha sonra, bu nesnenin bir klonu oluşturulur ve özellikleri aynı kalır, karmaşık ve maliyetli işlemlerin tekrarlanmasını engeller.
