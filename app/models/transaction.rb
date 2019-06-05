class Transaction < ApplicationRecord
  belongs_to :ai
  belongs_to :service
  belongs_to :user, through: :ai
end
