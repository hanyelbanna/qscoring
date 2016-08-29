module Validators
class ValidateStandardsController < ApplicationController
  before_action :set_standard, only: [:edit, :update]

  layout "validator"


  # GET /standards
  # GET /standards.json
  def index

    @chapters = Managers::Chapter.order(id: :asc)
    @departments = Managers::Department.order(id: :asc)
    
    if params[:chapter].present?
      if params[:score_status].present?
        @standards = Managers::Standard.text_search(params[:query]).by_chapter(params[:chapter]).by_user_validator(current_user.id).by_validator.by_score_status(params[:score_status]).page(params[:page]).per_page(10)
      else
        @standards = Managers::Standard.text_search(params[:query]).by_chapter(params[:chapter]).by_user_validator(current_user.id).by_validator.page(params[:page]).per_page(10)
      end
    elsif params[:department].present?
      if params[:score_status].present?
        @standards = Managers::Standard.text_search(params[:query]).by_department(params[:department]).by_user_validator(current_user.id).by_validator.by_score_status(params[:score_status]).page(params[:page]).per_page(10)
      else
        @standards = Managers::Standard.text_search(params[:query]).by_department(params[:department]).by_user_validator(current_user.id).by_validator.page(params[:page]).per_page(10)
      end
    else
      if params[:score_status].present?
        @standards = Managers::Standard.text_search(params[:query]).by_user_validator(current_user.id).by_validator.by_score_status(params[:score_status]).page(params[:page]).per_page(10)
      else
        @standards = Managers::Standard.text_search(params[:query]).by_user_validator(current_user.id).by_validator.page(params[:page]).per_page(10)
      end
    end

  end


  # GET /validator/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end


  # PATCH/PUT /standards/1
  # PATCH/PUT /standards/1.json
  def update
    respond_to do |format|
      if @standard.update(standard_params)
        format.html { redirect_to @standard, notice: 'Sub standard was successfully updated.' }
        format.json { render :show, status: :ok, location: @standard }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def validator_badges
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Managers::Standard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_params
      params.require(:managers_standard).permit(:score, :status, :validator_note)
    end
end
end