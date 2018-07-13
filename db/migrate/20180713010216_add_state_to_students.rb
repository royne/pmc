class AddStateToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :state, :boolean, default: true, null: true 
  end
end
