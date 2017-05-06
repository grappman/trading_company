class CreateSales < ActiveRecord::Migration[5.0]

  def change
    create_table :sales do |t|
      t.string :title,    null: false

      t.float  :revenue,  null: false

      t.timestamps
    end
  end

end