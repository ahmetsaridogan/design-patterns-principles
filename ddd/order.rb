# Bounded Context: Order Management
# Domain Model: Order, OrderItem

class OrderItem
  attr_accessor :product_name, :quantity, :price
  
  def initialize(product_name, quantity, price)
    @product_name = product_name
    @quantity = quantity
    @price = price
  end
end

class Order
  attr_accessor :id, :customer_id, :order_items
  
  def initialize(id, customer_id, order_items)
    @id = id
    @customer_id = customer_id
    @order_items = order_items
  end
  
  def total_price
    @order_items.sum { |item| item.quantity * item.price }
  end
end

class OrderRepository
  def initialize
    @orders = []
  end
  
  def save(order)
    @orders << order
  end
  
  def find_by_id(id)
    @orders.find { |order| order.id == id }
  end
  
  def find_by_customer_id(customer_id)
    @orders.select { |order| order.customer_id == customer_id }
  end
end
