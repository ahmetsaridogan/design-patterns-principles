# Behavioral Design Patterns Nedir? (Davranışsal Tasarım Kalıpları)

Behavioral Patternler, yazılım tasarımında kullanılan tasarım kalıplarından bir grup olup, nesneler arasındaki davranışlar için bir çözüm önerisi sunarlar. Bu tasarım kalıpları, nesnelerin birbirleriyle etkileşimlerindeki davranışları ve işlemleri tanımlamaya yardımcı olur.

## Observer Pattern (İzleyici):
Bir nesnenin durumu değiştiğinde, bağımlı nesnelerin otomatik olarak güncellenmesini sağlar.
Örneğin, bir haber bülteni servisi, abonelerine düzenli olarak yeni haberler gönderir. Aboneler, haberleri almak için haber bültenine abone olur. Haber bülteni servisi, haberlerin güncellenmesi gibi bir olay meydana geldiğinde, abonelere haberlerin güncellemeleri hakkında bildirim gönderir.

```ruby
class NewsPublisher
  attr_reader :news
  
  def initialize
    @news = ""
    @subscribers = []
  end
  
  def add_subscriber(subscriber)
    @subscribers << subscriber
  end
  
  def delete_subscriber(subscriber)
    @subscribers.delete(subscriber)
  end
  
  def notify_subscribers
    @subscribers.each { |subscriber| subscriber.update(@news) }
  end
  
  def update_news(news)
    @news = news
    notify_subscribers
  end
end

class EmailSubscriber
  def update(news)
    puts "Sending email notification for: #{news}"
  end
end

class SMSSubscriber
  def update(news)
    puts "Sending SMS notification for: #{news}"
  end
end

publisher = NewsPublisher.new
email_subscriber = EmailSubscriber.new
sms_subscriber = SMSSubscriber.new
publisher.add_subscriber(email_subscriber)
publisher.add_subscriber(sms_subscriber)
publisher.update_news("This is the first news")
publisher.delete_subscriber(sms_subscriber)
publisher.update_news("This is the second news")
```

## Strategy Pattern (Strateji):
Belirli bir işlem için farklı stratejiler sağlar ve müşterinin seçimine göre kullanılır.
Örneğin, bir ödeme sistemine sahip bir e-ticaret sitesi, farklı ödeme yöntemlerini kullanıcılara sunar. Örneğin, kullanıcılar kredi kartı, banka havalesi veya PayPal gibi farklı ödeme yöntemlerini seçebilirler. Bu durumda, ödeme yöntemleri farklı stratejiler olarak tasarlanabilir.

```ruby
class PaymentStrategy
  def pay(amount)
    raise NotImplementedError, "Subclasses must implement the pay method"
  end
end

class CreditCardPaymentStrategy < PaymentStrategy
  def pay(amount)
    puts "Paying $#{amount} with credit card"
  end
end

class PayPalPaymentStrategy < PaymentStrategy
  def pay(amount)
    puts "Paying $#{amount} with PayPal"
  end
end

class BankTransferPaymentStrategy < PaymentStrategy
  def pay(amount)
    puts "Paying $#{amount} with bank transfer"
  end
end

class PaymentProcessor
  def initialize(strategy)
    @strategy = strategy
  end
  
  def set_strategy(strategy)
    @strategy = strategy
  end
  
  def pay(amount)
    @strategy.pay(amount)
  end
end

credit_card_strategy = CreditCardPaymentStrategy.new
paypal_strategy = PayPalPaymentStrategy.new
bank_transfer_strategy = BankTransferPaymentStrategy.new
payment_context = PaymentProcessor.new(credit_card_strategy)
payment_context.pay(100)
payment_context.set_strategy(paypal_strategy)
payment_context.pay(200)
payment_context.set_strategy(bank_transfer_strategy)
payment_context.pay(300)
```

## Template Method Pattern (Şablon Yöntemi):
Bir sürecin adımlarını tanımlayan bir süper sınıf belirler ve alt sınıfların bu adımları uygulamasını sağlar.
Örneğin, bir oyun motoru, oyun motorunu temel olarak tanımlayan bir süper sınıf belirler. Oyun geliştiricileri, bu süper sınıfı alt sınıflara genişleterek oyunlarını tasarlarlar. Oyun motoru, temel oyun işlevlerini tanımlayan adımları belirler ve alt sınıflar bu adımları uygular.

