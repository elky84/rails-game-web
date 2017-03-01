class MonsterInstancesController < ApplicationController
  before_action :set_monster_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /monster_instances
  # GET /monster_instances.json
  def index
    if params[:search]
      @monster_instances = MonsterInstance.search(params[:search])
    else
      @monster_instances = MonsterInstance.limit(100)
    end
  end

  # GET /monster_instances/1
  # GET /monster_instances/1.json
  def show
  end

  # GET /monster_instances/new
  def new
    @monster_instance = MonsterInstance.new
  end

  # GET /monster_instances/1/edit
  def edit
  end

  # POST /monster_instances
  # POST /monster_instances.json
  def create
    @monster_instance = create_or_update(:MONSTER_NO)

    respond_to do |format|
      if @monster_instance.save
        format.html { redirect_to @monster_instance, notice: 'Monster instance was successfully created.' }
        format.json { render :show, status: :created, location: @monster_instance }
      else
        format.html { render :new }
        format.json { render json: @monster_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_instances/1
  # PATCH/PUT /monster_instances/1.json
  def update
    respond_to do |format|
      if @monster_instance.update(monster_instance_params)
        format.html { redirect_to @monster_instance, notice: 'Monster instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_instance }
      else
        format.html { render :edit }
        format.json { render json: @monster_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_instances/1
  # DELETE /monster_instances/1.json
  def destroy
    @monster_instance.destroy
    respond_to do |format|
      format.html { redirect_to monster_instances_url, notice: 'Monster instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_instance
      @monster_instance = MonsterInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_instance_params
      params.require(:monster_instance).permit(:MONSTER_NO, :USER_NO, :CHARACTER_NO, :MONSTER_ID, :GROW_TYPE_DETAIL, :LEVEL, :EXP, :SKILL, :TEAM_SLOT, :NEW)
    end
end
