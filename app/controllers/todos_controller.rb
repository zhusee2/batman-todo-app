class TodosController < ApplicationController
  respond_to :json

  before_action :find_todo_list, :only => [:create]
  before_action :find_todo,      :only => [:update, :destroy]

  def create
    new_todo = @todo_list.todos.build(todo_params)
    new_todo.save
    respond_with(@todo_list, new_todo)
  end

  def update
    @todo.update_attributes(todo_params)
    respond_with @todo
  end

  def destroy
    respond_with(@todo.todo_list, @todo.destroy)
  end

  protected

  def find_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
