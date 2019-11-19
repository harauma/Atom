class CreateTeacherAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_accounts, id: :string, auto_increment: false, limit: 9 do |t|
      t.string     :password,    :limit => 255
      t.references :teacher,     foreign_key: true
      t.timestamps
    end
  end
end
