class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to CryptoTrader!"

      # Create allocation for USD and BTC for user
      portfolio_btc = Portfolio.new(user_id: @user.id, currency: "BTC", amount: 0.0)
      portfolio_btc.save
      portfolio_usd = Portfolio.new(user_id: @user.id, currency: "USD", amount: 1000000.0)
      portfolio_usd.save

      redirect_to @user
    else
      render 'new'
    end
  end

  def portfolio 
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
