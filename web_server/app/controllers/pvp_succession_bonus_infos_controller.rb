class PvpSuccessionBonusInfosController < ApplicationController
  before_action :set_pvp_succession_bonus_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /pvp_succession_bonus_infos
  # GET /pvp_succession_bonus_infos.json
  def index
    if params[:search]
      @pvp_succession_bonus_infos = PvpSuccessionBonusInfo.search(params[:search])
    else
      @pvp_succession_bonus_infos = PvpSuccessionBonusInfo.limit(100)
    end
  end

  # GET /pvp_succession_bonus_infos/1
  # GET /pvp_succession_bonus_infos/1.json
  def show
  end

  # GET /pvp_succession_bonus_infos/new
  def new
    @pvp_succession_bonus_info = PvpSuccessionBonusInfo.new
  end

  # GET /pvp_succession_bonus_infos/1/edit
  def edit
  end

  # POST /pvp_succession_bonus_infos
  # POST /pvp_succession_bonus_infos.json
  def create
    @pvp_succession_bonus_info = create_or_update(:PVP_SUCCESSION_BONUS_ID)

    respond_to do |format|
      if @pvp_succession_bonus_info.save
        format.html { redirect_to @pvp_succession_bonus_info, notice: 'Pvp succession bonus info was successfully created.' }
        format.json { render :show, status: :created, location: @pvp_succession_bonus_info }
      else
        format.html { render :new }
        format.json { render json: @pvp_succession_bonus_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvp_succession_bonus_infos/1
  # PATCH/PUT /pvp_succession_bonus_infos/1.json
  def update
    respond_to do |format|
      if @pvp_succession_bonus_info.update(pvp_succession_bonus_info_params)
        format.html { redirect_to @pvp_succession_bonus_info, notice: 'Pvp succession bonus info was successfully updated.' }
        format.json { render :show, status: :ok, location: @pvp_succession_bonus_info }
      else
        format.html { render :edit }
        format.json { render json: @pvp_succession_bonus_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvp_succession_bonus_infos/1
  # DELETE /pvp_succession_bonus_infos/1.json
  def destroy
    @pvp_succession_bonus_info.destroy
    respond_to do |format|
      format.html { redirect_to pvp_succession_bonus_infos_url, notice: 'Pvp succession bonus info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pvp_succession_bonus_info
      @pvp_succession_bonus_info = PvpSuccessionBonusInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pvp_succession_bonus_info_params
      params.require(:pvp_succession_bonus_info).permit(:PVP_SUCCESSION_BONUS_ID, :BONUS_POINT)
    end
end
