class TransactionsController < ApplicationController

  def show
    @transaction = Transaction.find_by(id: params[:id])

  end

  def update

    @transaction = Transaction.find_by(id: params[:id])
    if @transaction.status == nil
      @transaction.done_transaction
      @transaction.save
      #byebug
      redirect_to ai_services_path(@transaction.ai)
    else
      redirect_to transaction_path(@transaction)
    end
  end


end
