class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students, auto_increment: false, limit: 8 do |t|
      t.string  :student_name, :limit => 30
      t.string  :class_name, :limit => 4
      t.integer :class_num, :limit => 2
      t.string  :course_id
      t.timestamps
    end
  end
end