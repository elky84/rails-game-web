class SkillInstancesController < ApplicationController
  before_action :set_skill_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /skill_instances
  # GET /skill_instances.json
  def index
    if params[:search]
      @skill_instances = SkillInstance.search(params[:search])
    else
      @skill_instances = SkillInstance.limit(100)
    end
  end

  # GET /skill_instances/1
  # GET /skill_instances/1.json
  def show
  end

  # GET /skill_instances/new
  def new
    @skill_instance = SkillInstance.new
  end

  # GET /skill_instances/1/edit
  def edit
  end

  # POST /skill_instances
  # POST /skill_instances.json
  def create
    @skill_instance = create_or_update(:SKILL_NO)

    respond_to do |format|
      if @skill_instance.save
        format.html { redirect_to @skill_instance, notice: 'Skill instance was successfully created.' }
        format.json { render :show, status: :created, location: @skill_instance }
      else
        format.html { render :new }
        format.json { render json: @skill_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_instances/1
  # PATCH/PUT /skill_instances/1.json
  def update
    respond_to do |format|
      if @skill_instance.update(skill_instance_params)
        format.html { redirect_to @skill_instance, notice: 'Skill instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_instance }
      else
        format.html { render :edit }
        format.json { render json: @skill_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_instances/1
  # DELETE /skill_instances/1.json
  def destroy
    @skill_instance.destroy
    respond_to do |format|
      format.html { redirect_to skill_instances_url, notice: 'Skill instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_instance
      @skill_instance = SkillInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_instance_params
      params.require(:skill_instance).permit(:SKILL_NO, :CHARACTER_NO, :SKILL_ID, :SKILL_LEVEL, :SLOT_NO)
    end
end
