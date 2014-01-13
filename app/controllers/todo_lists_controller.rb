class TodoListsController < ApplicationController
  respond_to :json
  before_action :find_todo_list, :only => [:show, :update, :destroy]

  def index
    respond_with TodoList.all, :include => :todos
  end

  def show
    respond_with @todo_list, :include => :todos
  end

  def create
    respond_with TodoList.create(todo_list_params)
  end

  def update
    @todo_list.update_attributes(todo_list_params)
    respond_with @todo_list
  end

  def destroy
    respond_with @todo_list.destroy
  end

  protected

  def find_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title, :completed)
  end
end
