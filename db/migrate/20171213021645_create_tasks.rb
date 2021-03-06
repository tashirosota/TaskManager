class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title , null: false, limit: 20
      t.datetime :line
      t.text :memo , limit: 500
      t.string :priority
      t.string :status
      t.string :label1
      t.string :label2
      t.integer :userId
      t.timestamps
    end
  end
end
