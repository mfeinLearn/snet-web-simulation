def create
  @ai = current_user.ais.build(ai_params)
  if current_user.data > 220
    stuff
  else
    return "sorry bro!"
  end
end


def stuff
  if params[:ai][:transactions_attributes]["0"][:service_id] != ""
       @ai.save
       @transaction = @ai.transactions.last
       @transaction.service_id = params[:ai][:transactions_attributes]["0"][:service_id]
       @transaction.save
      redirect_to edit_transaction_path(@transaction)
  else
    if @ai.save!
      redirect_to new_transaction_path
    else
      render :new
    end
  end
end
