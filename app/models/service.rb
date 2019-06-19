class Service < ApplicationRecord
has_many :transactions
has_many :ais, through: :transactions
has_many :users, through: :ais

 validates :name, presence: true
 validates :description, presence: true
 validates :price, presence: true
end
#user -< ai -<Transaction >- service
