module Managers
class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

  #Declare a controller method as a helper to be available to the view
  helper_method :sort_column, :sort_direction

  layout "manager"

  # GET /managers
  # GET /managers.json
  def index
    @managers = Managers::Manager.text_search(params[:query]).page(params[:page]).per_page(10)
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
  end

  # GET /chapters/new
  def new
    @manager = Managers::Manager.new
    respond_to do |format|
      format.js
    end
  end

  # GET /managers/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @manager = Managers::Manager.new(manager_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'manager was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
        format.js
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update

    if params[:managers_manager][:password].blank?
      params[:managers_manager].delete(:password)
      params[:managers_manager].delete(:password_confirmation)
    end

    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to managers_managers_url, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Managers::Manager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:managers_manager).permit(:first_name, :last_name, :mobile, :email, :password, :password_confirmation)
    end
    
end
end