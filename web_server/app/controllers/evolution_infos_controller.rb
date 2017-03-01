class EvolutionInfosController < ApplicationController
  before_action :set_evolution_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /evolution_infos
  # GET /evolution_infos.json
  def index
    if params[:search]
      @evolution_infos = EvolutionInfo.search(params[:search])
    else
      @evolution_infos = EvolutionInfo.limit(100)
    end
  end

  # GET /evolution_infos/1
  # GET /evolution_infos/1.json
  def show
  end

  # GET /evolution_infos/new
  def new
    @evolution_info = EvolutionInfo.new
  end

  # GET /evolution_infos/1/edit
  def edit
  end

  # POST /evolution_infos
  # POST /evolution_infos.json
  def create
    @evolution_info = create_or_update(:EVOLUTION_ID)

    respond_to do |format|
      if @evolution_info.save
        format.html { redirect_to @evolution_info, notice: 'Evolution info was successfully created.' }
        format.json { render :show, status: :created, location: @evolution_info }
      else
        format.html { render :new }
        format.json { render json: @evolution_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evolution_infos/1
  # PATCH/PUT /evolution_infos/1.json
  def update
    respond_to do |format|
      if @evolution_info.update(evolution_info_params)
        format.html { redirect_to @evolution_info, notice: 'Evolution info was successfully updated.' }
        format.json { render :show, status: :ok, location: @evolution_info }
      else
        format.html { render :edit }
        format.json { render json: @evolution_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evolution_infos/1
  # DELETE /evolution_infos/1.json
  def destroy
    @evolution_info.destroy
    respond_to do |format|
      format.html { redirect_to evolution_infos_url, notice: 'Evolution info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evolution_info
      @evolution_info = EvolutionInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evolution_info_params
      params.require(:evolution_info).permit(:EVOLUTION_ID, :GRADE, :RAW, :SPECIAL_MONSTER_LIST, :SPECIAL_SKILL_LIST, :RESULT, :RESULT_PERCENT, :PRICE_COIN, :PRICE_DIAMOND, :EVOLUTION_EVENT_TYPE, :PERCENT_UP, :START_DATE_TIME, :END_DATE_TIME)
    end
end
