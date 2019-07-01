class Ai < ApplicationRecord
belongs_to :user
has_many :transactions
has_many :services, through: :transactions

validates :name, :description,:balance, presence: true

accepts_nested_attributes_for :transactions


  scope :order_by_ais, -> {order(balance: :desc)}
  scope :order_by_price, -> {joins(:services).group(:id).order('avg(price)')}

  def name_and_balance # a reader method to display flavor and brand
  "#{name} - #{balance}"
  end

end
