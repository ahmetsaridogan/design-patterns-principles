# DDD (Domain-Driven Design) Nedir?

DDD (Domain-Driven Design), bir yazılım geliştirme yaklaşımıdır. Bu yaklaşım, karmaşık bir iş alanını anlamaya, bu iş alanındaki kuralları ve süreçleri tasarlamaya ve bu iş alanındaki süreçleri ve verileri etkin bir şekilde yönetmeye yardımcı olur.

## Domain Model: 
Bir uygulamanın iş mantığının merkezinde yer alan nesnelerin ve kavramların bir modellemesidir. 

#### Örneğin;
Bir e-ticaret uygulaması için, bir Domain Modeli, ürünler, müşteriler, siparişler vb. gibi nesneleri içerebilir. 
Domain Modeli, bir iş alanındaki gereksinimleri anlamak ve doğru şekilde tasarlamak için kullanılır.

## Ubiquitous Language:
Bir iş alanında kullanılan terimlerin ve kavramların birleştirilmiş bir dilidir. 

#### Örneğin
Bir e-ticaret uygulamasında, "sepet", "ürün", "müşteri" vb. terimleri kullanılabilir. Ubiquitous Language, bir iş alanındaki tüm paydaşlar tarafından anlaşılabilir ve kullanılabilir olmalıdır.

## Bounded Context:
Bir iş alanındaki belirli bir bölümün kapsamını belirleyen bir sınırlayıcıdır. 

#### Örneğin
Bir e-ticaret uygulamasında, "ürünler" Bounded Context'ine sahip bir modül olabilir. Bu modül, ürünlerin yönetimi ile ilgilenir ve müşterilerle ilgili modülden ayrı bir şekilde tasarlanır.

## Aggregate;
Birbirleriyle ilişkili nesnelerin birleştirildiği bir yapıdır. 

#### Örneğin
Bir e-ticaret uygulamasında, bir "sipariş" Aggregate'ı, müşteri, ürün ve ödeme gibi farklı nesneleri içerebilir. Aggregate'lar, bir işlem için bir bütünlük sağlar ve verilerin doğru bir şekilde yönetilmesine yardımcı olur

## Entity:
Bir Aggregate'ın içinde yer alan nesnelerdir. Entity, bir Aggregate'ın içinde benzersiz bir nesnedir.

#### Örneğin
Bir e-ticaret uygulamasında, bir "ürün" Aggregate'ı, ürün ID'si ve özellikleri olan benzersiz bir nesnedir.

## Repository;
Verilerin depolanması ve yönetilmesi için kullanılan bir yapıdır.

#### Örneğin
Bir e-ticaret uygulamasında, bir "ürün" Repository'si, ürünlerin depolanmasına ve yönetilmesine yardımcı olabilir.

## Value Object:
Bir Aggregate'ın içinde yer alan nesnelerdir. Value Object, bir Aggregate'ın içinde benzersiz bir nesne değildir.

#### Örneğin
Bir e-ticaret uygulamasında, bir "stok" Value Object'i, renk, beden ve fiyat gibi özelliklere sahip olabilir.

## Özetle
* Domain Model: Ürün, Müşteri, Sipariş, Ödeme gibi nesnelerin bir modellemesi.
* Ubiquitous Language: Sepet, Ürün, Müşteri, Sipariş gibi terimlerin kullanımı.
* Bounded Context: Ürünler, Siparişler, Müşteriler gibi farklı modüllerin oluşturulması
* Aggregate: Sipariş Aggregate'ı, müşteri, ürün ve ödeme gibi farklı nesneleri içerir.
* Entity: Bir Ürün Entity'si, ürün ID'si ve özellikleri olan benzersiz bir nesnedir.
* Repository: Ürünlerin depolanması ve yönetilmesi için bir "ürün" Repository'si kullanılabilir.
* Value Object: Bir stok Value Object'i, renk, beden ve fiyat gibi özelliklere sahip olabilir.


Örneğin, "sipariş" Aggregate'ı için, "müşteri" ve "ürün" nesneleri birleştirilerek bir bütünlük sağlanır. Bu Aggregate, bir müşterinin bir veya daha fazla ürün siparişi verdiği bir işlemi temsil eder. Bu Aggregate'ı yönetmek için bir "sipariş" Repository'si oluşturulabilir. Bu Repository, siparişlerin depolanması, yönetilmesi ve işlenmesi için kullanılabilir.

