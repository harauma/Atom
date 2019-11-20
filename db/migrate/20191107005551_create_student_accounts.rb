class CreateStudentAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :student_accounts, id: :string, auto_increment: false, limit: 9 do |t|
      t.string     :password, :limit => 255
      t.references :student,  foreign_key: true
      t.timestamps
    end
  end
end
