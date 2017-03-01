class PvpPeriodsController < ApplicationController
  before_action :set_pvp_period, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /pvp_periods
  # GET /pvp_periods.json
  def index
    if params[:search]
      @pvp_periods = PvpPeriod.search(params[:search])
    else
      @pvp_periods = PvpPeriod.limit(100)
    end
  end

  # GET /pvp_periods/1
  # GET /pvp_periods/1.json
  def show
  end

  # GET /pvp_periods/new
  def new
    @pvp_period = PvpPeriod.new
  end

  # GET /pvp_periods/1/edit
  def edit
  end

  # POST /pvp_periods
  # POST /pvp_periods.json
  def create
    @pvp_period = create_or_update(:PVP_PERIOD_ID)

    respond_to do |format|
      if @pvp_period.save
        format.html { redirect_to @pvp_period, notice: 'Pvp period was successfully created.' }
        format.json { render :show, status: :created, location: @pvp_period }
      else
        format.html { render :new }
        format.json { render json: @pvp_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvp_periods/1
  # PATCH/PUT /pvp_periods/1.json
  def update
    respond_to do |format|
      if @pvp_period.update(pvp_period_params)
        format.html { redirect_to @pvp_period, notice: 'Pvp period was successfully updated.' }
        format.json { render :show, status: :ok, location: @pvp_period }
      else
        format.html { render :edit }
        format.json { render json: @pvp_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvp_periods/1
  # DELETE /pvp_periods/1.json
  def destroy
    @pvp_period.destroy
    respond_to do |format|
      format.html { redirect_to pvp_periods_url, notice: 'Pvp period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pvp_period
      @pvp_period = PvpPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pvp_period_params
      params.require(:pvp_period).permit(:PVP_PERIOD_ID, :SEASON_NUM, :START_DATE, :END_DATE)
    end
end
