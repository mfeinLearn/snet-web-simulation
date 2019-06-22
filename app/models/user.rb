class User < ApplicationRecord
  has_secure_password
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
