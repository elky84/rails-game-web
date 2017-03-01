class PvpRankCacheInstancesController < ApplicationController
  before_action :set_pvp_rank_cache_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /pvp_rank_cache_instances
  # GET /pvp_rank_cache_instances.json
  def index
    if params[:search]
      @pvp_rank_cache_instances = PvpRankCacheInstance.search(params[:search])
    else
      @pvp_rank_cache_instances = PvpRankCacheInstance.limit(100)
    end
  end

  # GET /pvp_rank_cache_instances/1
  # GET /pvp_rank_cache_instances/1.json
  def show
  end

  # GET /pvp_rank_cache_instances/new
  def new
    @pvp_rank_cache_instance = PvpRankCacheInstance.new
  end

  # GET /pvp_rank_cache_instances/1/edit
  def edit
  end

  # POST /pvp_rank_cache_instances
  # POST /pvp_rank_cache_instances.json
  def create
    @pvp_rank_cache_instance = create_or_update(:PVP_RANK_CACHE_INSTANCE_NO)

    respond_to do |format|
      if @pvp_rank_cache_instance.save
        format.html { redirect_to @pvp_rank_cache_instance, notice: 'Pvp rank cache instance was successfully created.' }
        format.json { render :show, status: :created, location: @pvp_rank_cache_instance }
      else
        format.html { render :new }
        format.json { render json: @pvp_rank_cache_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pvp_rank_cache_instances/1
  # PATCH/PUT /pvp_rank_cache_instances/1.json
  def update
    respond_to do |format|
      if @pvp_rank_cache_instance.update(pvp_rank_cache_instance_params)
        format.html { redirect_to @pvp_rank_cache_instance, notice: 'Pvp rank cache instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @pvp_rank_cache_instance }
      else
        format.html { render :edit }
        format.json { render json: @pvp_rank_cache_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pvp_rank_cache_instances/1
  # DELETE /pvp_rank_cache_instances/1.json
  def destroy
    @pvp_rank_cache_instance.destroy
    respond_to do |format|
      format.html { redirect_to pvp_rank_cache_instances_url, notice: 'Pvp rank cache instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pvp_rank_cache_instance
      @pvp_rank_cache_instance = PvpRankCacheInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pvp_rank_cache_instance_params
      params.require(:pvp_rank_cache_instance).permit(:PVP_RANK_CACHE_INSTANCE_NO, :RANK, :CHARACTER_NO, :RATING)
    end
end