```ruby
class GameEngine
  def initialize
    # Temel oyun işlevlerini belirleyen adımlar
    start_game
    play_game
    end_game
  end

  def start_game
    raise NotImplementedError, 'start_game method must be implemented in sub classes'
  end

  def play_game
    raise NotImplementedError, 'play_game method must be implemented in sub classes'
  end

  def end_game
    raise NotImplementedError, 'end_game method must be implemented in sub classes'
  end
end

# Alt sınıflar
class MyGame < GameEngine
  def start_game
    puts "My Game is starting..."
  end

  def play_game
    puts "Playing My Game..."
  end

  def end_game
    puts "My Game is ending..."
  end
end

class AnotherGame < GameEngine
  def start_game
    puts "Another Game is starting..."
  end

  def play_game
    puts "Playing Another Game..."
  end

  def end_game
    puts "Another Game is ending..."
  end
end

# Kullanımı
my_game = MyGame.new
another_game = AnotherGame.new
```

## Chain of Responsibility Pattern (Sorumluluk Zinciri):
Bir isteği bir dizi nesne üzerinde işler ve bu nesnelerin hiyerarşik bir düzen içinde organize edilmesine izin verir.
Örneğin, bir destek talebi sistemine sahip bir şirket, talepleri ele almak için bir dizi destek görevlisi atar. Bir müşteri bir talep gönderdiğinde, talep görevlileri talebi sırayla ele alır. Talep, bir görevli tarafından ele alınmazsa, bir sonraki görevliye yönlendirilir.
Bu örneğe olarak olarak ruby'de state machine kullanabiliriz, https://github.com/state-machines/state_machines

```ruby
class SupportRequest
  attr_reader :message

  def initialize(message)
    @message = message
  end
end

class SupportHandler
  attr_accessor :next_handler

  def initialize(next_handler = nil)
    @next_handler = next_handler
  end

  def handle(request)
    if can_handle(request)
      process_request(request)
    elsif @next_handler
      @next_handler.handle(request)
    else
      raise "No handler found for this request"
    end
  end

  def can_handle(request)
    raise NotImplementedError, 'Subclasses must implement this method'
  end

  def process_request(request)
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

class LevelOneSupportHandler < SupportHandler
  def can_handle(request)
    request.message.include?("Level 1")
  end

  def process_request(request)
    puts "Level One support handling the request: #{request.message}"
  end
end

class LevelTwoSupportHandler < SupportHandler
  def can_handle(request)
    request.message.include?("Level 2")
  end

  def process_request(request)
    puts "Level Two support handling the request: #{request.message}"
  end
end

class LevelThreeSupportHandler < SupportHandler
  def can_handle(request)
    request.message.include?("Level 3")
  end

  def process_request(request)
    puts "Level Three support handling the request: #{request.message}"
  end
end

# Kullanımı
level1 = LevelOneSupportHandler.new
level2 = LevelTwoSupportHandler.new(level1)
level3 = LevelThreeSupportHandler.new(level2)

request1 = SupportRequest.new("I need help with Level 2 issue")
request2 = SupportRequest.new("I need help with Level 3 issue")
request3 = SupportRequest.new("I need help with Level 4 issue")

level3.handle(request1)
level3.handle(request2)
level3.handle(request3)
```

## Command Pattern (Komut):
Bir isteği nesneye bir komut nesnesi aracılığıyla gönderir ve nesne bu komutu uygular.
Örneğin, bir metin editörü, kullanıcının metin dosyalarını kaydetme veya yazdırma gibi işlemleri için komutlar sağlar. Kullanıcı, bu komutları arayüz aracılığıyla tetikleyebilir ve metin editörü bu komutları uygular.

