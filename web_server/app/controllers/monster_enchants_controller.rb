class MonsterEnchantsController < ApplicationController
  before_action :set_monster_enchant, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /monster_enchants
  # GET /monster_enchants.json
  def index
    if params[:search]
      @monster_enchants = MonsterEnchant.search(params[:search])
    else
      @monster_enchants = MonsterEnchant.limit(100)
    end
  end

  # GET /monster_enchants/1
  # GET /monster_enchants/1.json
  def show
  end

  # GET /monster_enchants/new
  def new
    @monster_enchant = MonsterEnchant.new
  end

  # GET /monster_enchants/1/edit
  def edit
  end

  # POST /monster_enchants
  # POST /monster_enchants.json
  def create
    @monster_enchant = create_or_update(:MONSTER_ENCHANT_ID)

    respond_to do |format|
      if @monster_enchant.save
        format.html { redirect_to @monster_enchant, notice: 'Monster enchant was successfully created.' }
        format.json { render :show, status: :created, location: @monster_enchant }
      else
        format.html { render :new }
        format.json { render json: @monster_enchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_enchants/1
  # PATCH/PUT /monster_enchants/1.json
  def update
    respond_to do |format|
      if @monster_enchant.update(monster_enchant_params)
        format.html { redirect_to @monster_enchant, notice: 'Monster enchant was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_enchant }
      else
        format.html { render :edit }
        format.json { render json: @monster_enchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_enchants/1
  # DELETE /monster_enchants/1.json
  def destroy
    @monster_enchant.destroy
    respond_to do |format|
      format.html { redirect_to monster_enchants_url, notice: 'Monster enchant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_enchant
      @monster_enchant = MonsterEnchant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_enchant_params
      params.require(:monster_enchant).permit(:MONSTER_ENCHANT_ID, :MONSTER_GRADE, :ENCHANT_RESULT, :ENCHANT_PERCENT, :EQUAL_MONSTER_SKILL_BONUS, :BASE_EXP, :LEVEL_BONUS_EXP, :EQUAL_MONSTER_EXP_BONUS, :BASE_MONEY, :LEVEL_MONEY)
    end
end
