# Bounded Context: Customer Management
# Domain Model: Customer

class Customer
  attr_accessor :id, :name, :email, :address
  
  def initialize(id, name, email, address)
    @id = id
    @name = name
    @email = email
    @address = address
  end
end

class CustomerRepository
  def initialize
    @customers = []
  end
  
  def save(customer)
    @customers << customer
  end
  
  def find_by_id(id)
    @customers.find { |customer| customer.id == id }
  end
end
