module Managers
class ValidatorsController < ApplicationController
  before_action :set_validator, only: [:show, :edit, :update, :destroy]

  #Declare a controller method as a helper to be available to the view
  helper_method :sort_column, :sort_direction

  layout "manager"

  # GET /validators
  # GET /validators.json
  def index
    @validators = Managers::Validator.text_search(params[:query]).page(params[:page]).per_page(10)
  end

  # GET /validators/1
  # GET /validators/1.json
  def show
  end

  # GET /chapters/new
  def new
    @validator = Managers::Validator.new
    respond_to do |format|
      format.js
    end
  end

  # GET /validators/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @validator = Managers::Validator.new(validator_params)

    respond_to do |format|
      if @validator.save
        format.html { redirect_to @validator, notice: 'validator was successfully created.' }
        format.json { render :show, status: :created, location: @validator }
        format.js
      else
        format.html { render :new }
        format.json { render json: @validator.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /validators/1
  # PATCH/PUT /validators/1.json
  def update

    if params[:managers_validator][:password].blank?
      params[:managers_validator].delete(:password)
      params[:managers_validator].delete(:password_confirmation)
    end

    respond_to do |format|
      if @validator.update(validator_params)
        format.html { redirect_to @validator, notice: 'Validator was successfully updated.' }
        format.json { render :show, status: :ok, location: @validator }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @validator.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /validators/1
  # DELETE /validators/1.json
  def destroy
    @validator.destroy
    respond_to do |format|
      format.html { redirect_to managers_validators_url, notice: 'Validator was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_validator
      @validator = Managers::Validator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def validator_params
      params.require(:managers_validator).permit(:first_name, :last_name, :mobile, :email, :password, :password_confirmation)
    end
    
end
end