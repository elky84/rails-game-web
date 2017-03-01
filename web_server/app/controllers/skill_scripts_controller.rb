class SkillScriptsController < ApplicationController
  before_action :set_skill_script, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /skill_scripts
  # GET /skill_scripts.json
  def index
    if params[:search]
      @skill_scripts = SkillScript.search(params[:search])
    else
      @skill_scripts = SkillScript.limit(100)
    end
  end

  # GET /skill_scripts/1
  # GET /skill_scripts/1.json
  def show
  end

  # GET /skill_scripts/new
  def new
    @skill_script = SkillScript.new
  end

  # GET /skill_scripts/1/edit
  def edit
  end

  # POST /skill_scripts
  # POST /skill_scripts.json
  def create
    @skill_script = create_or_update(:SKILL_ID)

    respond_to do |format|
      if @skill_script.save
        format.html { redirect_to @skill_script, notice: 'Skill script was successfully created.' }
        format.json { render :show, status: :created, location: @skill_script }
      else
        format.html { render :new }
        format.json { render json: @skill_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_scripts/1
  # PATCH/PUT /skill_scripts/1.json
  def update
    respond_to do |format|
      if @skill_script.update(skill_script_params)
        format.html { redirect_to @skill_script, notice: 'Skill script was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_script }
      else
        format.html { render :edit }
        format.json { render json: @skill_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_scripts/1
  # DELETE /skill_scripts/1.json
  def destroy
    @skill_script.destroy
    respond_to do |format|
      format.html { redirect_to skill_scripts_url, notice: 'Skill script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_script
      @skill_script = SkillScript.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_script_params
      params.require(:skill_script).permit(:SKILL_ID, :CHARACTER_TYPE, :SKILL_CATEGORY, :TYPE, :LEVEL, :LEARN_LEVEL, :SKILL_GROUP_ID, :PRE_SKILL, :PASSIVE_APPLY_SKILL, :LEARN_CONDITION, :ICON, :NAME, :EXPLAIN, :ACTIVE_ID, :TRIGGER, :SKILL_REACTION_ID, :RANGE_CHECK_REACTION_INDEX, :SKILL_OPTION_ID, :POWER, :SPEND_MP, :SPEND_HP)
    end
end
