class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses,id: :string do |t|
      t.string :course_name, :limit => 30
      t.timestamps
    end
  end
end
