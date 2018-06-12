class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :month
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.string :detail
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
