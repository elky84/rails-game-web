class QuestInstancesController < ApplicationController
  before_action :set_quest_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /quest_instances
  # GET /quest_instances.json
  def index
    if params[:search]
      @quest_instances = QuestInstance.search(params[:search])
    else
      @quest_instances = QuestInstance.limit(100)
    end
  end

  # GET /quest_instances/1
  # GET /quest_instances/1.json
  def show
  end

  # GET /quest_instances/new
  def new
    @quest_instance = QuestInstance.new
  end

  # GET /quest_instances/1/edit
  def edit
  end

  # POST /quest_instances
  # POST /quest_instances.json
  def create
    @quest_instance = create_or_update(:QUEST_NO)

    respond_to do |format|
      if @quest_instance.save
        format.html { redirect_to @quest_instance, notice: 'Quest instance was successfully created.' }
        format.json { render :show, status: :created, location: @quest_instance }
      else
        format.html { render :new }
        format.json { render json: @quest_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quest_instances/1
  # PATCH/PUT /quest_instances/1.json
  def update
    respond_to do |format|
      if @quest_instance.update(quest_instance_params)
        format.html { redirect_to @quest_instance, notice: 'Quest instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest_instance }
      else
        format.html { render :edit }
        format.json { render json: @quest_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quest_instances/1
  # DELETE /quest_instances/1.json
  def destroy
    @quest_instance.destroy
    respond_to do |format|
      format.html { redirect_to quest_instances_url, notice: 'Quest instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest_instance
      @quest_instance = QuestInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_instance_params
      params.require(:quest_instance).permit(:QUEST_NO, :TYPE, :QUEST_INFO_ID, :USER_NO, :QUEST_VALUE, :ACTIVE_TIME, :CLEAR, :CLEAR_TIME, :QUEST_APPLY_TYPE, :GRADE, :GROUP_ID)
    end
end
