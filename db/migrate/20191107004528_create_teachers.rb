class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers, auto_increment: false, limit: 8 do |t|
      t.string     :name,       :limit => 255
      t.string     :password,   :limit => 255
      t.string     :course_id
      t.timestamps
    end
  end
end
# courseを指定実行して先に作ってみる