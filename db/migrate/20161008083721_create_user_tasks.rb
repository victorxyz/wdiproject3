class CreateUserTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tasks do |t|
      t.boolean :success

      t.timestamps
    end
  end
end
