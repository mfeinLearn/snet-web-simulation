class Transaction < ApplicationRecord
  belongs_to :ai
  belongs_to :service
#  belongs_to :user, through: :ai

  def done_transaction
    # self.status
    # sleep(1.minutes)
    #@transaction = Transaction.find_by(id: params[:id])
    self.status = "true"
  end
end
