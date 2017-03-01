class StageInfosController < ApplicationController
  before_action :set_stage_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /stage_infos
  # GET /stage_infos.json
  def index
    if params[:search]
      @stage_infos = StageInfo.search(params[:search])
    else
      @stage_infos = StageInfo.limit(100)
    end
  end

  # GET /stage_infos/1
  # GET /stage_infos/1.json
  def show
  end

  # GET /stage_infos/new
  def new
    @stage_info = StageInfo.new
  end

  # GET /stage_infos/1/edit
  def edit
  end

  # POST /stage_infos
  # POST /stage_infos.json
  def create
    @stage_info = create_or_update(:STAGE_ID)

    respond_to do |format|
      if @stage_info.save
        format.html { redirect_to @stage_info, notice: 'Stage info was successfully created.' }
        format.json { render :show, status: :created, location: @stage_info }
      else
        format.html { render :new }
        format.json { render json: @stage_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stage_infos/1
  # PATCH/PUT /stage_infos/1.json
  def update
    respond_to do |format|
      if @stage_info.update(stage_info_params)
        format.html { redirect_to @stage_info, notice: 'Stage info was successfully updated.' }
        format.json { render :show, status: :ok, location: @stage_info }
      else
        format.html { render :edit }
        format.json { render json: @stage_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_infos/1
  # DELETE /stage_infos/1.json
  def destroy
    @stage_info.destroy
    respond_to do |format|
      format.html { redirect_to stage_infos_url, notice: 'Stage info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage_info
      @stage_info = StageInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_info_params
      params.require(:stage_info).permit(:STAGE_ID, :AREA_ID, :STAGE_NUMBER, :OPEN, :TYPE, :LEVEL, :COORDINATE, :BGM, :BG_COLOR, :NAME, :EXPLAIN, :CHARACTER_LEVEL, :STAMINA, :PHASE, :MONSTER, :ITEM, :STAGE_ICON, :CLEAR_SCORE, :CLEAR_EXP, :CLEAR_MONEY, :CLEAR_1_REWARD, :CLEAR_1_REWARD_PROBABILITY, :CLEAR_2_REWARD, :CLEAR_2_REWARD_PROBABILITY, :CLEAR_3_REWARD, :CLEAR_3_REWARD_PROBABILITY, :START_SCENARIO, :END_SCENARIO, :BG_PREFEB, :INFI_TOWER_SP_REWARD, :INFI_TOWER_PREVIEW)
    end
end
