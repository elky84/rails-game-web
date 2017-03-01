class PvpRewardInfosController < ApplicationController
  before_action :set_pvp_reward_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /pvp_reward_infos
  # GET /pvp_reward_infos.json
  def index
    if params[:search]
      @pvp_reward_infos = PvpRewardInfo.search(params[:search])
    else
      @pvp_reward_infos = PvpRewardInfo.limit(100)
    end
  end

  # GET /pvp_reward_infos/1
  # GET /pvp_reward_infos/1.json
  def show
  end

  # GET /pvp_reward_infos/new
  def new
    @pvp_reward_info = PvpRewardInfo.new
  end

  # GET /pvp_reward_infos/1/edit
  def edit
  end

  # POST /pvp_reward_infos
  # POST /pvp_reward_infos.json
  def create
    @pvp_reward_info = create_or_update(:PVP_REWARD_ID)

    respond_to do |format|
      if @pvp_reward_info.save
        format.html { redirect_to @pvp_reward_info, notice: 'Pvp reward info was successfully created.' }
        format.json { render :show, status: :created, location: @pvp_reward_info }
      else
        format.html { render :new }
        format.json { render json: @pvp_reward_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvp_reward_infos/1
  # PATCH/PUT /pvp_reward_infos/1.json
  def update
    respond_to do |format|
      if @pvp_reward_info.update(pvp_reward_info_params)
        format.html { redirect_to @pvp_reward_info, notice: 'Pvp reward info was successfully updated.' }
        format.json { render :show, status: :ok, location: @pvp_reward_info }
      else
        format.html { render :edit }
        format.json { render json: @pvp_reward_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvp_reward_infos/1
  # DELETE /pvp_reward_infos/1.json
  def destroy
    @pvp_reward_info.destroy
    respond_to do |format|
      format.html { redirect_to pvp_reward_infos_url, notice: 'Pvp reward info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pvp_reward_info
      @pvp_reward_info = PvpRewardInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pvp_reward_info_params
      params.require(:pvp_reward_info).permit(:PVP_REWARD_ID, :RANGE_TYPE, :MIN, :MAX, :REWARD_TYPE_AND_CAPACITY)
    end
end
