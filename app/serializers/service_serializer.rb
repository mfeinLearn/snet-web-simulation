class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price
  has_many :transactions
  has_many :ais, through: :transactions
  has_many :users, through: :ais
end
