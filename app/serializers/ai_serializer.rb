class AiSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :description, :balance
  belongs_to :user
  has_many :transactions
  has_many :services, through: :transactions
end
