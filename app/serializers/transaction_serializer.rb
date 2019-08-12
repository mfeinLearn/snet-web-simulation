class TransactionSerializer < ActiveModel::Serializer
  attributes :id , :status, :service_id, :ai_id
  belongs_to :ai
  belongs_to :service
end
