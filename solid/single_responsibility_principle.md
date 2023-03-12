# Single Responsibility Principle (Tek Sorumluluk Prensibi)

Single Responsibility Prensibi (SRP), SOLID prensiplerinin bir parçasıdır ve bir sınıfın sadece bir sorumluluğu olması gerektiğini önerir.
Bir sınıfın sadece bir işlevi olması, kodun daha okunaklı, bakımı daha kolay ve yeniden kullanılabilir olmasını sağlar.

#######
```ruby
# Kötü örnek - Sınıfın birden fazla sorumluluğu var
class User
  def initialize(name, email)
    @name = name
    @email = email
  end

  def send_email(subject, message)
    # Email gönderme kodu
  end

  def save_to_database
    # Veritabanına kaydetme kodu
  end
end
```
#######

Bu örnekte, User sınıfı, hem e-posta gönderme hem de veritabanına kaydetme işlevlerini yerine getiriyor.
Bu, sınıfın SRP prensibine uymadığı anlamına gelir.

#######
```ruby
# İyi örnek - Sınıfın sadece bir sorumluluğu var
class User
  def initialize(name, email)
    @name = name
    @email = email
  end

  def send_email(subject, message)
    # Email gönderme kodu
  end
end

class UserRepository
  def save(user)
    # Veritabanına kaydetme kodu
  end
end
```
#######

Bu örnekte, User sınıfı sadece bir sorumluluğa sahiptir, yani e-posta gönderme işlevini yerine getirir.
Veritabanına kaydetme işlevi, ayrı UserRepository sınıfında gerçekleştirilir.
Bu, sınıfların SRP prensibine uyması anlamına gelir.
Bu yapı, her sınıfın sadece kendi sorumluluğuyla ilgilenmesini ve değişikliklerin tek bir yerde yapılmasını sağlar.
