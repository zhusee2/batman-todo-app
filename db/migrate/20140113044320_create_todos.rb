class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title, required: true
      t.boolean :completed, default: false
      t.references :todo_list, index: true

      t.timestamps
    end
  end
end
