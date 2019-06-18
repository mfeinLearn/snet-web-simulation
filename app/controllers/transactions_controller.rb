class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.find_by(id: params[:id])
    raise @transaction.inspect
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    
  end


end
