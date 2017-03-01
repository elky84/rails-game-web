class FriendInstancesController < ApplicationController
  before_action :set_friend_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /friend_instances
  # GET /friend_instances.json
  def index
    if params[:search]
      @friend_instances = FriendInstance.search(params[:search])
    else
      @friend_instances = FriendInstance.limit(100)
    end
  end

  # GET /friend_instances/1
  # GET /friend_instances/1.json
  def show
  end

  # GET /friend_instances/new
  def new
    @friend_instance = FriendInstance.new
  end

  # GET /friend_instances/1/edit
  def edit
  end

  # POST /friend_instances
  # POST /friend_instances.json
  def create
    @friend_instance = create_or_update(:FRIEND_NO)

    respond_to do |format|
      if @friend_instance.save
        format.html { redirect_to @friend_instance, notice: 'Friend instance was successfully created.' }
        format.json { render :show, status: :created, location: @friend_instance }
      else
        format.html { render :new }
        format.json { render json: @friend_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_instances/1
  # PATCH/PUT /friend_instances/1.json
  def update
    respond_to do |format|
      if @friend_instance.update(friend_instance_params)
        format.html { redirect_to @friend_instance, notice: 'Friend instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend_instance }
      else
        format.html { render :edit }
        format.json { render json: @friend_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_instances/1
  # DELETE /friend_instances/1.json
  def destroy
    @friend_instance.destroy
    respond_to do |format|
      format.html { redirect_to friend_instances_url, notice: 'Friend instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_instance
      @friend_instance = FriendInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_instance_params
      params.require(:friend_instance).permit(:FRIEND_NO, :USER_NO, :FRIEND_USER_NO, :STATE, :USER_SEND_POINT_DATE, :FRIEND_USER_SEND_POINT_DATE, :USER_ADV_TOGETHER_DATE, :FRIEND_USER_ADV_TOGETHER_DATE, :IS_BOT)
    end
end
