# Dependency Inversion Principle (Bağımlılıkların Tersine Çevrilmesi Prensibi)

Dependency Inversion Prensibi (DIP), SOLID prensiplerinin bir parçasıdır ve yüksek seviyeli modüllerin düşük seviyeli modüllere doğrudan bağımlı olmaması, ancak aralarında soyutlamaların kullanılması gerektiğini önerir.
Bu prensip, uygulamaların daha esnek, yeniden kullanılabilir ve bakımı daha kolay hale getirilmesine yardımcı olur.


#######
```ruby
# Kötü örnek - Yüksek seviyeli modül düşük seviyeli modüle doğrudan bağımlıdır
class Report
  def initialize(data)
    @data = data
    @formatter = CsvFormatter.new
  end

  def generate
    @formatter.format(@data)
  end
end

class CsvFormatter
  def format(data)
    data.map { |row| row.join(',') }.join("\n")
  end
end
```
#######

Bu örnekte, Report sınıfı doğrudan CsvFormatter sınıfına bağımlıdır.
Bu, yüksek seviyeli bir modül olan Report'ın düşük seviyeli bir modül olan CsvFormatter'ı değiştirmesi veya başka bir çıktı biçimi kullanması zor olduğu anlamına gelir.

#######
```ruby
# İyi örnek - Yüksek seviyeli modül düşük seviyeli modüle arayüz aracılığıyla bağımlıdır
class Report
  def initialize(data, formatter)
    @data = data
    @formatter = formatter
  end
  
  def generate
    @formatter.format(@data)
  end
end

module Formatter
  def format(data)
    raise NotImplementedError
  end
end

class CsvFormatter
  include Formatter
  
  def format(data)
    data.map { |row| row.join(',') }.join("\n")
  end
end

class JsonFormatter
  include Formatter
  
  def format(data)
    JSON.generate(data)
  end
end
#######
```

Bu örnekte, Report sınıfı, Formatter arayüzünü uygulayan herhangi bir sınıfı kullanabilir.
Bu, Report sınıfının CsvFormatter yerine başka bir çıktı biçimi kullanması gerektiğinde daha esnek olmasını sağlar.
Ayrıca, herhangi bir yeni formatter eklendiğinde, Report sınıfı üzerinde değişiklik yapmadan kullanılabilir.
Bu, kodun bakımını daha kolay hale getirir ve yeniden kullanılabilirliği arttırır.
