class Service < ApplicationRecord
has_many :transactions
has_many :ais, through: :transactions
has_many :users, through: :ais

 validates :name, presence: true
 validates :description, presence: true
 validates :price, presence: true
order(balance: :desc)
scope :order_by_price, -> {order(price: :asc)}

scope :search_by_name, -> (search_name){where("name = ?", search_name)}


def use
  if self.current_user.data - self.price < self.current_user.data
    return "please get more data!"
  else
    result = self.users[0].data - self.price
    return "this is the result #{result}!"
  #return "The service is in use"
  end
end

def self.search(search)
  if search
    where(["name LIKE ?","%#{search}%"])
  else
    all
  end
end

end
#user -< ai -<Transaction >- service
