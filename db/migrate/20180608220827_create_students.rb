class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :cellphone
      t.string :email
      t.integer :age
      t.string :address
      t.string :course
      t.string :legal_guardian
      t.string :phone_lg
      t.string :eps

      t.timestamps
    end
  end
end
