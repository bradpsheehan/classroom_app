class AddStudentsColumnToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :students, :text, :default => []
  end
end
