class CreateClassroomStudentsTable < ActiveRecord::Migration
  def change
    create_table :classroom_students do |t|
      t.timestamps
      t.references :classroom
      t.integer :student_id
    end

    add_index :classroom_students, :classroom_id
  end

end
