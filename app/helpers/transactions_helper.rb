module TransactionsHelper
  def transaction_completed?(transaction)
    if transaction.status==true
      content_tag(:h4, "This transaction is completed! Thank you! I hope you enjoyed your AI!")
    end
  end
end
