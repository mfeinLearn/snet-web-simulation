class User < ApplicationRecord
  has_secure_password # sets a validation for
  # password is true
  # :password, presence: true - this is already built into has_secure_password
# the password would be hashed and salted befor it hits the database
  has_many :ais
  has_many :transactions, through: :ais
  has_many :services, through: :transactions

  validates :name, presence: true
  validates :name, uniqueness: true


  def self.create_by_github_omniauth(auth)
    self.find_or_create_by(uid: auth[:info][:email]) do |u|
      # SecureRandom.hex - creates a random password for you
      u.name = [:extra][:raw_info][:login]
      u.uid = [:extra][:raw_info][:id]
      u.password = SecureRandom.hex
    end
  end

end
