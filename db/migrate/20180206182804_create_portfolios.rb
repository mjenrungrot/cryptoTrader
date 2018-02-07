class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.belongs_to :user, index: true
      t.string :currency
      t.decimal :amount

      t.timestamps
    end
  end
end
