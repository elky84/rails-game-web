class UserInstancesController < ApplicationController
  before_action :set_user_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /user_instances
  # GET /user_instances.json
  def index
    if params[:search]
      @user_instances = UserInstance.search(params[:search])
    else
      @user_instances = UserInstance.limit(100)
    end
  end

  # GET /user_instances/1
  # GET /user_instances/1.json
  def show
  end

  # GET /user_instances/new
  def new
    @user_instance = UserInstance.new
  end

  # GET /user_instances/1/edit
  def edit
  end

  # POST /user_instances
  # POST /user_instances.json
  def create
    @user_instance = create_or_update(:USER_NO)

    respond_to do |format|
      if @user_instance.save
        format.html { redirect_to @user_instance, notice: 'User instance was successfully created.' }
        format.json { render :show, status: :created, location: @user_instance }
      else
        format.html { render :new }
        format.json { render json: @user_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_instances/1
  # PATCH/PUT /user_instances/1.json
  def update
    respond_to do |format|
      if @user_instance.update(user_instance_params)
        format.html { redirect_to @user_instance, notice: 'User instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_instance }
      else
        format.html { render :edit }
        format.json { render json: @user_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_instances/1
  # DELETE /user_instances/1.json
  def destroy
    @user_instance.destroy
    respond_to do |format|
      format.html { redirect_to user_instances_url, notice: 'User instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_instance
      @user_instance = UserInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_instance_params
      params.require(:user_instance).permit(:USER_NO, :USER_ID, :USER_LV, :EXP, :NICKNAME, :CASH, :MONEY, :STAMINA_ADVENTURE_TIME, :STAMINA_ADVENTURE, :STAMINA_SPECIAL_TIME, :STAMINA_SPECIAL, :STAMINA_PVP_TIME, :STAMINA_PVP, :FRIEND_POINT, :POSTBOX_SLOT, :CACHE_MONSTER_SLOT, :EXT_MONSTER_SLOT, :CACHE_ITEM_SLOT, :EXT_ITEM_SLOT, :CACHE_FRIEND_SLOT, :EXT_FRIEND_COUNT, :MASTERY_RESET_COUNT, :LASTEST_ACTIVE_TIME, :PERMISSION, :LASTEST_CHR_ID, :LASTEST_CHR_LV, :MASTERY_POINT, :INFI_TOWER_FLOOR, :FRIEND_DELETE_COUNT)
    end
end
