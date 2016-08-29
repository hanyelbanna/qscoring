module Managers
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  layout "manager"

  # GET /tasks
  # GET /tasks.json
  def index
    if (params[:select].present? && params[:select] == 'NOT COMPLETED')
      @tasks = Managers::Task.text_search(params[:query]).by_not_completed.order(:name).page(params[:page]).per_page(10)
    elsif (params[:select].present? && params[:select] == 'AFTER DUE')
      @tasks = Managers::Task.text_search(params[:query]).by_not_completed.by_after_due.order(:name).page(params[:page]).per_page(10)
    else
      @tasks = Managers::Task.text_search(params[:query]).order(:name).page(params[:page]).per_page(10)
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Managers::Task.new
    respond_to do |format|
      format.js
    end
  end

  # GET /tasks/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Managers::Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
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

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Managers::Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:managers_task).permit(:name, :description, :due_date, :completed, :completed_date, :user_id, :user_note, :action_plan_id)
    end
end
end