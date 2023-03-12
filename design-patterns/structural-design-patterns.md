# Structural Design Pattern Nedir?

Structural Design Pattern, bir yazılım sistemi içinde nesnelerin yapılandırılmasına ve bir araya getirilmesine odaklanan bir tasarım desenleri kategorisidir. Bu desenler, nesne yapılarındaki değişiklikleri yönetmek ve nesneler arasındaki ilişkileri daha esnek hale getirmek için kullanılır.

## Adapter Pattern (Uyumlayıcı):
Bu desen, farklı arayüzleri olan iki sınıfın birbirleriyle çalışmasını sağlar. Bu sayede bir sınıfın kodunda yapılan değişiklikler diğer sınıfı etkilemez. Örneğin, bir sınıfın sadece bir arabirimi desteklediği durumlarda, bu desen kullanılarak başka bir arabirimle uyumlu hale getirilebilir.

```ruby
# Adaptee
class LegacyPrinter
  def print(string)
    puts "Printing #{string} from LegacyPrinter"
  end
end

# Target
class NewPrinter
  def print(string)
    puts "Printing #{string} from NewPrinter"
  end
end

# Adapter
class PrinterAdapter
  def initialize(legacy_printer)
    @legacy_printer = legacy_printer
  end

  def print(string)
    @legacy_printer.print(string)
  end
end

# Usage
legacy_printer = LegacyPrinter.new
new_printer = NewPrinter.new
printer_adapter = PrinterAdapter.new(legacy_printer)

new_printer.print("Hello, World!")  # Printing Hello, World! from NewPrinter
printer_adapter.print("Hello, World!")  # Printing Hello, World! from LegacyPrinter
```

## Bridge Pattern (Köprü):
Bu desen, nesne yapılarını soyutlamak için kullanılır. Bu sayede nesnelerin bir arayüzden farklı bir arayüze geçmesi kolaylaşır. Örneğin, bir sınıfın çeşitli özelliklerinin farklı platformlarda kullanılabilmesi için bu desen kullanılabilir.

```ruby
# Implementor
class Color
  def fill_color
    raise NotImplementedError, "Subclass must implement abstract method"
  end
end

# Concrete Implementors
class Red < Color
  def fill_color
    puts "Filling with red color"
  end
end

class Blue < Color
  def fill_color
    puts "Filling with blue color"
  end
end

# Abstraction
class Shape
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def draw
    raise NotImplementedError, "Subclass must implement abstract method"
  end
end

# Refined Abstractions
class Square < Shape
  def draw
    puts "Drawing a square with color:"
    @color.fill_color
  end
end

class Circle < Shape
  def draw
    puts "Drawing a circle with color:"
    @color.fill_color
  end
end

# Usage
red = Red.new
blue = Blue.new

square = Square.new(red)
circle = Circle.new(blue)

square.draw
# Output: 
# Drawing a square with color:
# Filling with red color

circle.draw
# Output:
# Drawing a circle with color:
# Filling with blue color
```

## Composite Pattern (Bileşen):
Bu desen, birbirine bağlı nesnelerin hiyerarşik bir yapı oluşturmasına izin verir. Bu sayede bir nesne, içinde birden fazla nesne barındırabilen bir koleksiyon haline gelebilir. Örneğin, bir web sayfası içindeki farklı bileşenlerin bir arada kullanılabilmesi için bu desen kullanılabilir.

```ruby
# Component
class Component
  def initialize(name)
    @name = name
  end

  def add(component)
    raise NotImplementedError, "Subclass must implement abstract method"
  end

  def remove(component)
    raise NotImplementedError, "Subclass must implement abstract method"
  end

  def display(depth)
    raise NotImplementedError, "Subclass must implement abstract method"
  end
end

# Leaf
class File < Component
  def add(component)
    puts "Cannot add to a file"
  end

  def remove(component)
    puts "Cannot remove from a file"
  end

  def display(depth)
    puts "File: #{@name} (#{depth})"
  end
end

# Composite
class Folder < Component
  def initialize(name)
    super(name)
    @children = []
  end

  def add(component)
    @children << component
  end

  def remove(component)
    @children.delete(component)
  end

  def display(depth)
    puts "Folder: #{@name} (#{depth})"
    @children.each { |child| child.display(depth + 1) }
  end
end

# Usage
root = Folder.new("root")
root.add(File.new("file1"))
root.add(File.new("file2"))

subfolder1 = Folder.new("subfolder1")
subfolder1.add(File.new("file3"))
subfolder1.add(File.new("file4"))

root.add(subfolder1)

root.display(0)
# Output:
# Folder: root (0)
# File: file1 (1)
# File: file2 (1)
# Folder: subfolder1 (1)
# File: file3 (2)
# File: file4 (2)
```

## Decorator Pattern (Dekoratör):
Bu desen, bir nesnenin işlevselliğini değiştirmeden, nesneye ek özellikler eklemeyi sağlar. Bu sayede bir sınıfın kodunda yapılan değişiklikler diğer sınıfı etkilemez. Örneğin, bir metin editöründeki metin nesnesine farklı renk ve font özellikleri eklemek için bu desen kullanılabilir.

