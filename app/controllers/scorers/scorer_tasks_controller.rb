module Scorers
class ScorerTasksController < ApplicationController
  before_action :set_task, only: [:edit, :update]

  layout "scorer"

  # GET /tasks
  # GET /tasks.json
  def index      
    if (params[:select].present? && params[:select] == 'AFTER DUE')
      @tasks = Managers::Task.text_search(params[:query]).by_not_completed.by_after_due.by_user(current_user.id).order(:name).page(params[:page]).per_page(10)
    else
      @tasks = Managers::Task.text_search(params[:query]).by_not_completed.by_user(current_user.id).order(:name).page(params[:page]).per_page(10)
    end
  end


  # GET /tasks/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end


  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Managers::Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:managers_task).permit(:completed, :user_note)
    end
end
end