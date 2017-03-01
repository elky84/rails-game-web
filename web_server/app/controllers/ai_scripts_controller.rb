class AiScriptsController < ApplicationController
  before_action :set_ai_script, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /ai_scripts
  # GET /ai_scripts.json
  def index
    if params[:search]
      @ai_scripts = AiScript.search(params[:search])
    else
      @ai_scripts = AiScript.limit(100)
    end
  end

  # GET /ai_scripts/1
  # GET /ai_scripts/1.json
  def show
  end

  # GET /ai_scripts/new
  def new
    @ai_script = AiScript.new
  end

  # GET /ai_scripts/1/edit
  def edit
  end

  # POST /ai_scripts
  # POST /ai_scripts.json
  def create
    @ai_script = create_or_update(:index)

    respond_to do |format|
      if @ai_script.save
        format.html { redirect_to @ai_script, notice: 'Ai script was successfully created.' }
        format.json { render :show, status: :created, location: @ai_script }
      else
        format.html { render :new }
        format.json { render json: @ai_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_scripts/1
  # PATCH/PUT /ai_scripts/1.json
  def update
    respond_to do |format|
      if @ai_script.update(ai_script_params)
        format.html { redirect_to @ai_script, notice: 'Ai script was successfully updated.' }
        format.json { render :show, status: :ok, location: @ai_script }
      else
        format.html { render :edit }
        format.json { render json: @ai_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_scripts/1
  # DELETE /ai_scripts/1.json
  def destroy
    @ai_script.destroy
    respond_to do |format|
      format.html { redirect_to ai_scripts_url, notice: 'Ai script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_script
      @ai_script = AiScript.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ai_script_params
      params.require(:ai_script).permit(:index, :ai_type, :protect_object_name, :protect_range, :search_range, :search_enemy_type, :idle_time_stop, :idle_time_random_range, :attack_time_stop, :idle_move_range, :go_away_time, :go_away_plus_random, :state_stay_time, :fixed_idle_stay_time, :skill_use_percent, :attack_after_type, :is_all_include_phase, :is_reset_under_attack, :add_serch_range)
    end
end
