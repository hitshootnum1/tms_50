class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.boolean :status
      t.references :user_subject, index: true, foreign_key: true
      t.references :course_subject_task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
