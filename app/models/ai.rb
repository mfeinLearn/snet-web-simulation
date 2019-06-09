class Ai < ApplicationRecord
belongs_to :user
has_many :transactions
has_many :services, through: :transactions

validates :name, :description, presence: true 
end
