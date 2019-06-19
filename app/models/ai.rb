class Ai < ApplicationRecord
belongs_to :user
has_many :transactions
has_many :services, through: :transactions

validates :name, :description, presence: true

accepts_nested_attributes_for :services

  scope :order_by_ais, -> {order(balance: :desc)}

  def name_and_balance # a reader method to display flavor and brand
  "Name: #{name} - Balance: #{balance}"
  end

end
