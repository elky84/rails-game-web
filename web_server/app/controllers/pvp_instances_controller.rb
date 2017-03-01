class PvpInstancesController < ApplicationController
  before_action :set_pvp_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /pvp_instances
  # GET /pvp_instances.json
  def index
    if params[:search]
      @pvp_instances = PvpInstance.search(params[:search])
    else
      @pvp_instances = PvpInstance.limit(100)
    end
  end

  # GET /pvp_instances/1
  # GET /pvp_instances/1.json
  def show
  end

  # GET /pvp_instances/new
  def new
    @pvp_instance = PvpInstance.new
  end

  # GET /pvp_instances/1/edit
  def edit
  end

  # POST /pvp_instances
  # POST /pvp_instances.json
  def create
    @pvp_instance = create_or_update(:CHARACTER_NO)

    respond_to do |format|
      if @pvp_instance.save
        format.html { redirect_to @pvp_instance, notice: 'Pvp instance was successfully created.' }
        format.json { render :show, status: :created, location: @pvp_instance }
      else
        format.html { render :new }
        format.json { render json: @pvp_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvp_instances/1
  # PATCH/PUT /pvp_instances/1.json
  def update
    respond_to do |format|
      if @pvp_instance.update(pvp_instance_params)
        format.html { redirect_to @pvp_instance, notice: 'Pvp instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @pvp_instance }
      else
        format.html { render :edit }
        format.json { render json: @pvp_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvp_instances/1
  # DELETE /pvp_instances/1.json
  def destroy
    @pvp_instance.destroy
    respond_to do |format|
      format.html { redirect_to pvp_instances_url, notice: 'Pvp instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pvp_instance
      @pvp_instance = PvpInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pvp_instance_params
      params.require(:pvp_instance).permit(:CHARACTER_NO, :CHARACTER_LV, :CHARACTER_ID, :COSTUME_ID, :USER_NO, :USER_NICKNAME, :USER_LV, :RATING, :PARTY_ATTACKER, :ATTACKER_POWER, :PARTY_DEFENDER, :DEFENDER_POWER, :SEASON_NUM, :IS_SUCCESSION_VICTORY, :SUCCESSION_COUNT, :VICTORY_COUNT, :DEFEAT_COUNT, :CUR_MATCH_NO, :RANK)
    end
end
