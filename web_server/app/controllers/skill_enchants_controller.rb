class SkillEnchantsController < ApplicationController
  before_action :set_skill_enchant, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /skill_enchants
  # GET /skill_enchants.json
  def index
    if params[:search]
      @skill_enchants = SkillEnchant.search(params[:search])
    else
      @skill_enchants = SkillEnchant.limit(100)
    end
  end

  # GET /skill_enchants/1
  # GET /skill_enchants/1.json
  def show
  end

  # GET /skill_enchants/new
  def new
    @skill_enchant = SkillEnchant.new
  end

  # GET /skill_enchants/1/edit
  def edit
  end

  # POST /skill_enchants
  # POST /skill_enchants.json
  def create
    @skill_enchant = create_or_update(:SKILL_ENCHANT_ID)

    respond_to do |format|
      if @skill_enchant.save
        format.html { redirect_to @skill_enchant, notice: 'Skill enchant was successfully created.' }
        format.json { render :show, status: :created, location: @skill_enchant }
      else
        format.html { render :new }
        format.json { render json: @skill_enchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_enchants/1
  # PATCH/PUT /skill_enchants/1.json
  def update
    respond_to do |format|
      if @skill_enchant.update(skill_enchant_params)
        format.html { redirect_to @skill_enchant, notice: 'Skill enchant was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_enchant }
      else
        format.html { render :edit }
        format.json { render json: @skill_enchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_enchants/1
  # DELETE /skill_enchants/1.json
  def destroy
    @skill_enchant.destroy
    respond_to do |format|
      format.html { redirect_to skill_enchants_url, notice: 'Skill enchant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_enchant
      @skill_enchant = SkillEnchant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_enchant_params
      params.require(:skill_enchant).permit(:SKILL_ENCHANT_ID, :ENCHANT_NUM, :MONSTER_GRADE, :ENCHANT_RESULT, :ENCHANT_PERCENT, :EQUAL_MONSTER_BONUS, :MONEY)
    end
end
