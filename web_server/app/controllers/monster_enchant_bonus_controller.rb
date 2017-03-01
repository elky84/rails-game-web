class MonsterEnchantBonusController < ApplicationController
  before_action :set_monster_enchant_bonu, only: [:show, :edit, :update, :destroy]

  # GET /monster_enchant_bonus
  # GET /monster_enchant_bonus.json
  def index
    @monster_enchant_bonus = MonsterEnchantBonu.all
  end

  # GET /monster_enchant_bonus/1
  # GET /monster_enchant_bonus/1.json
  def show
  end

  # GET /monster_enchant_bonus/new
  def new
    @monster_enchant_bonu = MonsterEnchantBonu.new
  end

  # GET /monster_enchant_bonus/1/edit
  def edit
  end

  # POST /monster_enchant_bonus
  # POST /monster_enchant_bonus.json
  def create
    @monster_enchant_bonu = MonsterEnchantBonu.new(monster_enchant_bonu_params)

    respond_to do |format|
      if @monster_enchant_bonu.save
        format.html { redirect_to @monster_enchant_bonu, notice: 'Monster enchant bonu was successfully created.' }
        format.json { render :show, status: :created, location: @monster_enchant_bonu }
      else
        format.html { render :new }
        format.json { render json: @monster_enchant_bonu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_enchant_bonus/1
  # PATCH/PUT /monster_enchant_bonus/1.json
  def update
    respond_to do |format|
      if @monster_enchant_bonu.update(monster_enchant_bonu_params)
        format.html { redirect_to @monster_enchant_bonu, notice: 'Monster enchant bonu was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_enchant_bonu }
      else
        format.html { render :edit }
        format.json { render json: @monster_enchant_bonu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_enchant_bonus/1
  # DELETE /monster_enchant_bonus/1.json
  def destroy
    @monster_enchant_bonu.destroy
    respond_to do |format|
      format.html { redirect_to monster_enchant_bonus_url, notice: 'Monster enchant bonu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_enchant_bonu
      @monster_enchant_bonu = MonsterEnchantBonu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_enchant_bonu_params
      params.require(:monster_enchant_bonu).permit(:MONSTER_TYPE, :STATUS_ID)
    end
end
