class ChangeCourseStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :course, :string
  end
end
