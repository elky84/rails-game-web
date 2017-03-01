class MonsterGradeBonusController < ApplicationController
  before_action :set_monster_grade_bonu, only: [:show, :edit, :update, :destroy]

  # GET /monster_grade_bonus
  # GET /monster_grade_bonus.json
  def index
    @monster_grade_bonus = MonsterGradeBonu.all
  end

  # GET /monster_grade_bonus/1
  # GET /monster_grade_bonus/1.json
  def show
  end

  # GET /monster_grade_bonus/new
  def new
    @monster_grade_bonu = MonsterGradeBonu.new
  end

  # GET /monster_grade_bonus/1/edit
  def edit
  end

  # POST /monster_grade_bonus
  # POST /monster_grade_bonus.json
  def create
    @monster_grade_bonu = MonsterGradeBonu.new(monster_grade_bonu_params)

    respond_to do |format|
      if @monster_grade_bonu.save
        format.html { redirect_to @monster_grade_bonu, notice: 'Monster grade bonu was successfully created.' }
        format.json { render :show, status: :created, location: @monster_grade_bonu }
      else
        format.html { render :new }
        format.json { render json: @monster_grade_bonu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_grade_bonus/1
  # PATCH/PUT /monster_grade_bonus/1.json
  def update
    respond_to do |format|
      if @monster_grade_bonu.update(monster_grade_bonu_params)
        format.html { redirect_to @monster_grade_bonu, notice: 'Monster grade bonu was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_grade_bonu }
      else
        format.html { render :edit }
        format.json { render json: @monster_grade_bonu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_grade_bonus/1
  # DELETE /monster_grade_bonus/1.json
  def destroy
    @monster_grade_bonu.destroy
    respond_to do |format|
      format.html { redirect_to monster_grade_bonus_url, notice: 'Monster grade bonu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_grade_bonu
      @monster_grade_bonu = MonsterGradeBonu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_grade_bonu_params
      params.require(:monster_grade_bonu).permit(:GRADE, :STATUS_ID)
    end
end
