class User < ApplicationRecord
  has_secure_password
  has_many :ais
  has_many :transactions, through: :ais
  has_many :services, through: :transactions

  validates :name, presence: true
  validates :name, uniqueness: true

  # def increase_data
  #   self.increment_counter(:data, 1)
  # end
  #
  # def add_data
  #   self.increment(:data, 1)
  #   self.save
  #   # self.update(:data => self.data += 1)
  #   # return "+1"
  # end
  # def add_data2
  #   self.increment(:data, 1)
  #   self.save
  #   # self.update(:data => self.data += 1)
  #   # return "+1"
  # end
  # def add_data3
  #   self.increment(:data, 1)
  #   self.save
  #   # self.update(:data => self.data += 1)
  #   # return "+1"
  # end

  def self.create_by_github_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      # SecureRandom.hex - creates a random password for you
      u.password = SecureRandom.hex
    end
  end

end






#binding.pry
# if data != nil
#   if data > 5
#     return "Good to go!"
#   else
#     return "Sorry"
#   end
# end
