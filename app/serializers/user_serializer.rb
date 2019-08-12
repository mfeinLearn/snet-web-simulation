class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :data
  has_many :ais
  has_many :transactions, through: :ais
  has_many :services, through: :transactions
end
