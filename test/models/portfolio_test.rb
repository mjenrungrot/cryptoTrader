require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example User2", email: "example2@example.com",
                     password: "foobar", password_confirmation: "foobar")
    @user.save
    @portfolio = Portfolio.new(user_id: @user.id, currency: "USD", amount: 10.0)
  end

  test "should be valid" do
    assert @portfolio.valid?
  end

  test "user_id should be present" do
    @portfolio.user_id = nil
    assert_not @portfolio.valid?
  end

  test "currency should be present" do
    @portfolio.currency = "    "
    assert_not @portfolio.valid?
  end

  test "type can only be USD or BTC" do
    invalid_currency = %w[SGD USDOLLAR RPX FAS]
    invalid_currency.each do |currency| 
      @portfolio.currency = currency
      assert_not @portfolio.valid?, "#{currency.inspect} should be invalid"
    end
  end
end
