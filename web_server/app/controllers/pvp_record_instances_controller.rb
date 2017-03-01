class PvpRecordInstancesController < ApplicationController
  before_action :set_pvp_record_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /pvp_record_instances
  # GET /pvp_record_instances.json
  def index
    if params[:search]
      @pvp_record_instances = PvpRecordInstance.search(params[:search])
    else
      @pvp_record_instances = PvpRecordInstance.limit(100)
    end
  end

  # GET /pvp_record_instances/1
  # GET /pvp_record_instances/1.json
  def show
  end

  # GET /pvp_record_instances/new
  def new
    @pvp_record_instance = PvpRecordInstance.new
  end

  # GET /pvp_record_instances/1/edit
  def edit
  end

  # POST /pvp_record_instances
  # POST /pvp_record_instances.json
  def create
    @pvp_record_instance = create_or_update(:PVP_RECORD_INSTANCE_NO)

    respond_to do |format|
      if @pvp_record_instance.save
        format.html { redirect_to @pvp_record_instance, notice: 'Pvp record instance was successfully created.' }
        format.json { render :show, status: :created, location: @pvp_record_instance }
      else
        format.html { render :new }
        format.json { render json: @pvp_record_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvp_record_instances/1
  # PATCH/PUT /pvp_record_instances/1.json
  def update
    respond_to do |format|
      if @pvp_record_instance.update(pvp_record_instance_params)
        format.html { redirect_to @pvp_record_instance, notice: 'Pvp record instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @pvp_record_instance }
      else
        format.html { render :edit }
        format.json { render json: @pvp_record_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvp_record_instances/1
  # DELETE /pvp_record_instances/1.json
  def destroy
    @pvp_record_instance.destroy
    respond_to do |format|
      format.html { redirect_to pvp_record_instances_url, notice: 'Pvp record instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pvp_record_instance
      @pvp_record_instance = PvpRecordInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pvp_record_instance_params
      params.require(:pvp_record_instance).permit(:PVP_RECORD_INSTANCE_NO, :SEASON_NUM, :CHARACTER_NO, :RESULT, :RESULT_TIME, :ADD_RATING, :RESULT_RATING, :MATCH_CHARACTER_NO, :MATCH_CHR_LV, :MATCH_CHR_ID, :MATCH_USER_NICKNAME, :MATCH_USER_LV, :MATCH_CHR_DEF_POWER, :MATCH_MONSTER_ID, :MATCH_MONSTER_LV)
    end
end
