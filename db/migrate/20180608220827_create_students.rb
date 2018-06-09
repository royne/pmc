class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.integer :cellphone
      t.integer :age
      t.string :address
      t.string :course
      t.string :legal_guardian
      t.integer :phone_lg
      t.integer :eps

      t.timestamps
    end
  end
end
