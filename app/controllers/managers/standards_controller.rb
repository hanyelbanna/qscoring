module Managers
class StandardsController < ApplicationController
  before_action :set_standard, only: [:show, :edit, :update, :destroy]

  layout "manager"

  # GET /standards
  # GET /standards.json
  def index
    @chapters = Managers::Chapter.order(id: :asc)
    @departments = Managers::Department.order(id: :asc)
    
    if params[:chapter].present?
      if params[:score_status].present?
        @standards = Managers::Standard.text_search(params[:query]).by_chapter(params[:chapter]).by_score_status(params[:score_status]).order(name: :asc).page(params[:page]).per_page(10)
      else
        @standards = Managers::Standard.text_search(params[:query]).by_chapter(params[:chapter]).page(params[:page]).order(name: :asc).per_page(10)
      end
    elsif params[:department].present?
      if params[:score_status].present?
        @standards = Managers::Standard.text_search(params[:query]).by_department(params[:department]).by_score_status(params[:score_status]).order(name: :asc).page(params[:page]).per_page(10)
      else
        @standards = Managers::Standard.text_search(params[:query]).by_department(params[:department]).order(name: :asc).page(params[:page]).per_page(10)
      end
    else
      if params[:score_status].present?
        @standards = Managers::Standard.text_search(params[:query]).by_score_status(params[:score_status]).order(name: :asc).page(params[:page]).per_page(10)
      else
        @standards = Managers::Standard.text_search(params[:query]).order(name: :asc).page(params[:page]).per_page(10)
      end
    end
  end

  # GET /standards/1
  # GET /standards/1.json
  def show
  end

  # GET /standards/new
  def new
    @standard = Standard.new
    respond_to do |format|
      format.js
    end
  end

  # GET /standards/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /standards
  # POST /standards.json
  def create
    @standard = Standard.new(standard_params)

    respond_to do |format|
      if @standard.save
        format.html { redirect_to @standard, notice: 'Standard was successfully created.' }
        format.json { render :show, status: :created, location: @standard }
        format.js
      else
        format.html { render :new }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /standards/1
  # PATCH/PUT /standards/1.json
  def update
    respond_to do |format|
      if @standard.update(standard_params)
        format.html { redirect_to @standard, notice: 'Standard was successfully updated.' }
        format.json { render :show, status: :ok, location: @standard }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /standards/1
  # DELETE /standards/1.json
  def destroy
    @standard.destroy
    respond_to do |format|
      format.html { redirect_to standards_url, notice: 'Standard was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_params
      params.require(:managers_standard).permit(:name, :description, :chapter_id, :department_id, :user_id, :validator_id, :frequency_id, :review_date, :score, :scorer_note, :validator_note, :status, :bold)
    end
end
end