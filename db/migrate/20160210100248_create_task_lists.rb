class CreateTaskLists < ActiveRecord::Migration[5.0]
  def change
    create_table :task_lists do |t|
      t.string :title
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
