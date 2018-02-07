class OrdersController < ApplicationController

  def create
    from_symbol = params[:order][:from_symbol]
    to_symbol   = params[:order][:to_symbol]
    amount      = params[:order][:amount].to_f

    current_USD = current_user.portfolio.find_by_currency("USD").amount
    current_BTC = current_user.portfolio.find_by_currency("BTC").amount

    current_BTC_price = getBTCPrice()
    
    # Values can't be negative
    if amount < 0 
      flash[:danger] = "Invalid amount #{amount}."
      redirect_to root_path
      return
    end
    
    # Check if from and to are the same
    if from_symbol.eql? to_symbol
      flash[:danger] = "Invalid order from #{from_symbol} to #{to_symbol}."
      redirect_to root_path
      return
    end
    
    # Check if there is enough money
    if from_symbol.eql? "USD" 
      if amount > current_USD  
        flash[:danger] = "Your USD is not enough."
        redirect_to root_path
        return
      end
    else
      if amount > current_BTC 
        flash[:danger] = "Your BTC is not enough."
        redirect_to root_path
        return
      end
    end

    @order = Order.new(user_id: current_user.id,
                       from_symbol: from_symbol,
                       to_symbol: to_symbol,
                       amount: amount)
    if @order.save
      flash[:success] = "You complete an order"

      if from_symbol.eql? "USD" 
        new_USD = current_USD - amount
        new_BTC = current_BTC + amount / current_BTC_price
      else
        new_BTC = current_BTC - amount
        new_USD = current_USD + amount * current_BTC_price
      end
      portfolio_USD = Portfolio.find_by(user_id: current_user.id, currency: "USD")
      portfolio_USD.amount = new_USD
      portfolio_USD.save!
      portfolio_BTC = Portfolio.find_by(user_id: current_user.id, currency: "BTC")
      portfolio_BTC.amount = new_BTC
      portfolio_BTC.save!

      redirect_to root_path
    else
      flash[:danger] = "There is some error"
      redirect_to root_path
    end
  end
end
