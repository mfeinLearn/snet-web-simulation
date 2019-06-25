class Service < ApplicationRecord
has_many :transactions
has_many :ais, through: :transactions
has_many :users, through: :ais

 validates :name, presence: true
 validates :description, presence: true
 validates :price, presence: true

def use
  if self.users[0].data - self.price < self.users[0].data
    return "please get more data!"
  else
    result = self.users[0].data - self.price
    return "this is the result #{result}!"
  #return "The service is in use"
  end
end

end
#user -< ai -<Transaction >- service