```ruby
# Component
class Pizza
  def description
    "Plain pizza"
  end

  def cost
    10
  end
end

# Concrete Component
class ThinCrustPizza < Pizza
  def description
    "Thin crust pizza"
  end

  def cost
    8
  end
end

# Decorator
class ToppingDecorator < Pizza
  def initialize(pizza)
    @pizza = pizza
  end

  def description
    @pizza.description
  end

  def cost
    @pizza.cost
  end
end

# Concrete Decorator
class Cheese < ToppingDecorator
  def description
    @pizza.description + ", with cheese"
  end

  def cost
    @pizza.cost + 2
  end
end

# Usage
plain_pizza = Pizza.new
puts "Description: #{plain_pizza.description}, Cost: $#{plain_pizza.cost}"

thin_crust_pizza = ThinCrustPizza.new
puts "Description: #{thin_crust_pizza.description}, Cost: $#{thin_crust_pizza.cost}"

cheese_pizza = Cheese.new(thin_crust_pizza)
puts "Description: #{cheese_pizza.description}, Cost: $#{cheese_pizza.cost}"
```

## Facade Pattern (Yüzey, Arabirim):
Bu desen, karmaşık bir sistemi daha basit bir arabirimle sunar. Bu sayede bir sistemdeki farklı parçaların birbirine bağımlılıkları azaltılabilir ve sistemin kullanımı daha kolay hale getirilebilir. Örneğin, bir araba içindeki farklı sistemlerin kullanımını basitleştirmek için bu desen kullanılabilir.

```ruby
# Subsystems
class PowerSupply
  def initialize
    puts "Power supply initialized"
  end

  def turn_on
    puts "Power supply turned on"
  end

  def turn_off
    puts "Power supply turned off"
  end
end

class CPU
  def initialize
    puts "CPU initialized"
  end

  def execute
    puts "CPU executing"
  end
end

class Memory
  def initialize
    puts "Memory initialized"
  end

  def load
    puts "Memory loaded"
  end
end

# Facade
class Computer
  def initialize
    @power_supply = PowerSupply.new
    @cpu = CPU.new
    @memory = Memory.new
  end

  def turn_on
    @power_supply.turn_on
    @cpu.execute
    @memory.load
    puts "Computer turned on"
  end

  def turn_off
    puts "Computer turned off"
    @power_supply.turn_off
  end
end

# Usage
computer = Computer.new
computer.turn_on
# Output:
# Power supply initialized
# Power supply turned on
# CPU initialized
# CPU executing
# Memory initialized
# Memory loaded
# Computer turned on

computer.turn_off
# Output:
# Computer turned off
# Power supply turned off
```

## Flyweight Pattern (Uçucu/Hafif Nesne):
Bu desen, bir nesne grubunun ortak özelliklerini paylaşarak bellek kullanımını azaltmayı sağlar. Bu sayede aynı özelliklere sahip nesnelerin her defasında bellekte tekrar oluşturulması yerine, aynı nesne tekrar kullanılabilir. Örneğin, bir oyun motorundaki farklı karakterlerin görüntüleri gibi benzer nesnelerin bellek kullanımını azaltmak için bu desen kullanılabilir.

```ruby
# Flyweight
class TreeType
  attr_reader :name, :color, :texture

  def initialize(name, color, texture)
    @name = name
    @color = color
    @texture = texture
  end
end

# Flyweight Factory
class TreeTypeFactory
  def self.tree_types
    @tree_types ||= {}
  end

  def self.get_tree_type(name, color, texture)
    tree_types[name] ||= TreeType.new(name, color, texture)
  end
end

# Context
class Tree
  attr_accessor :x, :y, :tree_type

  def initialize(x, y, tree_type_name, color, texture)
    @x = x
    @y = y
    @tree_type = TreeTypeFactory.get_tree_type(tree_type_name, color, texture)
  end

  def draw
    puts "Tree drawn at #{@x}, #{@y}."
    puts "Name: #{tree_type.name}, Color: #{tree_type.color}, Texture: #{tree_type.texture}"
  end
end

# Usage
trees = []

trees << Tree.new(0, 0, "Maple", "Red", "Smooth")
trees << Tree.new(10, 10, "Pine", "Green", "Rough")
trees << Tree.new(20, 20, "Maple", "Yellow", "Smooth")

trees.each(&:draw)
# Output:
# Tree drawn at 0, 0.
# Name: Maple, Color: Red, Texture: Smooth
# Tree drawn at 10, 10.
# Name: Pine, Color: Green, Texture: Rough
# Tree drawn at 20, 20.
# Name: Maple, Color: Red, Texture: Smooth
```

## Proxy Pattern (Vekil):
Bu desen, bir nesne üzerindeki erişimi kontrol etmek ve yönetmek için kullanılır. Bu sayede bir nesneye erişim kontrolü sağlanabilir veya bir nesne üzerindeki erişim zamanlaması ve kaynak kullanımı yönetilebilir. Örneğin, bir dosya sistemine erişim kontrolü sağlamak için bu desen kullanılabilir.

```ruby
# Subject
class Video
  def initialize(title, duration, size)
    @title = title
    @duration = duration
    @size = size
  end

  def play
    puts "Playing video: #{@title} (Duration: #{@duration}, Size: #{@size} MB)"
  end
end

# Proxy
class VideoProxy < Video
  def initialize(title, duration, size, user)
    super(title, duration, size)
    @user = user
  end

  def play
    if @user.can_play_video?
      super
    else
      puts "User is not authorized to play this video."
    end
  end
end

# Usage
class User
  def can_play_video?
    true
  end
end

video = VideoProxy.new("The Shawshank Redemption", "2h 22m", 1_500, User.new)
video.play
# Output:
# Playing video: The Shawshank Redemption (Duration: 2h 22m, Size: 1500 MB)
```
