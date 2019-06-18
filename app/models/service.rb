class Service < ApplicationRecord
has_many :transactions
has_many :ais, through: :transactions
has_many :users, through: :ais
end
#user -< ai -<Transaction >- service
