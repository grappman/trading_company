class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.string :title
      t.float  :revenue

      t.timestamps
    end
  end
end