```ruby
class TextEditor
  def initialize
    @commands = []
  end

  def execute_command(command)
    @commands << command
    command.execute
  end

  def undo_last_command
    if @commands.empty?
      puts "No command to undo"
    else
      command = @commands.pop
      command.undo
    end
  end
end

class TextCommand
  def initialize(text_editor)
    @text_editor = text_editor
  end

  def execute
    raise NotImplementedError, 'Subclasses must implement this method'
  end

  def undo
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

class SaveCommand < TextCommand
  def execute
    puts "Saving the file..."
    # Do the saving
  end

  def undo
    puts "Undoing the save..."
    # Undo the saving
  end
end

class PrintCommand < TextCommand
  def execute
    puts "Printing the file..."
    # Do the printing
  end

  def undo
    puts "Undoing the print..."
    # Undo the printing
  end
end

# Kullanımı
text_editor = TextEditor.new
save_command = SaveCommand.new(text_editor)
print_command = PrintCommand.new(text_editor)

text_editor.execute_command(save_command)
text_editor.execute_command(print_command)

text_editor.undo_last_command # prints "Undoing the print..."
text_editor.undo_last_command # prints "Undoing the save..."
```

## Iterator Pattern (Yineleyici):
Bir koleksiyondaki öğelere erişmek için bir arayüz sağlar.
Örneğin, bir müşteri listesi, bir dizi müşteri bilgisini içerir. Bir müşteri listesi nesnesi, müşterileri tek tek listelemek için bir iterator sağlar.

```ruby
class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class CustomerList
  def initialize(customers)
    @customers = customers
  end

  def each(&block)
    @customers.each(&block)
  end
end

# Kullanımı
customers = [
  Customer.new("Alice"),
  Customer.new("Bob"),
  Customer.new("Charlie")
]

customer_list = CustomerList.new(customers)

customer_list.each do |customer|
  puts customer.name
end
```

## Mediator Pattern (Aracı):
Bir nesnenin diğer nesnelerle doğrudan etkileşimini azaltarak, nesneler arasında iletişim kurar.
Örneğin, bir sohbet uygulaması, kullanıcıların diğer kullanıcılarla sohbet etmesine izin verir. Kullanıcılar, diğer kullanıcılarla doğrudan etkileşim kurmak yerine, sohbet uygulaması aracılığıyla iletişim kurarlar.

```ruby
class ChatRoom
  def initialize
    @users = []
  end

  def add_user(user)
    @users << user
  end

  def send_message(from_user, to_user, message)
    to_user.receive_message(from_user, message)
  end
end

class User
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def send_message(to_user, message)
    @chat_room.send_message(self, to_user, message)
  end

  def receive_message(from_user, message)
    puts "#{from_user.name} -> #{name}: #{message}"
  end

  def join_chat_room(chat_room)
    @chat_room = chat_room
    chat_room.add_user(self)
  end
end

# Kullanımı
chat_room = ChatRoom.new

alice = User.new("Alice")
bob = User.new("Bob")
charlie = User.new("Charlie")

alice.join_chat_room(chat_room)
bob.join_chat_room(chat_room)
charlie.join_chat_room(chat_room)

alice.send_message(bob, "Merhaba Bob!")
bob.send_message(alice, "Selam Alice!")
charlie.send_message(alice, "Nasılsın Alice?")
```

## Memento Pattern (Anı):
Bir nesnenin önceki durumlarını kaydederek, geri alma işlevselliği sağlar.
Örneğin, bir kelime işlemci, kullanıcının belgede yaptığı değişiklikleri kaydeder ve kullanıcı, bir değişikliği geri almak istediğinde belgenin önceki bir durumunu geri yükleyebilir.

```ruby
class Editor
  attr_accessor :content

  def initialize(content)
    @content = content
  end

  def create_checkpoint
    # Returns a new Memento object containing the current state of the Editor
    Memento.new(@content)
  end

  def restore_checkpoint(memento)
    # Restores the state of the Editor to that of the given Memento object
    @content = memento.state
  end
end

class Memento
  attr_reader :state

  def initialize(state)
    @state = state
  end
end

# Create a new Editor with some initial content
editor = Editor.new("Hello, world!")
# Create a checkpoint and save it to a variable
checkpoint = editor.create_checkpoint()
# Make some changes to the Editor's content
editor.content = "Goodbye, cruel world!"
# Oops, we want to go back to the previous content
editor.restore_checkpoint(checkpoint)
# The Editor's content has been restored to its previous state
puts editor.content
# Output: "Hello, world!"
```

