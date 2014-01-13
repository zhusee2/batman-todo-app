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
    respond_with TodoList.create(params[:todo_list])
  end

  def update
    @todo_list.update_attributes(params[:todo_list])
    respond_with @todo_list
  end

  def destroy
    respond_with @todo_list.destroy
  end

  protected

  def find_todo_list
    @todo_list = TodoList.find(params[:id])
  end
end
