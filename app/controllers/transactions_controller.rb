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
    #byebug
    @transaction = Transaction.last
    #@ai = Ai.find_by(id: params[:id])
    #@service = Service.find_by(id: params[:id])
#byebug
  end

  def edit
    @transaction = Transaction.find_by(id: params[:id])

  end

  def update
#byebug
    @transaction = Transaction.find_by(id: params[:id])
    if @transaction.status == nil
      @transaction.done_transaction
      @transaction.save
      #byebug
      redirect_to transaction_path(@transaction.ai)
    else
      redirect_to edit_transaction_path(@transaction)
    end
  end




end
