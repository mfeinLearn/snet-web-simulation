class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find_by(id: params[:id])
  end
end
