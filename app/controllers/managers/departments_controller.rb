module Managers
class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  layout "manager"

  # GET /departments
  # GET /departments.json
  def index
    @departments = Managers::Department.text_search(params[:query]).order(:name).page(params[:page]).per_page(10)
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    @department = Managers::Department.new
    respond_to do |format|
      format.js
    end
  end

  # GET /departments/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Managers::Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
        format.js
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Managers::Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:managers_department).permit(:name, :description)
    end
end
end