## State Pattern (Durum):
Bir nesnenin durumunu değiştiren bir dizi davranış sağlar ve nesne durumundaki değişikliklere göre farklı davranışlar sergiler.
Örneğin, bir kahve makinesi, durumuna göre farklı davranışlar sergiler. Örneğin, kahve makinesi, kahve yapmak istediğimizde, kahve yapım moduna geçer ve bu modda sıcak suyu çeker ve kahve yapar. Aynı şekilde, sıcak su yapmak istediğimizde, sıcak su yapım moduna geçer ve sadece sıcak suyu çeker.

```ruby
class CoffeeMachine
  attr_accessor :state

  def initialize
    @state = HeatingState.new
  end

  def make_coffee
    @state.make_coffee
  end

  def make_hot_water
    @state.make_hot_water
  end
end

class State
  def make_coffee
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def make_hot_water
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class HeatingState < State
  def make_coffee
    puts "Coffee is being made."
  end

  def make_hot_water
    puts "Hot water is being made."
  end
end

class IdleState < State
  def make_coffee
    puts "Coffee cannot be made while the machine is idle."
  end

  def make_hot_water
    puts "Hot water is being made."
  end
end

coffee_machine = CoffeeMachine.new

coffee_machine.make_coffee
coffee_machine.make_hot_water

coffee_machine.state = IdleState.new

coffee_machine.make_coffee
coffee_machine.make_hot_water
```

## Visitor Pattern (Ziyaretçi):
Bir nesneyi tanımlayan sınıftan bağımsız olarak bir işlevi uygular ve nesneye yeni işlevler eklemeyi kolaylaştırır.
Örneğin, bir şekil çizme uygulaması, kullanıcının farklı şekiller oluşturmasına izin verir. Şekiller, farklı alanları ve çevreleri hesaplamak için bir ziyaretçi nesnesine kabul edilebilir. Örneğin, bir kare ve bir daire, alan ve çevreyi hesaplamak için aynı ziyaretçi nesnesini kullanabilir.

```ruby
# Şekil arayüzü
class Shape
  def accept(visitor)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Kare sınıfı
class Square < Shape
  def initialize(side)
    @side = side
  end
  
  def area
    @side * @side
  end
  
  def perimeter
    4 * @side
  end
  
  def accept(visitor)
    visitor.visit_square(self)
  end
end

# Daire sınıfı
class Circle < Shape
  def initialize(radius)
    @radius = radius
  end
  
  def area
    Math::PI * @radius * @radius
  end
  
  def perimeter
    2 * Math::PI * @radius
  end
  
  def accept(visitor)
    visitor.visit_circle(self)
  end
end

# Ziyaretçi arayüzü
class Visitor
  def visit_square(square)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
  
  def visit_circle(circle)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Alan hesaplama ziyaretçisi
class AreaVisitor < Visitor
  def visit_square(square)
    puts "Kare alanı: #{square.area}"
  end
  
  def visit_circle(circle)
    puts "Daire alanı: #{circle.area}"
  end
end

# Çevre hesaplama ziyaretçisi
class PerimeterVisitor < Visitor
  def visit_square(square)
    puts "Kare çevresi: #{square.perimeter}"
  end
  
  def visit_circle(circle)
    puts "Daire çevresi: #{circle.perimeter}"
  end
end

# Şekil listesi
shapes = [
  Square.new(5),
  Circle.new(2),
  Square.new(3),
  Circle.new(4),
  Square.new(6)
]

# Alan hesaplama ziyaretçisi uygulanıyor
area_visitor = AreaVisitor.new
shapes.each { |shape| shape.accept(area_visitor) }

# Çevre hesaplama ziyaretçisi uygulanıyor
perimeter_visitor = PerimeterVisitor.new
shapes.each { |shape| shape.accept(perimeter_visitor) }
```
