class TasksController < ApplicationController
  before_action :set_list

  def new
    @task = Task.new
  end

  def edit
    render :form
  end

  def create
    @task = @list.tasks.new(list_params)
    if @list.save
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :new]
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @list
    else
      render :form
    end
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:title, :priority)
  end
end
