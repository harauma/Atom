class CreateApplis < ActiveRecord::Migration[5.2]
  def change
    create_table :applis do |t|
      t.datetime   :start
      t.datetime   :end
      t.string     :place,        :limit => 255
      t.string     :content,      :limit => 255
      t.string     :company_name, :limit => 255
      t.string     :withdrawal,   :limit => 255
      t.datetime   :withdrawal_day
      t.text       :comment,      :limit => 1023
      t.integer    :delete_flg
      t.bigint     :student_id
      t.timestamps
    end
  end
end
