class TransactionsController < ApplicationController
  def new
    @transaction =Transaction.new
  end

  def create

    @transaction = Transaction.create(
      service_id: params[:transaction][:service_id],
      status: params[:transaction][:status],
      ai_id: params[:transaction][:ai_id])
      #raise @transaction.inspect
    redirect_to transaction_path(@transaction)
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    #byebug
    #@ai = Ai.find_by(id: params[:id])
    #@service = Service.find_by(id: params[:id])
#byebug
  end

  def update
#byebug
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
