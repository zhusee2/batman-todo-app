class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolen :completed
      t.references :todo_list, index: true

      t.timestamps
    end
  end
end
