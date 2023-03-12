# Usage

# Bu örnek, DDD prensiplerine uygun olarak tasarlanmıştır. `Customer` ve `Order` sınıfları, 
# Bounded Context'lerin domain modellerini temsil ederken, `CustomerRepository` ve `OrderRepository`
# sınıfları, bu modellerin veri depolama katmanını oluşturur. 
# `PlaceOrderService` ise, uygulamanın işlevselliğini temsil eden bir
# Uygulama servisi `execute` yöntemi aracılığıyla, bir müşterinin sipariş vermesini sağlar.
# Bu yöntem, gelen müşteri kimliği ve ürün ayrıntılarına dayalı olarak, bir sipariş oluşturur ve 
# bunu `OrderRepository`'de kaydeder.

# Bu örnekteki kod, DDD prensiplerine uygun olarak ayrılmış katmanlara sahip bir uygulama için bir örnektir.
# Her bir katman, belirli bir sorumluluğu üstlenir ve diğer katmanlarla etkileşim kurar. 
# Bu, uygulamanın daha kolay anlaşılmasını ve bakımını sağlar. 
# Ayrıca, domain modeli, repository ve servis sınıfları gibi DDD kavramları, 
# uygulamanın sadece o alanda uzman olan kişiler tarafından tasarlanmasını ve geliştirilmesini sağlar.

require_relative "customer"
require_relative "order"
require_relative "place_order"

customer_repository = CustomerRepository.new
order_repository = OrderRepository.new

customer = Customer.new(1, "John Smith", "john@example.com", "123 Main St.")
customer_repository.save(customer)

place_order_service = PlaceOrderService.new(customer_repository, order_repository)
order = place_order_service.execute(
  customer.id,
  [
    { product_name: "Product 1", quantity: 2, price: 10.0 },
    { product_name: "Product 2", quantity: 1, price: 20.0 }
  ]
)

puts "Order ID: #{order.id}, Total Price: #{order.total_price}"
