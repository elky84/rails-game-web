class AreaInfosController < ApplicationController
  before_action :set_area_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /area_infos
  # GET /area_infos.json
  def index
    if params[:search]
      @area_infos = AreaInfo.search(params[:search])
    else
      @area_infos = AreaInfo.limit(100)
    end
  end

  # GET /area_infos/1
  # GET /area_infos/1.json
  def show
  end

  # GET /area_infos/new
  def new
    @area_info = AreaInfo.new
  end

  # GET /area_infos/1/edit
  def edit
  end

  # POST /area_infos
  # POST /area_infos.json
  def create
    @area_info = create_or_update(:AREA_ID)

    respond_to do |format|
      if @area_info.save
        format.html { redirect_to @area_info, notice: 'Area info was successfully created.' }
        format.json { render :show, status: :created, location: @area_info }
      else
        format.html { render :new }
        format.json { render json: @area_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_infos/1
  # PATCH/PUT /area_infos/1.json
  def update
    respond_to do |format|
      if @area_info.update(area_info_params)
        format.html { redirect_to @area_info, notice: 'Area info was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_info }
      else
        format.html { render :edit }
        format.json { render json: @area_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_infos/1
  # DELETE /area_infos/1.json
  def destroy
    @area_info.destroy
    respond_to do |format|
      format.html { redirect_to area_infos_url, notice: 'Area info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_info
      @area_info = AreaInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_info_params
      params.require(:area_info).permit(:AREA_ID, :OPEN, :START_DATE, :END_DATE, :AREA_TYPE, :BG_COLOR, :NAME, :EXPLAIN, :CHARACTER_LEVEL, :IMAGE, :MISSION, :MONSTER, :ITEM, :SCENARIO_START, :SCENARIO_END)
    end
end
