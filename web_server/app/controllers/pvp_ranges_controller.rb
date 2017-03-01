class PvpRangesController < ApplicationController
  before_action :set_pvp_range, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /pvp_ranges
  # GET /pvp_ranges.json
  def index
    if params[:search]
      @pvp_ranges = PvpRange.search(params[:search])
    else
      @pvp_ranges = PvpRange.limit(100)
    end
  end

  # GET /pvp_ranges/1
  # GET /pvp_ranges/1.json
  def show
  end

  # GET /pvp_ranges/new
  def new
    @pvp_range = PvpRange.new
  end

  # GET /pvp_ranges/1/edit
  def edit
  end

  # POST /pvp_ranges
  # POST /pvp_ranges.json
  def create
    @pvp_range = create_or_update(:PVP_RANGE_ID)

    respond_to do |format|
      if @pvp_range.save
        format.html { redirect_to @pvp_range, notice: 'Pvp range was successfully created.' }
        format.json { render :show, status: :created, location: @pvp_range }
      else
        format.html { render :new }
        format.json { render json: @pvp_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvp_ranges/1
  # PATCH/PUT /pvp_ranges/1.json
  def update
    respond_to do |format|
      if @pvp_range.update(pvp_range_params)
        format.html { redirect_to @pvp_range, notice: 'Pvp range was successfully updated.' }
        format.json { render :show, status: :ok, location: @pvp_range }
      else
        format.html { render :edit }
        format.json { render json: @pvp_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvp_ranges/1
  # DELETE /pvp_ranges/1.json
  def destroy
    @pvp_range.destroy
    respond_to do |format|
      format.html { redirect_to pvp_ranges_url, notice: 'Pvp range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pvp_range
      @pvp_range = PvpRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pvp_range_params
      params.require(:pvp_range).permit(:PVP_RANGE_ID, :RATING, :RANK, :ADD_RANK)
    end
end
