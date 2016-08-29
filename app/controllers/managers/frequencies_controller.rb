module Managers
class FrequenciesController < ApplicationController
  before_action :set_frequency, only: [:show, :edit, :update, :destroy]

  layout "manager"

  # GET /frequencies
  # GET /frequencies.json
  def index
    @frequencies = Managers::Frequency.text_search(params[:query]).order(:name).page(params[:page]).per_page(10)
  end

  # GET /frequencies/1
  # GET /frequencies/1.json
  def show
  end

  # GET /frequencies/new
  def new
    @frequency = Managers::Frequency.new
    respond_to do |format|
      format.js
    end
  end

  # GET /frequencies/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /frequencies
  # POST /frequencies.json
  def create
    @frequency = Managers::Frequency.new(frequency_params)

    respond_to do |format|
      if @frequency.save
        format.html { redirect_to @frequency, notice: 'Frequency was successfully created.' }
        format.json { render :show, status: :created, location: @frequency }
        format.js
      else
        format.html { render :new }
        format.json { render json: @frequency.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /frequencies/1
  # PATCH/PUT /frequencies/1.json
  def update
    respond_to do |format|
      if @frequency.update(frequency_params)
        format.html { redirect_to @frequency, notice: 'Frequency was successfully updated.' }
        format.json { render :show, status: :ok, location: @frequency }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @frequency.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /frequencies/1
  # DELETE /frequencies/1.json
  def destroy
    @frequency.destroy
    respond_to do |format|
      format.html { redirect_to frequencies_url, notice: 'Frequency was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frequency
      @frequency = Managers::Frequency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frequency_params
      params.require(:managers_frequency).permit(:name, :description, :days)
    end
end
end