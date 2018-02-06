class Portfolio < ApplicationRecord
  belongs_to :user
  
  before_save { self.currency = currency.upcase }
  validates(:currency, presence: true,
                       inclusion: { in: %w(USD BTC) } )
end
