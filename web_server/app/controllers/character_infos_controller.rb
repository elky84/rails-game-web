class CharacterInfosController < ApplicationController
  before_action :set_character_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /character_infos
  # GET /character_infos.json
  def index
    if params[:search]
      @character_infos = CharacterInfo.search(params[:search])
    else
      @character_infos = CharacterInfo.limit(100)
    end
  end

  # GET /character_infos/1
  # GET /character_infos/1.json
  def show
  end

  # GET /character_infos/new
  def new
    @character_info = CharacterInfo.new
  end

  # GET /character_infos/1/edit
  def edit
  end

  # POST /character_infos
  # POST /character_infos.json
  def create
    @character_info = create_or_update(:CHARACTER_ID)

    respond_to do |format|
      if @character_info.save
        format.html { redirect_to @character_info, notice: 'Character info was successfully created.' }
        format.json { render :show, status: :created, location: @character_info }
      else
        format.html { render :new }
        format.json { render json: @character_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_infos/1
  # PATCH/PUT /character_infos/1.json
  def update
    respond_to do |format|
      if @character_info.update(character_info_params)
        format.html { redirect_to @character_info, notice: 'Character info was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_info }
      else
        format.html { render :edit }
        format.json { render json: @character_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_infos/1
  # DELETE /character_infos/1.json
  def destroy
    @character_info.destroy
    respond_to do |format|
      format.html { redirect_to character_infos_url, notice: 'Character info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_info
      @character_info = CharacterInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_info_params
      params.require(:character_info).permit(:CHARACTER_ID, :TYPE, :GROW_TYPE_DETAIL, :EQUIP_TYPE, :NAME, :EXPLAIN, :ACTOR_ID, :PRICE, :RELEASE)
    end
end
