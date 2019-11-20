class CreateApplis < ActiveRecord::Migration[5.2]
  def change
    create_table :applis do |t|
      t.datetime   :start
      t.datetime   :end
      t.string     :place,        :limit => 255
      t.string     :content,      :limit => 255
      t.string     :company_name, :limit => 255
      t.integer    :withdrawal,   :limit => 1
      t.datetime   :withdrawal_day
      t.integer    :admit_flg
      t.integer    :watch_flg
      t.text       :comment,      :limit => 1023
      t.text       :reply,        :limit => 1023
      t.bigint     :student_id
      t.timestamps
    end
  end
end
