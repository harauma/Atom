class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table   :reports do |t|
      t.datetime   :appli_day
      t.datetime   :report_day
      t.string     :job_code,         :limit => 15
      t.datetime   :exam_day
      t.string     :exam_place,       :limit => 255
      t.string     :exam_area,        :limit => 20
      t.string     :exam_content,     :limit => 255
      t.string     :result,           :limit => 5
      t.string     :aptitude_content, :limit => 7
      t.string     :interview,        :limit => 12
      t.string     :question,         :limit => 8
      t.integer    :approval_flg
      t.integer    :watch_flg
      t.text       :comment,          :limit => 1023
      t.text       :reply,            :limit => 1023
      t.bigint     :student_id
      t.string     :course_id
      t.timestamps
    end
  end
end
