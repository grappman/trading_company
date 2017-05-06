class CreateSales < ActiveRecord::Migration[5.0]

  def change
    create_table :sales do |t|
      t.references :product,      null: false
      t.float      :revenue,      null: false
      t.date       :trading_date, null: false
      t.timestamps
    end
    add_foreign_key :sales, :products
  end

end