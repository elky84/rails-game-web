class UserGiveInstancesController < ApplicationController
  before_action :set_user_give_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /user_give_instances
  # GET /user_give_instances.json
  def index
    if params[:search]
      @user_give_instances = UserGiveInstance.search(params[:search])
    else
      @user_give_instances = UserGiveInstance.limit(100)
    end
  end

  # GET /user_give_instances/1
  # GET /user_give_instances/1.json
  def show
  end

  # GET /user_give_instances/new
  def new
    @user_give_instance = UserGiveInstance.new
  end

  # GET /user_give_instances/1/edit
  def edit
  end

  # POST /user_give_instances
  # POST /user_give_instances.json
  def create
    @user_give_instance = create_or_update(:USER_NO)

    respond_to do |format|
      if @user_give_instance.save
        format.html { redirect_to @user_give_instance, notice: 'User give instance was successfully created.' }
        format.json { render :show, status: :created, location: @user_give_instance }
      else
        format.html { render :new }
        format.json { render json: @user_give_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_give_instances/1
  # PATCH/PUT /user_give_instances/1.json
  def update
    respond_to do |format|
      if @user_give_instance.update(user_give_instance_params)
        format.html { redirect_to @user_give_instance, notice: 'User give instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_give_instance }
      else
        format.html { render :edit }
        format.json { render json: @user_give_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_give_instances/1
  # DELETE /user_give_instances/1.json
  def destroy
    @user_give_instance.destroy
    respond_to do |format|
      format.html { redirect_to user_give_instances_url, notice: 'User give instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_give_instance
      @user_give_instance = UserGiveInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_give_instance_params
      params.require(:user_give_instance).permit(:USER_NO, :GIVE_REPLY)
    end
end
