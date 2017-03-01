class CharacterInstancesController < ApplicationController
  before_action :set_character_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /character_instances
  # GET /character_instances.json
  def index
    if params[:search]
      @character_instances = CharacterInstance.search(params[:search])
    else
      @character_instances = CharacterInstance.limit(100)
    end
  end

  # GET /character_instances/1
  # GET /character_instances/1.json
  def show
  end

  # GET /character_instances/new
  def new
    @character_instance = CharacterInstance.new
  end

  # GET /character_instances/1/edit
  def edit
  end

  # POST /character_instances
  # POST /character_instances.json
  def create
    @character_instance = create_or_update(:CHARACTER_NO)

    respond_to do |format|
      if @character_instance.save
        format.html { redirect_to @character_instance, notice: 'Character instance was successfully created.' }
        format.json { render :show, status: :created, location: @character_instance }
      else
        format.html { render :new }
        format.json { render json: @character_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_instances/1
  # PATCH/PUT /character_instances/1.json
  def update
    respond_to do |format|
      if @character_instance.update(character_instance_params)
        format.html { redirect_to @character_instance, notice: 'Character instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_instance }
      else
        format.html { render :edit }
        format.json { render json: @character_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_instances/1
  # DELETE /character_instances/1.json
  def destroy
    @character_instance.destroy
    respond_to do |format|
      format.html { redirect_to character_instances_url, notice: 'Character instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_instance
      @character_instance = CharacterInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_instance_params
      params.require(:character_instance).permit(:CHARACTER_NO, :USER_NO, :CHARACTER_ID, :LEVEL, :EXP, :LASTEST_ACTIVE_TIME, :MASTERY_GROUP_ID, :PARTY_MONSTER_ID, :STAGE_INSTANCE_NO, :COSTUME_ID)
    end
end
