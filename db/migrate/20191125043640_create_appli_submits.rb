class CreateAppliSubmits < ActiveRecord::Migration[5.2]
  def change
    create_table :appli_submits do |t|
      t.integer    :admit_flg
      t.integer    :watch_flg
      t.integer    :delete_flg
      t.text       :reply
      t.references :teacher, foreign_key: true
      t.references :appli, foreign_key: true
      t.timestamps
    end
  end
end
