class PhaseInfosController < ApplicationController
  before_action :set_phase_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /phase_infos
  # GET /phase_infos.json
  def index
    if params[:search]
      @phase_infos = PhaseInfo.search(params[:search])
    else
      @phase_infos = PhaseInfo.limit(100)
    end
  end

  # GET /phase_infos/1
  # GET /phase_infos/1.json
  def show
  end

  # GET /phase_infos/new
  def new
    @phase_info = PhaseInfo.new
  end

  # GET /phase_infos/1/edit
  def edit
  end

  # POST /phase_infos
  # POST /phase_infos.json
  def create
    @phase_info = create_or_update(:PHASE_ID)

    respond_to do |format|
      if @phase_info.save
        format.html { redirect_to @phase_info, notice: 'Phase info was successfully created.' }
        format.json { render :show, status: :created, location: @phase_info }
      else
        format.html { render :new }
        format.json { render json: @phase_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phase_infos/1
  # PATCH/PUT /phase_infos/1.json
  def update
    respond_to do |format|
      if @phase_info.update(phase_info_params)
        format.html { redirect_to @phase_info, notice: 'Phase info was successfully updated.' }
        format.json { render :show, status: :ok, location: @phase_info }
      else
        format.html { render :edit }
        format.json { render json: @phase_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phase_infos/1
  # DELETE /phase_infos/1.json
  def destroy
    @phase_info.destroy
    respond_to do |format|
      format.html { redirect_to phase_infos_url, notice: 'Phase info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phase_info
      @phase_info = PhaseInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phase_info_params
      params.require(:phase_info).permit(:PHASE_ID, :INIT_POS, :MOVE_TIME, :CLEAR, :WAIT_TIME, :STAY_TIME, :MONSTER, :MONSTER_GEN_INFO, :MONSTER_LV, :APPEAR_SPEED, :APPEAR_TIME, :TEAM_INDEX, :START_SCENARIO, :END_SCENARIO, :IS_BOSS_PHASE, :PHASE_WIDTH)
    end
end
