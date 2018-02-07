class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.string :from_symbol
      t.string :to_symbol
      t.decimal :amount

      t.timestamps
    end
  end
end
