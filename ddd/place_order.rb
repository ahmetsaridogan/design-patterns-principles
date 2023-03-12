# Application Service: PlaceOrder

class PlaceOrderService
  def initialize(customer_repository, order_repository)
    @customer_repository = customer_repository
    @order_repository = order_repository
  end
  
  def execute(customer_id, order_items)
    customer = @customer_repository.find_by_id(customer_id)
    if customer.nil?
      raise ArgumentError.new("Invalid customer id")
    end
    
    order = Order.new(
      SecureRandom.uuid,
      customer_id,
      order_items.map { |item| OrderItem.new(item[:product_name], item[:quantity], item[:price]) }
    )
    
    @order_repository.save(order)
    order
  end
end
