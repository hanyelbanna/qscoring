module Managers
class ActionPlansController < ApplicationController
  before_action :set_action_plan, only: [:show, :edit, :update, :destroy]

  layout "manager"

  # GET /action_plans
  # GET /action_plans.json
  def index
    if params[:select].present? && params[:select] = 'NOT CLOSED'
      @action_plans = Managers::ActionPlan.text_search(params[:query]).by_not_closed.order(:name).page(params[:page]).per_page(10)
    else
      @action_plans = Managers::ActionPlan.text_search(params[:query]).order(:name).page(params[:page]).per_page(10)
    end
  end

  # GET /action_plans/1
  # GET /action_plans/1.json
  def show
  end

  # GET /action_plans/new
  def new
    @action_plan = Managers::ActionPlan.new
    respond_to do |format|
      format.js
    end
  end

  # GET /action_plans/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /action_plans
  # POST /action_plans.json
  def create
    @action_plan = Managers::ActionPlan.new(action_plan_params)

    respond_to do |format|
      if @action_plan.save
        format.html { redirect_to @action_plan, notice: 'Action plan was successfully created.' }
        format.json { render :show, status: :created, location: @action_plan }
        format.js
      else
        format.html { render :new }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /action_plans/1
  # PATCH/PUT /action_plans/1.json
  def update
    respond_to do |format|
      if @action_plan.update(action_plan_params)
        format.html { redirect_to @action_plan, notice: 'Action plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_plan }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /action_plans/1
  # DELETE /action_plans/1.json
  def destroy
    @action_plan.destroy
    respond_to do |format|
      format.html { redirect_to action_plans_url, notice: 'Action plan was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_plan
      @action_plan = Managers::ActionPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_plan_params
      params.require(:managers_action_plan).permit(:name, :description, :closed)
    end
end
end