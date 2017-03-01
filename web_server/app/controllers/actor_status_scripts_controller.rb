class ActorStatusScriptsController < ApplicationController
  before_action :set_actor_status_script, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /actor_status_scripts
  # GET /actor_status_scripts.json
  def index
    if params[:search]
      @actor_status_scripts = ActorStatusScript.search(params[:search])
    else
      @actor_status_scripts = ActorStatusScript.limit(100)
    end
  end

  # GET /actor_status_scripts/1
  # GET /actor_status_scripts/1.json
  def show
  end

  # GET /actor_status_scripts/new
  def new
    @actor_status_script = ActorStatusScript.new
  end

  # GET /actor_status_scripts/1/edit
  def edit
  end

  # POST /actor_status_scripts
  # POST /actor_status_scripts.json
  def create
    @actor_status_script = create_or_update(:index)

    respond_to do |format|
      if @actor_status_script.save
        format.html { redirect_to @actor_status_script, notice: 'Actor status script was successfully created.' }
        format.json { render :show, status: :created, location: @actor_status_script }
      else
        format.html { render :new }
        format.json { render json: @actor_status_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actor_status_scripts/1
  # PATCH/PUT /actor_status_scripts/1.json
  def update
    respond_to do |format|
      if @actor_status_script.update(actor_status_script_params)
        format.html { redirect_to @actor_status_script, notice: 'Actor status script was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor_status_script }
      else
        format.html { render :edit }
        format.json { render json: @actor_status_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actor_status_scripts/1
  # DELETE /actor_status_scripts/1.json
  def destroy
    @actor_status_script.destroy
    respond_to do |format|
      format.html { redirect_to actor_status_scripts_url, notice: 'Actor status script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_status_script
      @actor_status_script = ActorStatusScript.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actor_status_script_params
      params.require(:actor_status_script).permit(:index, :SKILL_TYPE, :scale_x, :scale_y, :spine_name, :ui_sprite_name, :actor_name, :skill_list, :random_skill_list, :random_skill_percent, :shadow, :shadow_scale_x, :shadow_scale_y, :attack_count_max, :ai_index, :die_animation_curve, :die_animation_lenth, :die_animation_speed, :HP, :MP, :ATTACK, :DEFENCE, :HIT, :AVOID, :CRITICAL_HIT, :CRITICAL_AVOID, :CRITICAL_DAMAGE_PERCENT, :REGEN_HEALTH, :REGEN_MP, :MOVE_SPEED_X, :MOVE_SPEED_Z, :ATTACK_SPEED, :RAGE_BASE, :RAGE_REGEN, :COOL_TIME_ALL, :RESIST_POISON, :RESIST_SILENCE, :RESIST_STUN, :RESIST_SLOW, :LEVEL, :VOICE, :OTHER_IDLE_USE, :actor_group_id, :group_rank_id, :special_skill, :special_skill_percent, :DOWN_TIME, :home_ani)
    end
end
