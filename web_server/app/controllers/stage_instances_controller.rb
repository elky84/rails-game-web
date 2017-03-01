class StageInstancesController < ApplicationController
  before_action :set_stage_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /stage_instances
  # GET /stage_instances.json
  def index
    if params[:search]
      @stage_instances = StageInstance.search(params[:search])
    else
      @stage_instances = StageInstance.limit(100)
    end
  end

  # GET /stage_instances/1
  # GET /stage_instances/1.json
  def show
  end

  # GET /stage_instances/new
  def new
    @stage_instance = StageInstance.new
  end

  # GET /stage_instances/1/edit
  def edit
  end

  # POST /stage_instances
  # POST /stage_instances.json
  def create
    @stage_instance = create_or_update(:STAGE_PROGRESS_NO)

    respond_to do |format|
      if @stage_instance.save
        format.html { redirect_to @stage_instance, notice: 'Stage instance was successfully created.' }
        format.json { render :show, status: :created, location: @stage_instance }
      else
        format.html { render :new }
        format.json { render json: @stage_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stage_instances/1
  # PATCH/PUT /stage_instances/1.json
  def update
    respond_to do |format|
      if @stage_instance.update(stage_instance_params)
        format.html { redirect_to @stage_instance, notice: 'Stage instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @stage_instance }
      else
        format.html { render :edit }
        format.json { render json: @stage_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_instances/1
  # DELETE /stage_instances/1.json
  def destroy
    @stage_instance.destroy
    respond_to do |format|
      format.html { redirect_to stage_instances_url, notice: 'Stage instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage_instance
      @stage_instance = StageInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_instance_params
      params.require(:stage_instance).permit(:STAGE_PROGRESS_NO, :USER_NO, :CHARACTER_NO, :PARTY_MONSTER_ID, :STAGE_ID, :CLEAR_EXP_NO, :CLEAR_MONEY_NO, :CLEAR_REWARD_NO, :START_DATE)
    end
end
