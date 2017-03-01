class StatisticsInstancesController < ApplicationController
  before_action :set_statistics_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /statistics_instances
  # GET /statistics_instances.json
  def index
    if params[:search]
      @statistics_instances = StatisticsInstance.search(params[:search])
    else
      @statistics_instances = StatisticsInstance.limit(100)
    end
  end

  # GET /statistics_instances/1
  # GET /statistics_instances/1.json
  def show
  end

  # GET /statistics_instances/new
  def new
    @statistics_instance = StatisticsInstance.new
  end

  # GET /statistics_instances/1/edit
  def edit
  end

  # POST /statistics_instances
  # POST /statistics_instances.json
  def create
    @statistics_instance = create_or_update(:STATISTICS_NO)

    respond_to do |format|
      if @statistics_instance.save
        format.html { redirect_to @statistics_instance, notice: 'Statistics instance was successfully created.' }
        format.json { render :show, status: :created, location: @statistics_instance }
      else
        format.html { render :new }
        format.json { render json: @statistics_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statistics_instances/1
  # PATCH/PUT /statistics_instances/1.json
  def update
    respond_to do |format|
      if @statistics_instance.update(statistics_instance_params)
        format.html { redirect_to @statistics_instance, notice: 'Statistics instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @statistics_instance }
      else
        format.html { render :edit }
        format.json { render json: @statistics_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics_instances/1
  # DELETE /statistics_instances/1.json
  def destroy
    @statistics_instance.destroy
    respond_to do |format|
      format.html { redirect_to statistics_instances_url, notice: 'Statistics instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statistics_instance
      @statistics_instance = StatisticsInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statistics_instance_params
      params.require(:statistics_instance).permit(:STATISTICS_NO, :TYPE, :VALUE, :INFO, :USER_LV, :DATE)
    end
end
