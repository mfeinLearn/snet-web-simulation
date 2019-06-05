class User < ApplicationRecord
  has_secure_password
  has_many :ais
  has_many :transactions, through: :ais
  has_many :services, through: :transactions

  # comeback!!!!
  # def some_data
  #   #binding.pry
  #   if data != nil
  #     if data > 5
  #       return "Good to go!"
  #     else
  #       return "Sorry"
  #     end
  #   end
  # end

end
