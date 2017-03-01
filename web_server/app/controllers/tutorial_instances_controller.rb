class TutorialInstancesController < ApplicationController
  before_action :set_tutorial_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /tutorial_instances
  # GET /tutorial_instances.json
  def index
    if params[:search]
      @tutorial_instances = TutorialInstance.search(params[:search])
    else
      @tutorial_instances = TutorialInstance.limit(100)
    end
  end

  # GET /tutorial_instances/1
  # GET /tutorial_instances/1.json
  def show
  end

  # GET /tutorial_instances/new
  def new
    @tutorial_instance = TutorialInstance.new
  end

  # GET /tutorial_instances/1/edit
  def edit
  end

  # POST /tutorial_instances
  # POST /tutorial_instances.json
  def create
    @tutorial_instance = create_or_update(:TUTORIAL_NO)

    respond_to do |format|
      if @tutorial_instance.save
        format.html { redirect_to @tutorial_instance, notice: 'Tutorial instance was successfully created.' }
        format.json { render :show, status: :created, location: @tutorial_instance }
      else
        format.html { render :new }
        format.json { render json: @tutorial_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorial_instances/1
  # PATCH/PUT /tutorial_instances/1.json
  def update
    respond_to do |format|
      if @tutorial_instance.update(tutorial_instance_params)
        format.html { redirect_to @tutorial_instance, notice: 'Tutorial instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorial_instance }
      else
        format.html { render :edit }
        format.json { render json: @tutorial_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorial_instances/1
  # DELETE /tutorial_instances/1.json
  def destroy
    @tutorial_instance.destroy
    respond_to do |format|
      format.html { redirect_to tutorial_instances_url, notice: 'Tutorial instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial_instance
      @tutorial_instance = TutorialInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_instance_params
      params.require(:tutorial_instance).permit(:TUTORIAL_NO, :USER_NO, :FLOW_NO, :GACHA_GET_INSTANCE_NO, :STAGE_GET_INSTANCE_NO)
    end
end