Bir "ürün" Repository'si ise, ürünlerin depolanması, güncellenmesi, silinmesi ve okunması için kullanılabilir. Ürünlerin bir ID'si, adı, fiyatı, açıklaması gibi özellikleri bu Repository üzerinden yönetilebilir.

Bu örnekte, Bounded Context'ler de kullanılmıştır. Ürünler, müşteriler ve siparişler için ayrı ayrı Bounded Context'ler oluşturulmuştur. Bu sayede, her bir Bounded Context için farklı bir Domain Model tasarlanabilir ve her Bounded Context kendi içinde yönetilebilir hale gelir.

DDD yaklaşımı, bir iş alanının karmaşıklığını azaltmaya ve doğru şekilde yönetmeye yardımcı olur. Domain Model, Ubiquitous Language, Bounded Context, Aggregate ve Repository gibi kavramlar, bir iş alanının tasarımı ve yönetimi için önemli araçlardır.

### Ürün Aggregate'i örneği
```ruby
class Product
  attr_reader :id, :name, :price, :description
  
  def initialize(id, name, price, description)
    @id = id
    @name = name
    @price = price
    @description = description
  end
end
```
Bu örnekte, Product sınıfı bir "ürün" Aggregate'ini temsil eder. Sınıfın constructor'ı, ürünün ID'si, adı, fiyatı ve açıklaması gibi özellikleri alır ve bu özellikleri sınıfın özelliklerine atar.

### Bu Aggregate'i yönetmek için bir "ürün" Repository'si 
```ruby
class ProductRepository
  def initialize
    @products = []
  end
  
  def add(product)
    @products << product
  end
  
  def find_by_id(id)
    @products.find { |product| product.id == id }
  end
  
  def update(product)
    index = @products.find_index { |p| p.id == product.id }
    @products[index] = product if index
  end
  
  def delete(product)
    @products.delete(product)
  end
end
```

Bu örnekte, ProductRepository sınıfı, "ürün" Aggregate'lerini depolamak ve yönetmek için kullanılır. Constructor'ı, bir dizi "ürün" Aggregate'ini depolamak için boş bir dizi oluşturur.

Sınıfın add, find_by_id, update ve delete metodları, Repository'ye "ürün" Aggregate'leri eklemek, ID'leriyle birlikte "ürün" Aggregate'lerini bulmak, "ürün" Aggregate'lerini güncellemek ve silmek için kullanılabilir.

Bu örnekte, Domain Model, Repository ve Bounded Context gibi DDD kavramları kullanılarak, bir e-ticaret uygulamasında ürünlerin yönetimi için bir yapı oluşturulabilir.


### Ürünleri listeleyelim
```ruby
class ProductsController
  def index
    products = product_repository.all
    # products listesi ile ilgili işlemler yapılabilir
  end
  
  private
  
  def product_repository
    @product_repository ||= ProductRepository.new
  end
end
```

# Bounded Context
Buna ek olarak Ubiquitous Language ve Bounded Context kavramlarının da nasıl uygulayabileceğimizi gösterelim

#### Örneğin
Bir e-ticaret uygulamasında "ürün" terimi, birçok farklı Bounded Context içinde kullanılabilir. 
Bu nedenle, her Bounded Context için "ürün" teriminin farklı bir anlamı olabilir.

```ruby
module Catalog
  class Product
    # ...
  end
  
  class ProductRepository
    # ...
  end
end

module Order
  class Product
    # ...
  end
  
  class ProductRepository
    # ...
  end
end
```

Bu örnekte, Catalog ve Order modülleri, iki farklı Bounded Context'i temsil eder. 

Catalog modülü, bir e-ticaret sitesindeki ürünlerin listesi gibi bir Bounded Context'i temsil ederken, 
Order modülü, bir e-ticaret sitesindeki sipariş işlemleri gibi bir Bounded Context'i temsil eder.

Her Bounded Context için, "ürün" terimi farklı bir anlam taşıyan ayrı Product sınıfları ve ProductRepository sınıfları oluşturduk. 
Bu şekilde, her Bounded Context için Ubiquitous Language kullanılarak, her terimin belirli bir anlamı olur ve Bounded Context'ler arasındaki iletişim daha net hale gelir.

Bu örnekle, DDD yaklaşımının ne kadar esnek ve uyarlanabilir olduğunu görebiliriz. Bounded Context kavramı, farklı Bounded Context'ler arasında net bir sınır çizerek, bir iş alanının daha iyi yönetilmesine yardımcı olurken, Ubiquitous Language kavramı, farklı Bounded Context'ler arasındaki iletişimi daha anlaşılır hale getirir.
