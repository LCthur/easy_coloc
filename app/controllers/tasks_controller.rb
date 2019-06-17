class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(id: Task.last.id + 1, name: params[:name], description: params[:description])
    if @task.save
      user_id = params.keys[1].to_i
      @assignment = Assignment.new(user_id: user_id, done_state: false, deadline: params[:date])
      @assignment.task = @task
      if @assignment.save
        redirect_to flat_path(current_user.flat)
      else
        render :new
      end
    else
      render :new
    end
  end
end
