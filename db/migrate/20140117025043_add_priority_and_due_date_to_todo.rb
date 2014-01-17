class AddPriorityAndDueDateToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :priority, :string, :default => :normal
    add_column :todos, :due_date, :date
  end
end
