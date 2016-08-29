module Managers
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  #Declare a controller method as a helper to be available to the view
  helper_method :sort_column, :sort_direction

  layout "manager"

  # GET /users
  # GET /users.json
  def index
    @users = Managers::User.where(type: nil).text_search(params[:query]).page(params[:page]).per_page(10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /chapters/new
  def new
    @user = Managers::User.new
    respond_to do |format|
      format.js
    end
  end

  # GET /users/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @user = Managers::User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.js
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    if params[:managers_user][:password].blank?
      params[:managers_user].delete(:password)
      params[:managers_user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to managers_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = Managers::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:managers_user).permit(:first_name, :last_name, :mobile, :email, :password, :password_confirmation)
    end
    
end
end