class StageClearInstancesController < ApplicationController
  before_action :set_stage_clear_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /stage_clear_instances
  # GET /stage_clear_instances.json
  def index
    if params[:search]
      @stage_clear_instances = StageClearInstance.search(params[:search])
    else
      @stage_clear_instances = StageClearInstance.limit(100)
    end
  end

  # GET /stage_clear_instances/1
  # GET /stage_clear_instances/1.json
  def show
  end

  # GET /stage_clear_instances/new
  def new
    @stage_clear_instance = StageClearInstance.new
  end

  # GET /stage_clear_instances/1/edit
  def edit
  end

  # POST /stage_clear_instances
  # POST /stage_clear_instances.json
  def create
    @stage_clear_instance = create_or_update(:CHARACTER_NO)

    respond_to do |format|
      if @stage_clear_instance.save
        format.html { redirect_to @stage_clear_instance, notice: 'Stage clear instance was successfully created.' }
        format.json { render :show, status: :created, location: @stage_clear_instance }
      else
        format.html { render :new }
        format.json { render json: @stage_clear_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stage_clear_instances/1
  # PATCH/PUT /stage_clear_instances/1.json
  def update
    respond_to do |format|
      if @stage_clear_instance.update(stage_clear_instance_params)
        format.html { redirect_to @stage_clear_instance, notice: 'Stage clear instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @stage_clear_instance }
      else
        format.html { render :edit }
        format.json { render json: @stage_clear_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_clear_instances/1
  # DELETE /stage_clear_instances/1.json
  def destroy
    @stage_clear_instance.destroy
    respond_to do |format|
      format.html { redirect_to stage_clear_instances_url, notice: 'Stage clear instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage_clear_instance
      @stage_clear_instance = StageClearInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_clear_instance_params
      params.require(:stage_clear_instance).permit(:USER_NO, :CHARACTER_NO, :PLAY_STAGE, :CLEAR_STAGE, :STAGE_SCORE, :LAST_DATE)
    end
end
