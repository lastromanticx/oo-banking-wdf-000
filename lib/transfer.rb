class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? and @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."  
    elsif @status == "complete"
    else
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
