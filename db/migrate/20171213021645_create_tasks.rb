class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title , null: false, limit: 20
      t.datetime :line
      t.text :memo , limit: 500
      t.integer :priority
      t.integer :statusId
      t.integer :labelId

      t.timestamps
    end
  end
end
